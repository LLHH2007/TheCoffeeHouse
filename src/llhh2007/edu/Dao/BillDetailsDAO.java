package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dto.BillDetails;
import llhh2007.edu.Dto.BillDetailsMapper;

@Repository
@Transactional
public class BillDetailsDAO extends BaseDAO{

	public void save(BillDetails BillDetails,double price) {
		String sql = "INSERT INTO BillDetails (bill,product,quantity,totalPrice) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, BillDetails.getBill(),BillDetails.getProduct(),BillDetails.getQuantity(),price*BillDetails.getQuantity());
	}
	
	public List<BillDetails> findAll() {
		String sql = "SELECT b.id,b.bill,p.name as product,b.quantity,b.totalPrice FROM BillDetails b inner join Product p on b.product=p.id";
		return jdbcTemplate.query(sql, new BillDetailsMapper());
	}
	
	public List<BillDetails> findByUser(String user) {
		String sql = "SELECT bd.id,bd.bill,p.name as product,bd.quantity,bd.totalPrice FROM BillDetails bd inner join Product p on bd.product=p.id inner join Bill b on bd.bill=b.id where b.user = ?";
		return jdbcTemplate.query(sql, new BillDetailsMapper(),user);
	}
}