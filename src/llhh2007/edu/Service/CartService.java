package llhh2007.edu.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import llhh2007.edu.Dao.CartDAO;
import llhh2007.edu.Dto.CartDTO;

@Service
public class CartService implements ICartService{
	@Autowired
	private CartDAO cartDAO = new CartDAO();

	@Override
	public HashMap<String, CartDTO> AddCart(String id, HashMap<String, CartDTO> cart, int quantity) {
		return cartDAO.AddCart(id, cart, quantity);
	}

	@Override
	public HashMap<String, CartDTO> EditCart(String id, int quantity, HashMap<String, CartDTO> cart) {

		return cartDAO.EditCart(id, quantity, cart);
	}

	@Override
	public HashMap<String, CartDTO> DeleteCart(String id, HashMap<String, CartDTO> cart) {

		return cartDAO.DeleteCart(id, cart);
	}

	@Override
	public int TotalQuantity(HashMap<String, CartDTO> cart) {
		return cartDAO.TotalQuantity(cart);
	}

	@Override
	public double TotalPrice(HashMap<String, CartDTO> cart) {
		return cartDAO.TotalPrice(cart);
	}
	
}
