package devsu.devops.demo.service.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import devsu.devops.demo.entity.User;
import devsu.devops.demo.service.dto.UserDto;

@Component
public class UserMapper {

	@Autowired
    private ModelMapper modelMapper;

	public UserDto toDto(User user) {
		UserDto userDto = modelMapper.map(user, UserDto.class);
	    return userDto;
	}

	public User toEntity(UserDto userDto) {
		User user = modelMapper.map(userDto, User.class);
	    return user;
	}
}
