package llhh2007.edu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import llhh2007.edu.Entity.User;
import llhh2007.edu.Service.UserService;

@Controller
public class LoginController extends BaseController {
	@Autowired
	UserService userService;

	@RequestMapping(value = { "/login" })
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
		if (error != null) {
			model.addAttribute("message", "Login Failed!");
		}
		if (!model.containsAttribute("userRegister")) {
		      model.addAttribute("userRegister", new User());
		    }
		return "login";
	}


	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		model.addAttribute("userRegister", new User());
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request,@ModelAttribute("userRegister") @Valid User user,BindingResult result,Model model) {
		if (result.hasErrors()) {
			model.addAttribute("mess","Đăng ký tài khoản thất bại");
			model.addAttribute("register",true);
		    }
		else {
			if(userService.save(user)) {
				model.addAttribute("message","Đăng ký tài khoản thành công!");
				model.addAttribute("userRegister", new User());
			}
			else {
				model.addAttribute("mess","Đăng ký tài khoản thất bại!");
				model.addAttribute("register",true);
			}
		}
		return "login"; 
	}

}
