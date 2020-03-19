package com.example.demo.controller.student;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		return "student/register/register";
	}

	// Register to save user
	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("account") @Valid Users account, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "student/register/register";
		} else {
			if (!account.getPassword().equals(account.getConfirmPassword())) {
				model.addAttribute("notmatch", "Password is not match");
				return "student/register/register";
			}
			if (usersService.CkAccount(account.getEmail()) != null) {
				model.addAttribute("emailExist", "Email is existed");
				return "student/register/register";
			} else {
				account.setRole("4");
				account.setActive(1);
				usersService.save(account);
				return "redirect:/login";
			}
		}

	}
}
