package com.fastcampus.persistence;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fastcampus.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	// SELECT * FROM user WHERE username = ?;
	Optional<User> findByUsername(String username);

}
