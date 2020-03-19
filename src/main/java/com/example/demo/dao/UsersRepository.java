package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.constant.IConstant;
import com.example.demo.entity.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {

	@Query(IConstant.SQL_CHECK_LOGIN)
	public Users findUserToLogin(@Param("email") String email, @Param("password") String password);
	
	@Query(IConstant.SQL_CHECK_ACCOUNT_REGISTER)
	public Users CkAccount(@Param("email") String email);

}
