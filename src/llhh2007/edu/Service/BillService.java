package llhh2007.edu.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import llhh2007.edu.Dao.BillDAO;
import llhh2007.edu.Dao.BillDetailsDAO;
import llhh2007.edu.Dto.BillDetails;
import llhh2007.edu.Dto.CartDTO;
import llhh2007.edu.Entity.Bill;

@Service
public class BillService implements IBillService{
	@Autowired
	private BillDAO billDAO = new BillDAO();
	
	@Autowired
	private BillDetailsDAO billDetailsDAO = new BillDetailsDAO();
	
	public HashMap<String,CartDTO> addBill(Bill bill, HashMap<String,CartDTO> listCart) {
		bill=billDAO.save(bill);
		int id = billDAO.findLastBill();
		double totalPriceBill=0;
		for (CartDTO cart : listCart.values()) {
			billDetailsDAO.save(new BillDetails(id,cart.getProduct().getId(),cart.getQuantity(),cart.getTotalPrice()), cart.getProduct().getPrice());
			totalPriceBill+=cart.getTotalPrice();
		}
		billDAO.update(id, totalPriceBill);
		return new HashMap<String,CartDTO>();
	}
	
	public List<BillDetails> findAllBillDetails(){
		return billDetailsDAO.findAll();
	}
	
	public List<Bill> findAllBill(){
		return billDAO.findAll();
	}
	
	public List<Bill> findBillByUser(String user){
		return billDAO.findByUser(user);
	}
	
	public List<BillDetails> findBillDetailsByUser(String user){
		return billDetailsDAO.findByUser(user);
	}
}
