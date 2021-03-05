package llhh2007.edu.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseDAO {
	@Autowired
	public JdbcTemplate jdbcTemplate;
}
