package llhh2007.edu.Service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import llhh2007.edu.Dto.CartDTO;

@Service
public interface ICartService {
	public HashMap<String,CartDTO> AddCart(String id, HashMap<String,CartDTO> cart, int Quantity);
	public HashMap<String,CartDTO> EditCart(String id,int quantity, HashMap<String,CartDTO> cart);
	public HashMap<String,CartDTO> DeleteCart(String id, HashMap<String,CartDTO> cart);
	public int TotalQuantity(HashMap<String, CartDTO> cart);
	public double TotalPrice(HashMap<String, CartDTO> cart);
}
