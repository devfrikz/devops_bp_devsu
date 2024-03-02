package devsu.devops.demo.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import devsu.devops.demo.entity.User;
import devsu.devops.demo.exception.BadRequestException;
import devsu.devops.demo.exception.ResourceNotFoundException;
import devsu.devops.demo.repository.UserRepository;
import devsu.devops.demo.service.dto.UserDto;
import devsu.devops.demo.service.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;
	private final UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserRepository userRepository, UserMapper userMapper) {
		this.userRepository = userRepository;
		this.userMapper = userMapper;
	}

	@Override
	public List<UserDto> findAll() {
		List<User> users = userRepository.findAll();
		return users.stream()
				.map(user -> userMapper.toDto(user))
				.collect(Collectors.toList());
	}

	@Override
	public UserDto findById(Long id) {
		User user = userRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found: " + id));
		return userMapper.toDto(user);
	}

	@Override
	public UserDto save(UserDto userDto) {
		if (userRepository.existsByDni(userDto.getDni())) {
			throw(new BadRequestException("User already exists"));
		}
		User user = userRepository.save(userMapper.toEntity(userDto));
		return userMapper.toDto(user);
	}

}
