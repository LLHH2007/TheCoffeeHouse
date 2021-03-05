package llhh2007.edu.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Dto.BillDetails;
import llhh2007.edu.Dto.CartDTO;
import llhh2007.edu.Entity.Bill;

@Service
public interface IBillService {
	public HashMap<String,CartDTO> addBill(Bill bill, HashMap<String,CartDTO> listCart);
	public List<BillDetails> findAllBillDetails();
	public List<Bill> findAllBill();
	public List<Bill> findBillByUser(String user);
	public List<BillDetails> findBillDetailsByUser(String user);
}
