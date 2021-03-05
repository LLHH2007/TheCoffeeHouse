package llhh2007.edu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import llhh2007.edu.Dto.ProductDTO;
import llhh2007.edu.Entity.Product;
import llhh2007.edu.Service.BillService;
import llhh2007.edu.Service.UserService;

@Controller
@RequestMapping(value = { "/admin" })
public class AdminController extends BaseController {
	@Autowired
	UserService userService = new UserService();

	@Autowired
	BillService billService = new BillService();

	@RequestMapping(value = { "", "/home" })
	public ModelAndView adminHome(HttpSession session, HttpServletRequest request) {
		session.setAttribute("adminCheck", "checked");
		_mvShare.setViewName("admin/home");
		return _mvShare;
	}

	@RequestMapping(value = { "/allProduct" })
	public ModelAndView allProduct(Model model) {
		_mvShare.addObject("product", productService.findAll());
		_mvShare.setViewName("admin/allProductView");
		return _mvShare;
	}

	@RequestMapping(value = { "/product" })
	public ModelAndView product() {
		_mvShare.setViewName("admin/product");
		_mvShare.addObject("activePage", 1);
		_mvShare.addObject("linkOfPage", productService.findPageLink(6));
		_mvShare.addObject("productByPageId", productService.findByPageId(1, 6));
		return _mvShare;
	}

	@RequestMapping(value = { "/product/{pageId}" })
	public ModelAndView product(@PathVariable int pageId) {
		int productPerPage = 6;
		_mvShare.addObject("activePage", pageId);
		if (pageId == 1) {

		} else {
			pageId = (pageId - 1) * productPerPage + 1;
		}
		_mvShare.setViewName("admin/product");
		_mvShare.addObject("linkOfPage", productService.findPageLink(6));
		_mvShare.addObject("productByPageId", productService.findByPageId(pageId, productPerPage));
		return _mvShare;
	}

	@RequestMapping(value = { "/product/category/{id}" })
	public ModelAndView gridView(@PathVariable String id) {
		_mvShare.setViewName("admin/product");
		_mvShare.addObject("activePage", 1);
		_mvShare.addObject("linkOfPage", productService.findPageLinkCategory(id, 6));
		_mvShare.addObject("productByPageId", productService.findByCategoryByPageId(id, 1, 6));
		return _mvShare;
	}

	@RequestMapping(value = { "/product/category/{id}/{pageId}" })
	public ModelAndView productByCategoryByPageID(@PathVariable String id, @PathVariable int pageId) {
		int productPerPage = 6;
		_mvShare.addObject("activePage", pageId);
		if (pageId == 1) {

		} else {
			pageId = (pageId - 1) * productPerPage + 1;
		}
		_mvShare.setViewName("admin/product");
		_mvShare.addObject("linkOfPage", productService.findPageLinkCategory(id, 6));
		_mvShare.addObject("productByPageId", productService.findByCategoryByPageId(id, pageId, productPerPage));
		return _mvShare;
	}

	@RequestMapping(value = { "/productDetails/{id}" })
	public ModelAndView productDetails(@PathVariable String id) {
		_mvShare.setViewName("admin/productDetails");
		_mvShare.addObject("viewedProduct", productService.findById(id));
		_mvShare.addObject("relatedProduct",
				productService.findAllByCategory(productService.findById(id).getCategory()));
		_mvShare.addObject("categoryName",
				categoryService.findById(productService.findById(id).getCategory()).getName());
		return _mvShare;
	}

	@RequestMapping(value = { "/revenue" })
	public ModelAndView revenue(HttpSession session, HttpServletRequest request) {
		_mvShare.addObject("bill", billService.findAllBill());
		_mvShare.setViewName("admin/revenue");
		return _mvShare;
	}

	@RequestMapping(value = { "/billDetails" })
	public ModelAndView billDetails(HttpSession session, HttpServletRequest request) {
		_mvShare.setViewName("admin/billDetails");
		_mvShare.addObject("billDetails", billService.findAllBillDetails());
		return _mvShare;
	}

	@RequestMapping(value = { "/user" })
	public ModelAndView user(HttpSession session, HttpServletRequest request) {
		_mvShare.addObject("user", userService.findAll());
		_mvShare.setViewName("admin/user");
		return _mvShare;
	}

