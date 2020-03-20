package com.example.demo.controller.student;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.constant.IConstant;
import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;

@Controller
public class RegisterController {

	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		Users account = new Users();
		model.addAttribute("account", account);

		return IConstant.STUDENT_REGISTER_FORM;
	}

	// Register to save user
	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("account") @Valid Users account, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return IConstant.STUDENT_REGISTER_FORM;
		} else {
			if (!account.getPassword().equals(account.getConfirmPassword())) {
				model.addAttribute(IConstant.MESSAGE_NOT_MATCH, IConstant.PASSWORD_NOT_MATCH);
				return IConstant.STUDENT_REGISTER_FORM;
			}
			if (usersService.CkAccount(account.getEmail()) != null) {
				model.addAttribute(IConstant.MESSAGE_EMAIL_EXISTED, IConstant.EXISTED_EMAIL);
				return IConstant.STUDENT_REGISTER_FORM;
			} else {
				account.setRole("4");
				account.setActive(IConstant.ACTIVE_ACCOUNT);
				usersService.save(account);
				return IConstant.MOVE_LOGIN_FORM;
			}
		}

	}
}
