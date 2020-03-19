package com.example.demo.constant;

public interface IConstant {
	public final String SQL_CHECK_ACCOUNT_REGISTER = "SELECT u FROM Users u where u.email = :email";
	public final String SQL_CHECK_LOGIN = "SELECT u FROM Users u where u.email = :email and u.password = :password";
	
	public final int STATUS_ACCOUNT = 1;
}
