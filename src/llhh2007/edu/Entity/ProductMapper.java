package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<Product> {
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product Product = new Product();
		Product.setId(rs.getString("id"));
		Product.setName(rs.getString("name"));
		Product.setCategory(rs.getString("category"));
		Product.setPrice(rs.getInt("price"));
		Product.setDescription(rs.getString("description"));
		Product.setTitle(rs.getString("title"));
		Product.setDetails(rs.getString("details"));
		Product.setImg(rs.getString("img"));
		Product.setDate(rs.getDate("date"));
		return Product;
	}
}