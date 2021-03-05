package llhh2007.edu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import llhh2007.edu.Dto.CartDTO;
import llhh2007.edu.Entity.Bill;
import llhh2007.edu.Service.BillService;
import llhh2007.edu.Service.CartService;

@Controller
@RequestMapping(value = "/user")
public class CartController extends BaseController {
	@Autowired
	private CartService cartService = new CartService();

	@Autowired
	private BillService billService = new BillService();

	@RequestMapping(value = "/addCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable String id,
			@RequestParam(value = "quantity", required = false, defaultValue = "1") int quantity) {
		HashMap<String, CartDTO> cart = (HashMap<String, CartDTO>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartDTO>();
		}
		cart = cartService.AddCart(id, cart, quantity);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantityCart", cartService.TotalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");// lấy previous link
	}

	@RequestMapping(value = { "/cart" })
	public ModelAndView cart() {
		_mvShare.setViewName("user/cart");
		return _mvShare;
	}

	@RequestMapping(value = { "/editCart/{id}/{quantity}" })
	public ModelAndView editCart(HttpServletRequest request, HttpSession session, @PathVariable String id,
			@PathVariable int quantity) {
		HashMap<String, CartDTO> cart = (HashMap<String, CartDTO>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartDTO>();
		}
		cart = cartService.EditCart(id, quantity, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantityCart", cartService.TotalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		_mvShare.setViewName("user/cart");
		return _mvShare;
	}

	@RequestMapping(value = "/deleteCart/{id}")
	public String deleteCart(HttpServletRequest request, HttpSession session, @PathVariable String id) {
		HashMap<String, CartDTO> cart = (HashMap<String, CartDTO>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartDTO>();
		}
		cart = cartService.DeleteCart(id, cart);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantityCart", cartService.TotalQuantity(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");// lấy previous link
	}

	@RequestMapping(value = "/checkOut")
	public ModelAndView checkOut(HttpServletRequest request, HttpSession session, Model model) {
		HashMap<String, CartDTO> cart = (HashMap<String, CartDTO>) session.getAttribute("cart");
		String username = request.getUserPrincipal().getName();
		if (cart == null || cart.size() == 0) {
			cart = new HashMap<String, CartDTO>();
			model.addAttribute("message","Bạn chưa chọn sản phẩm!");
		} else {
			cart = billService.addBill(new Bill(username), cart);
			session.setAttribute("cart", cart);
			session.removeAttribute("totalPriceCart");
			session.removeAttribute("totalQuantityCart");
			model.addAttribute("message","Thanh toán thành công!");
		}
			_mvShare.addObject("bill",billService.findBillByUser(username));
			_mvShare.addObject("billDetails",billService.findBillDetailsByUser(username));
			_mvShare.setViewName("user/shoppingHistory");
		return _mvShare;
	}
	
	@RequestMapping(value = { "/shoppingHistory" })
	public ModelAndView shoppingHistory(HttpServletRequest request) {
		_mvShare.setViewName("user/shoppingHistory");
		String username = request.getUserPrincipal().getName();
		_mvShare.addObject("bill",billService.findBillByUser(username));
		_mvShare.addObject("billDetails",billService.findBillDetailsByUser(username));
		return _mvShare;
	}
}
