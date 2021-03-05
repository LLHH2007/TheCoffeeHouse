package llhh2007.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController extends BaseController {

	@RequestMapping(value = { "/product" })
	public ModelAndView product(HttpServletRequest request) {
		if (request.getUserPrincipal() == null) {
			_mvShare.setViewName("guest/product");
			_mvShare.addObject("activePage", 1);
			_mvShare.addObject("linkOfPage", productService.findPageLink(6));
			_mvShare.addObject("productByPageId", productService.findByPageId(1, 6));
		} else {
			_mvShare.setViewName("redirect: /user/product");
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/product/{pageId}" })
	public ModelAndView product(HttpServletRequest request, @PathVariable int pageId) {
		if (request.getUserPrincipal() == null) {
			int productPerPage = 6;
			_mvShare.addObject("activePage", pageId);
			if (pageId == 1) {

			} else {
				pageId = (pageId - 1) * productPerPage + 1;
			}
			_mvShare.setViewName("guest/product");
			_mvShare.addObject("linkOfPage", productService.findPageLink(6));
			_mvShare.addObject("productByPageId", productService.findByPageId(pageId, productPerPage));
		} else {
			_mvShare.setViewName("redirect: /user/product/" + pageId);
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/product/category/{id}" })
	public ModelAndView productByCategory(HttpServletRequest request, @PathVariable String id) {
		if (request.getUserPrincipal() == null) {
			_mvShare.setViewName("guest/product");
			_mvShare.addObject("activePage", 1);
			_mvShare.addObject("linkOfPage", productService.findPageLinkCategory(id, 6));
			_mvShare.addObject("productByPageId", productService.findByCategoryByPageId(id, 1, 6));
		} else {
			_mvShare.setViewName("redirect: /user/category/" + id);
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/product/category/{id}/{pageId}" })
	public ModelAndView productByCategoryByPageID(HttpServletRequest request, @PathVariable String id,
			@PathVariable int pageId) {
		if (request.getUserPrincipal() == null) {
			int productPerPage = 6;
			_mvShare.addObject("activePage", pageId);
			if (pageId == 1) {

			} else {
				pageId = (pageId - 1) * productPerPage + 1;
			}
			_mvShare.setViewName("guest/product");
			_mvShare.addObject("linkOfPage", productService.findPageLinkCategory(id, 6));
			_mvShare.addObject("productByPageId", productService.findByCategoryByPageId(id, pageId, productPerPage));
		} else {
			_mvShare.setViewName("redirect: /user/product/category/" + id + "/" + pageId);
		}
		return _mvShare;
	}

	@RequestMapping(value = { "/productDetails/{id}" })
	public ModelAndView productDetails(@PathVariable String id, HttpServletRequest request) {

		if (request.getUserPrincipal() == null) {
			_mvShare.setViewName("guest/productDetails");
			_mvShare.addObject("viewedProduct", productService.findById(id));
			_mvShare.addObject("relatedProduct",
					productService.findAllByCategory(productService.findById(id).getCategory()));
			_mvShare.addObject("categoryName",
					categoryService.findById(productService.findById(id).getCategory()).getName());
		} else {

			_mvShare.setViewName("redirect: /user/productDetails/"+id);
		}
		return _mvShare;
	}
}
