package devsu.devops.demo.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import devsu.devops.demo.exception.BadRequestException;
import devsu.devops.demo.exception.ResourceNotFoundException;

import lombok.extern.log4j.Log4j2;

@Log4j2
@ControllerAdvice
public class RestResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

	@ExceptionHandler({ResourceNotFoundException.class})
    public ResponseEntity<Object> handleNotFoundException(Exception exception, WebRequest request){
		log.error(exception.getMessage());
    	return new ResponseEntity<Object>(errorBody(exception.getMessage()), new HttpHeaders(), HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler({BadRequestException.class})
    public ResponseEntity<Object> handleBadRequestException(Exception exception, WebRequest request){
		log.error(exception.getMessage());
    	return new ResponseEntity<Object>(errorBody(exception.getMessage()), new HttpHeaders(), HttpStatus.BAD_REQUEST);
	}

	@ExceptionHandler({IllegalArgumentException.class, IllegalStateException.class, MethodArgumentTypeMismatchException.class})
	public ResponseEntity<Object> handleConflict(Exception exception, WebRequest request) {
		log.error(exception.getMessage());
    	return new ResponseEntity<Object>(errorBody(exception.getMessage()), new HttpHeaders(), HttpStatus.BAD_REQUEST);
	}

	@Override
	public ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException exception, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
		Map<String, Object> body = new LinkedHashMap<>();
        List<String> errors = ((BindException) exception).getBindingResult()
                .getFieldErrors()
                .stream()
                .map(x -> x.getField() + ": " + x.getDefaultMessage())
                .collect(Collectors.toList());
        body.put("errors", errors);
	    return new ResponseEntity<Object>(body, new HttpHeaders(), HttpStatus.BAD_REQUEST);
	}

	@ExceptionHandler(DataIntegrityViolationException.class)
	public ResponseEntity<Object> handleDataIntegrityViolation(Exception exception, WebRequest request) {
		return new ResponseEntity<Object>(errorBody(exception.getCause().toString()), new HttpHeaders(), HttpStatus.BAD_REQUEST);
	}

	private Map<String, Object> errorBody(String error) {
		Map<String, Object> body = new LinkedHashMap<>();
		List<String> errors = new ArrayList<String>();
		errors.add(error);
		body.put("errors", errors);
		return body;
	}
}
