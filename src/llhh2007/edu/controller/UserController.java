package llhh2007.edu.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import llhh2007.edu.Entity.User;
import llhh2007.edu.Service.BillService;
import llhh2007.edu.Service.HomeService;
import llhh2007.edu.Service.UserService;

@Controller
@RequestMapping(value= {"/user"})
public class UserController extends BaseController{
	@Autowired
	HomeService homeSlideService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BillService billService;
	
	@RequestMapping(value={"","/home"})
	public ModelAndView userHome(HttpSession session,HttpServletRequest request) {
		_mvShare.addObject("homeslide",homeSlideService.findAll());
		_mvShare.addObject("newProduct",productService.findAllNew());
		_mvShare.setViewName("user/home");
        return _mvShare;
	}
	
	@RequestMapping(value = {"/allProductView"})
    public ModelAndView fourColumn(Model model) {
		_mvShare.addObject("product",productService.findAll());
		_mvShare.setViewName("user/allProductView");
        return _mvShare;
    }
	
	@RequestMapping(value = { "/general" })
	public ModelAndView general(Model model) {
		_mvShare.setViewName("user/general");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/listView" })
	public ModelAndView listView() {
		_mvShare.setViewName("user/listView");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/product" })
	public ModelAndView product() {
		_mvShare.setViewName("user/product");
		_mvShare.addObject("activePage", 1);
		_mvShare.addObject("linkOfPage",productService.findPageLink(6));
		_mvShare.addObject("productByPageId",productService.findByPageId(1, 6));
		return _mvShare;
	}
	
	@RequestMapping(value = { "/product/{pageId}" })
	public ModelAndView product(@PathVariable int pageId) {
		int productPerPage=6;
		_mvShare.addObject("activePage", pageId);
		if(pageId==1) {
			
		}else {
			pageId=(pageId-1)*productPerPage+1;
		}
		_mvShare.setViewName("user/product");
		_mvShare.addObject("linkOfPage",productService.findPageLink(6));
		_mvShare.addObject("productByPageId",productService.findByPageId(pageId, productPerPage));
		return _mvShare;
	}
	
	@RequestMapping(value = { "/product/category/{id}" })
	public ModelAndView gridView(@PathVariable String id) {
		_mvShare.setViewName("user/product");
		_mvShare.addObject("activePage", 1);
		_mvShare.addObject("linkOfPage",productService.findPageLinkCategory(id,6));
		_mvShare.addObject("productByPageId",productService.findByCategoryByPageId(id,1,6));
		return _mvShare;
	}
	
	@RequestMapping(value = { "/product/category/{id}/{pageId}" })
	public ModelAndView productByCategoryByPageID(@PathVariable String id,@PathVariable int pageId) {
		int productPerPage=6;
		_mvShare.addObject("activePage", pageId);
		if(pageId==1) {
			
		}else {
			pageId=(pageId-1)*productPerPage+1;
		}
		_mvShare.setViewName("user/product");
		_mvShare.addObject("linkOfPage",productService.findPageLinkCategory(id,6));
		_mvShare.addObject("productByPageId",productService.findByCategoryByPageId(id,pageId, productPerPage));
		return _mvShare;
	}
	
	@RequestMapping(value = {"/productDetails/{id}"})
    public ModelAndView productDetails(@PathVariable String id) {
		_mvShare.setViewName("user/productDetails");
		_mvShare.addObject("viewedProduct", productService.findById(id));
		_mvShare.addObject("relatedProduct",productService.findAllByCategory(productService.findById(id).getCategory()));
		_mvShare.addObject("categoryName",categoryService.findById(productService.findById(id).getCategory()).getName());
        return _mvShare;
    }
	
	@RequestMapping(value = { "/contact" })
	public ModelAndView Contact() {
		_mvShare.setViewName("contact");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/userInformation" })
	public ModelAndView userInformation(HttpServletRequest request,Model model) {
		_mvShare.setViewName("user/userInformation");
		_mvShare.addObject("userInfo",userService.findByUserName(request.getUserPrincipal().getName()));
		model.addAttribute("userUpdate", new User());
		return _mvShare;
	}
	
	@RequestMapping(value = { "/userInformation/update" },method = RequestMethod.POST)
	public ModelAndView updateUserInformation(HttpServletRequest request,@ModelAttribute("userUpdate") @Valid User user,BindingResult result,Model model ) {
		if (result.hasErrors()) {
			model.addAttribute("message","Cập nhật thất bại");
		    }
		else {
			if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())) {
				userService.update(user);
				model.addAttribute("message","Cập nhật thành công");
			}else {
				model.addAttribute("message","Mật khẩu sai");
			}
		}
		_mvShare.addObject("userInfo",userService.findByUserName(request.getUserPrincipal().getName()));
		model.addAttribute("userUpdate", new User());
		_mvShare.setViewName("user/userInformation");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/userInformation/changePassword" },method = RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request,@RequestParam("oldPassword") String oldPassword,@RequestParam("newPassword") String newPassword ,Model model,@ModelAttribute("userUpdate") User user) {
		_mvShare.setViewName("user/userInformation");
		if(userService.findByUsernameAndPassword(request.getUserPrincipal().getName(), oldPassword)) {
			userService.updatePassword(request.getUserPrincipal().getName(), newPassword);
			model.addAttribute("message","Cập nhật mật khẩu thành công!");
		}else {
			model.addAttribute("message","Mật khẩu sai!");
		}
		return _mvShare;
	}
}
