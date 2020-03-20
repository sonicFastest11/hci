package com.example.demo.constant;

public interface IConstant {
	public final String SQL_CHECK_ACCOUNT_REGISTER = "SELECT u FROM Users u where u.email = :email";
	public final String SQL_CHECK_LOGIN = "SELECT u FROM Users u where u.email = :email and u.password = :password";
	
	//message
	public final String PASSWORD_NOT_MATCH = "Password is not match";
	public final String EXISTED_EMAIL = "Email is existed";
	public final String LOGIN_ERROR = "Wrong email or password";
	
	
	public final int ACTIVE_ACCOUNT = 1;
	public final int DEACTIVE_ACCOUNT = 0;
	
	//userController
	public final String REDIRECT_LIST_USERS = "redirect:/listAllUsers";
	public final String ADMIN_HOME = "admin/home/home";
	public final String LIST_USERS = "admin/users/listUsers";
	public final String ADMIN_NEW_USER_FORM = "admin/users/newUsers";
	public final String ADMIN_EDIT_USER_FORM = "admin/users/editUsers";
	
	//loginController
	public final String RETURN_INDEX = "index";
	public final String REDIRECT_INDEX = "redirect:/index";
	public final String RETURN_LOGIN_FORM = "common/login/login";
	
	//registerController
	
	public final String STUDENT_REGISTER_FORM = "student/register/register";
	public final String MOVE_LOGIN_FORM = "redirect:/login";
	public final String MESSAGE_NOT_MATCH = "notmatch";
	public final String MESSAGE_EMAIL_EXISTED = "emailExist";
}
