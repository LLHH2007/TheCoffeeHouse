package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CategoryMapper implements RowMapper<Category> {
	public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
		Category Category = new Category();
		Category.setId(rs.getString("id"));
		Category.setName(rs.getString("name"));
		return Category;
	}
}
