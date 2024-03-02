package devsu.devops.demo.service;

import java.util.List;

import devsu.devops.demo.service.dto.UserDto;

public interface UserService {

	public List<UserDto> findAll();
	public UserDto findById(Long id);
	public UserDto save(UserDto userDto);
}
