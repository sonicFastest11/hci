package com.example.demo.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.constant.IConstant;
import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String welcome() {
		return IConstant.ADMIN_HOME;
	}

	@RequestMapping(value = "/listAllUsers", method = RequestMethod.GET)
	public String listAllUsers(Model model) {
		List<Users> listUsers = usersService.listAllUsers();
		model.addAttribute("listUsers", listUsers);

		return IConstant.LIST_USERS;
	}

	@RequestMapping(value = "/newUsers", method = RequestMethod.GET)
	public String createUsers(Model model) {
		Users user = new Users();
		model.addAttribute("user", user);

		return IConstant.ADMIN_NEW_USER_FORM;
	}

	// Register to save user
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") @Valid Users user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return IConstant.ADMIN_NEW_USER_FORM;
		} else {
			if (!user.getPassword().equals(user.getConfirmPassword())) {
				model.addAttribute("notmatch", IConstant.PASSWORD_NOT_MATCH);
				return IConstant.ADMIN_NEW_USER_FORM;
			}
			if (usersService.CkAccount(user.getEmail()) != null) {
				model.addAttribute("emailExist", IConstant.EXISTED_EMAIL);
				return IConstant.ADMIN_NEW_USER_FORM;
			} else {
				user.setRole("4");
				user.setActive(IConstant.ACTIVE_ACCOUNT);
				usersService.save(user);
				return IConstant.REDIRECT_LIST_USERS;
			}
		}

	}

	// update User
	@RequestMapping(value = "/editUser/{id}")
	public String editUser(@PathVariable long id, Model model) {
		Users user = usersService.get(id);
		model.addAttribute("user", user);

		return IConstant.ADMIN_EDIT_USER_FORM;
	}

	@RequestMapping(value = "/saveUsers", method = RequestMethod.POST)
	public String save(@ModelAttribute("user") @Valid Users user, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return IConstant.ADMIN_EDIT_USER_FORM;
		} else {

			usersService.save(user);

			return IConstant.REDIRECT_LIST_USERS;
		}
	}

	// delete User
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id) {
		usersService.delete(id);

		return IConstant.REDIRECT_LIST_USERS;
	}

	// Lock User
	@RequestMapping(value = "/lockUser/{id}", method = RequestMethod.GET)
	public String lockAccount(@PathVariable("id") long id) {
		Users user = usersService.get(id);
		user.setActive(IConstant.DEACTIVE_ACCOUNT);
		usersService.save(user);

		return IConstant.REDIRECT_LIST_USERS;

	}

}
