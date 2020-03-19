package com.example.demo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UsersRepository;
import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersRepository usersRepository;

	@Override
	public List<Users> listAllUsers() {
		return usersRepository.findAll();
	}

	@Override
	public void save(Users user) {
		usersRepository.save(user);

	}

	@Override
	public Users get(long id) {
		return usersRepository.findById(id).get();
	}

	@Override
	public void delete(long id) {
		usersRepository.deleteById(id);
	}

	@Override
	public Users findUserToLogin(String email, String password) {
		return usersRepository.findUserToLogin(email, password);
	}

	@Override
	public Users CkAccount(String email) {
		return usersRepository.CkAccount(email);
	}

}
