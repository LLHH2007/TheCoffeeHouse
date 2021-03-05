package llhh2007.edu.controller;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import llhh2007.edu.Service.CategoryService;
import llhh2007.edu.Service.MenuService;
import llhh2007.edu.Service.ProductService;

@Controller
public class BaseController {
	@Autowired
	MenuService menuService;
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	
	
	public ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init() {
		_mvShare.addObject("menu",menuService.findAll());
		_mvShare.addObject("product",productService.findAll());
		_mvShare.addObject("category", categoryService.findAll());
		return _mvShare;
	}
}
