package com.example.demo.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.constant.IConstant;
import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;

@Controller
public class LoginController {
	@Autowired
	private UsersService usersService;

	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		Users userLogin = new Users();
		model.addAttribute("userLogin", userLogin);
		return "common/login/login";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("userLogin") Users userLogin, Model model, HttpSession session) {
		Users userLog = usersService.findUserToLogin(userLogin.getEmail(), userLogin.getPassword());
		if ((userLog != null) && (userLog.getActive() == IConstant.STATUS_ACCOUNT)) {
			session.setAttribute("userLogName", userLog.getEmail());
			session.setAttribute("userRole", userLog.getRole());
			return "redirect:/index";

		} else {
			model.addAttribute("messageLogin", "Wrong email or password");
			return "common/login/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest rq, HttpSession session) {
		session = rq.getSession();
		session.removeAttribute("userLogName");
		session.removeAttribute("userRole");
		return "redirect:/index";
	}

}
