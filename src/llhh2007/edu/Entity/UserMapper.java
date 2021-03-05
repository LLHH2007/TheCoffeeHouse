package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User User = new User();
		User.setId(rs.getInt("id"));
		User.setUsername(rs.getString("username"));
		User.setPassword(rs.getString("password"));
		User.setEnabled(rs.getInt("enabled"));
		User.setName(rs.getString("name"));
		User.setPhoneNumber(rs.getString("phoneNumber"));
		return User;
	}
}