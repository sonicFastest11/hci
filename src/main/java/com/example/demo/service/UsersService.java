package com.example.demo.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.example.demo.entity.Users;

public interface UsersService {

	public List<Users> listAllUsers();

	public void save(Users user);

	public Users get(long id);

	public void delete(long id);

	public Users findUserToLogin(String email, String password);

	public Users CkAccount(String email);

}
