package devsu.devops.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import devsu.devops.demo.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	boolean existsByDni(String dni);
}
