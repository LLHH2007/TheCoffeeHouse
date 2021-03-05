package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BillMapper implements RowMapper<Bill> {
	public Bill mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bill Bill = new Bill();
		Bill.setId(rs.getInt("id"));
		Bill.setUser(rs.getString("user"));
		Bill.setDate(rs.getDate("date"));
		Bill.setTotalPrice(rs.getDouble("totalPrice"));
		return Bill;
	}
}