package llhh2007.edu.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BillDetailsMapper implements RowMapper<BillDetails> {
	public BillDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		BillDetails BillDetails = new BillDetails();
		BillDetails.setId(rs.getInt("id"));
		BillDetails.setBill(rs.getInt("bill"));
		BillDetails.setProduct(rs.getString("product"));
		BillDetails.setQuantity(rs.getInt("quantity"));
		BillDetails.setTotalPrice(rs.getDouble("totalPrice"));
		return BillDetails;
	}
}