package devsu.devops.demo.repository;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import devsu.devops.demo.entity.User;

@DataJpaTest
public class UserRepositoryTest {

	@Autowired
	private TestEntityManager entityManager;

	@Autowired
	private UserRepository userRepository;

	@Test
	public void findById_thenReturnClient() {

		User user = User.builder()
				.name("Test1")
				.dni("0999999999")
				.build();

		entityManager.persist(user);
		entityManager.flush();

		User userResult = userRepository.findById((long) 4).orElseThrow();

		assertThat(userResult.getName())
			.isEqualTo(user.getName());
		assertThat(userResult.getDni())
			.isEqualTo(user.getDni());
	}
}
