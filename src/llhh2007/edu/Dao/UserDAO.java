package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.User;
import llhh2007.edu.Entity.UserMapper;

@Repository
@Transactional
public class UserDAO extends BaseDAO {

	public boolean save(User User) {
		try {
			String sql = "INSERT INTO User (username, password, enabled, name, phoneNumber) VALUES (?, ?, ?, ?, ?)";
			boolean isSuccess = jdbcTemplate.update(sql, User.getUsername(), "{noop}" + User.getPassword(), 1,
					User.getName(), User.getPhoneNumber()) > 0;
			if (isSuccess) {
				String sql2 = "insert into users_roles(user,role) value ((select id from user where username=?),2)";
				return jdbcTemplate.update(sql2, User.getUsername()) > 0;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}

	public User findByUserName(String username) {
		String sql = "SELECT * FROM User WHERE username = ?";
		return jdbcTemplate.queryForObject(sql, new UserMapper(), username);
	}
	
	public boolean findByUsernameAndPassword(String username,String password) {
		String sql = "SELECT * FROM User WHERE username = ? and password=?";
		return jdbcTemplate.query(sql, new UserMapper(), username,"{noop}"+password).size()>0;
	}
	
	public boolean update(User User) {
		String sql = "UPDATE User SET name = ?, phoneNumber = ? WHERE username = ? ";
		return jdbcTemplate.update(sql, User.getName(), User.getPhoneNumber(),User.getUsername())>0;
	}
	
	public boolean updatePassword(String username, String newPassword) {
		String sql = "UPDATE User SET password = ? WHERE username = ? ";
		return jdbcTemplate.update(sql, "{noop}"+newPassword, username)>0;
	}

	public List<User> findAll() {
		String sql = "SELECT * FROM User";
		return jdbcTemplate.query(sql, new UserMapper());
	}
//	public void delete(int id) {
//		String sql = "DELETE FROM User WHERE id = " + id;
//		jdbcTemplate.update(sql);
//	}

//	public void delete(String name) {
//		String sql = "DELETE FROM User WHERE name = " + name;
//		jdbcTemplate.update(sql);
//	}



//
//	public List<User> findByIdCategory(String categoryId) {
//		String sql = "SELECT * FROM User WHERE category = ?";
//		return jdbcTemplate.query(sql, new UserMapper(), categoryId);
//	}
//

//
//	public List<User> findAllNew() {
//		String sql = "SELECT * FROM User sort order by date desc limit 6";
//		return jdbcTemplate.query(sql, new UserMapper());
//	}
//
//	public List<User> findByPageId(int pageId, int total) {
//		String sql = "SELECT * FROM User limit ?,?";
//		return jdbcTemplate.query(sql, new UserMapper(), pageId - 1, total);
//	}
//
//	public List<User> findByCategoryByPageId(String category, int pageId, int total) {
//		String sql = "SELECT * FROM User where category = ? limit ?,?";
//		return jdbcTemplate.query(sql, new UserMapper(), category, pageId - 1, total);
//	}
}