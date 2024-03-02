package devsu.devops.demo.service.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {

	@JsonProperty(access = Access.READ_ONLY)
	private Long id;

	@NotBlank(message = "DNI is mandatory")
	@Size(min = 10, max = 13)
	private String dni;

	@NotBlank(message = "Name is mandatory")
	@Size(min = 5, max = 30)
	private String name;
}
