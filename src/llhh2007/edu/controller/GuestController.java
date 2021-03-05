package llhh2007.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import llhh2007.edu.Service.HomeService;


@Controller
public class GuestController extends BaseController{

	@Autowired
	HomeService homeSlideService;
	
	@RequestMapping(value = {"/home",""})
    public ModelAndView home(HttpServletRequest request) {
		if(request.getUserPrincipal()==null) {
			_mvShare.addObject("homeslide",homeSlideService.findAll());
			_mvShare.addObject("newProduct",productService.findAllNew());
			_mvShare.setViewName("guest/home");
		}else {
			
			_mvShare.setViewName("redirect: /user/home");
		}
        return _mvShare;
    }
	
	@RequestMapping(value = { "/general"})
	public ModelAndView general(Model model, HttpServletRequest request) {
		if(request.getUserPrincipal()==null) {
			_mvShare.setViewName("guest/general");
		}else {
			
			_mvShare.setViewName("redirect: /user/general");
		}
		
		return _mvShare;
	}
	
	@RequestMapping(value = {"/allProductView"})
    public ModelAndView allProduct(HttpServletRequest request,Model model) {
		
		if(request.getUserPrincipal()==null) {
			_mvShare.addObject("product",productService.findAll());
			_mvShare.setViewName("guest/allProductView");
		}else {
			_mvShare.setViewName("redirect: /user/allProductView");
		}
        return _mvShare;
    }
	
	@RequestMapping(value = { "/contact" })
	public ModelAndView contact(HttpServletRequest request) {
		
		if(request.getUserPrincipal()==null) {
			_mvShare.setViewName("guest/contact");
		}else {
			_mvShare.setViewName("redirect: /user/contact");
		}
		return _mvShare;
	}
}
