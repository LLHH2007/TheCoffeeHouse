package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuMapper implements RowMapper<Menu> {
	public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
		Menu Menu = new Menu();
		Menu.setId(rs.getInt("id"));
		Menu.setName(rs.getString("name"));
		Menu.setUrl(rs.getString("url"));
		return Menu;
	}
}
