package llhh2007.edu.Dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.Bill;
import llhh2007.edu.Entity.BillMapper;

@Repository
@Transactional
public class BillDAO extends BaseDAO {

	public Bill save(Bill Bill) {
		String sql = "INSERT INTO Bill (user,date) VALUES (?, ?)";
		jdbcTemplate.update(sql, Bill.getUser(), new Date());
		return Bill;
	}

	public int findLastBill() {
		String sql = "SELECT * FROM Bill ORDER BY id DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new BillMapper()).getId();
	}

	public void update(int id, double totalPrice) {
		String sql = "UPDATE bill SET totalPrice = ? WHERE id = ? ";
		jdbcTemplate.update(sql, totalPrice, id);
	}

	public List<Bill> findAll() {
		String sql = "SELECT * FROM Bill";
		return jdbcTemplate.query(sql, new BillMapper());
	}
	
	public List<Bill> findByUser(String user) {
		String sql = "SELECT * FROM Bill where user=?";
		return jdbcTemplate.query(sql, new BillMapper(),user);
	}
}
