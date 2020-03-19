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

import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String welcome() {
		return "admin/home/home";
	}

	@RequestMapping(value = "/listAllUsers", method = RequestMethod.GET)
	public String listAllUsers(Model model) {
		List<Users> listUsers = usersService.listAllUsers();
		model.addAttribute("listUsers", listUsers);

		return "admin/users/listUsers";
	}

	@RequestMapping(value = "/newUsers", method = RequestMethod.GET)
	public String createUsers(Model model) {
		Users user = new Users();
		model.addAttribute("user", user);

		return "admin/users/newUsers";
	}

	// Register to save user
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") @Valid Users user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/users/newUsers";
		} else {
			if (!user.getPassword().equals(user.getConfirmPassword())) {
				model.addAttribute("notmatch", "Password is not match");
				return "admin/users/newUsers";
			}
			if (usersService.CkAccount(user.getEmail()) != null) {
				model.addAttribute("emailExist", "Email is existed");
				return "admin/users/newUsers";
			} else {
				user.setActive(1);
				user.setRole("4");
				usersService.save(user);
				return "redirect:/listAllUsers";
			}
		}

	}

	// update User
	@RequestMapping(value = "/editUser/{id}")
	public String editUser(@PathVariable long id, Model model) {
		Users user = usersService.get(id);
		model.addAttribute("user", user);

		return "admin/users/editUsers";
	}

	@RequestMapping(value = "/saveUsers", method = RequestMethod.POST)
	public String save(@ModelAttribute("user") @Valid Users user, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "admin/users/editUsers";
		} else {

			usersService.save(user);

			return "redirect:/listAllUsers";
		}
	}

	// delete User
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id) {
		usersService.delete(id);

		return "redirect:/listAllUsers";
	}

	// Lock User
	@RequestMapping(value = "/lockUser/{id}", method = RequestMethod.GET)
	public String lockAccount(@PathVariable("id") long id) {
		Users user = usersService.get(id);
		user.setActive(0);
		usersService.save(user);

		return "redirect:/listAllUsers";

	}

}