	@RequestMapping(value = { "/editProduct/{id}" })
	public ModelAndView editProduct(@PathVariable String id, Model model) {
		_mvShare.setViewName("admin/editProduct");
		model.addAttribute("viewedProduct", productService.findById(id));
		model.addAttribute("category", categoryService.findAll());
		return _mvShare;
	}

	@RequestMapping(value = { "/editProduct" }, method = RequestMethod.POST)
	public ModelAndView handleEditProduct(HttpSession session, @ModelAttribute("viewedProduct") Product product,
			@RequestParam CommonsMultipartFile file, Model model) throws Exception {
		String filename = file.getOriginalFilename();
		if (!filename.equals("")) {
			String UPLOAD_DIRECTORY = "/assets/img";
			ServletContext context = session.getServletContext();
			String path = context.getRealPath(UPLOAD_DIRECTORY);
			byte[] bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(path + File.separator + filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();
			product.setImg(filename);
		}
		if (productService.update(product)) {
			model.addAttribute("message", "Cập nhật sản phẩm thành công");
		} else {
			model.addAttribute("message", "Cập nhật sản phẩm thất bại");
		}
		_mvShare.setViewName("admin/productDetails");
		_mvShare.addObject("viewedProduct", productService.findById(product.getId()));
		_mvShare.addObject("relatedProduct",
				productService.findAllByCategory(productService.findById(product.getId()).getCategory()));
		_mvShare.addObject("categoryName",
				categoryService.findById(productService.findById(product.getId()).getCategory()).getName());
		return _mvShare;
	}

	@RequestMapping(value = { "/deleteProduct" }, method = RequestMethod.POST)
	public ModelAndView deleteProduct(@RequestParam("productId") String id, Model model) {
		_mvShare.setViewName("admin/product");
		if (productService.delete(id)) {
			model.addAttribute("message", "Xóa sản phẩm thành công");
		} else {
			model.addAttribute("message", "Xóa sản phẩm thất bại");
		}
		_mvShare.addObject("activePage", 1);
		_mvShare.addObject("linkOfPage", productService.findPageLink(6));
		_mvShare.addObject("productByPageId", productService.findByPageId(1, 6));
		return _mvShare;
	}

	@RequestMapping(value = { "/addProduct" })
	public ModelAndView addNewProduct(HttpSession session, HttpServletRequest request, Model model) {
		_mvShare.setViewName("admin/addProduct");
		model.addAttribute("newProduct",new ProductDTO());
		return _mvShare;
	}

	@RequestMapping(value = { "/addProduct" }, method = RequestMethod.POST)
	public ModelAndView handleAddProduct(HttpServletRequest request, HttpSession session,
			@ModelAttribute("newProduct") ProductDTO productDTO, @RequestParam CommonsMultipartFile file, Model model)
			throws Exception {
		Product product = new Product();
		product.setId(productDTO.getId());
		product.setName(productDTO.getName());
		product.setCategory(productDTO.getCategory());
		product.setDate(new Date());
		product.setDescription(productDTO.getDescription());
		product.setDetails(productDTO.getDetails());
		product.setPrice(productDTO.getPrice());
		product.setTitle(productDTO.getTitle());
		String UPLOAD_DIRECTORY = "/assets/img";
		ServletContext context = session.getServletContext();
		String path = context.getRealPath(UPLOAD_DIRECTORY);
		String filename = file.getOriginalFilename();
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();
		product.setImg(filename);
		if (productService.save(product) > 0) {
			model.addAttribute("message", "Cập nhật sản phẩm thành công");
			_mvShare.setViewName("admin/productDetails");
			_mvShare.addObject("viewedProduct", productService.findById(product.getId()));
			_mvShare.addObject("relatedProduct",
					productService.findAllByCategory(productService.findById(product.getId()).getCategory()));
			_mvShare.addObject("categoryName",
					categoryService.findById(productService.findById(product.getId()).getCategory()).getName());
		} else {
			model.addAttribute("message", "Cập nhật sản phẩm thất bại");
			_mvShare.setViewName("redirect:" + request.getHeader("Referer"));// lấy previous link
		}
		return _mvShare;
	}
}
