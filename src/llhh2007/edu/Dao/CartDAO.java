package llhh2007.edu.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dto.CartDTO;
import llhh2007.edu.Entity.Product;

@Repository
@Transactional
public class CartDAO extends BaseDAO{
	@Autowired
	ProductDAO productDAO = new ProductDAO();
	
	@Autowired
	CategoryDAO categoryDAO = new CategoryDAO();
	
	public HashMap<String,CartDTO> AddCart(String id, HashMap<String,CartDTO> cart, int quantity) {
		CartDTO itemCart = new CartDTO();
		Product product = productDAO.findById(id);
		if(product!=null && cart.containsKey(id)) {
			itemCart =cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity()+quantity);
			itemCart.setTotalPrice(itemCart.getQuantity()*itemCart.getProduct().getPrice());
		}else {
			itemCart.setProduct(product);
			itemCart.setQuantity(quantity);
			itemCart.setTotalPrice(product.getPrice()*quantity);
			itemCart.setCategoryName(categoryDAO.findById(product.getCategory()).getName());
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	public HashMap<String,CartDTO> EditCart(String id,int quantity, HashMap<String,CartDTO> cart) {
		if(cart==null)
			return cart;
		CartDTO itemCart = new CartDTO();
		if(cart.containsKey(id)) {
			itemCart=cart.get(id);
			itemCart.setQuantity(quantity);
			itemCart.setTotalPrice(quantity*itemCart.getProduct().getPrice());
		}
		cart.put(id, itemCart);//if product existed, replace it
		return cart;
	}
	
	public HashMap<String,CartDTO> DeleteCart(String id, HashMap<String,CartDTO> cart) {
		if(cart==null)
			return cart;
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	public int TotalQuantity(HashMap<String, CartDTO> cart) {
		int totalQuantity=0;
		for(Map.Entry<String, CartDTO> itemCart : cart.entrySet()) {
			totalQuantity+=itemCart.getValue().getQuantity();
		}
		return totalQuantity;
	}
	
	public double TotalPrice(HashMap<String, CartDTO> cart) {
		double totalPrice=0;
		for(Map.Entry<String, CartDTO> itemCart : cart.entrySet()) {
			totalPrice+=itemCart.getValue().getTotalPrice();
		}
		return totalPrice;
	}
}
