package llhh2007.edu.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dao.UserDAO;
import llhh2007.edu.Entity.User;

@Service
@Transactional
public class UserService implements IUserService{
	@Autowired
	private UserDAO UserDAO;

	public boolean save(User User) {
		//User.setPassword(BCrypt.hashpw(User.getPassword(), BCrypt.gensalt(12)));//m� h�a 
		return UserDAO.save(User);
	}
	
	public int findIdByUsername(String username) {
		return UserDAO.findByUserName(username).getId();
	}
	
	public User findByUserName(String username) {
		return UserDAO.findByUserName(username);
	}
	
	public boolean findByUsernameAndPassword(String username, String password) {
		return UserDAO.findByUsernameAndPassword(username,password);
	}
	
	public boolean update(User user) {
		return UserDAO.update(user);
	}
	
	public boolean updatePassword(String username, String newPassword) {
		return UserDAO.updatePassword(username,newPassword);
	}
	
	public List<User> findAll(){
		return UserDAO.findAll();
	}
}