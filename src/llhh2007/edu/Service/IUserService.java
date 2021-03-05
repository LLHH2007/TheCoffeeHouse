package llhh2007.edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Entity.User;

@Service
public interface IUserService {
	public boolean save(User User);
	public int findIdByUsername(String username);
	public User findByUserName(String username);
	public boolean findByUsernameAndPassword(String username, String password);
	public boolean update(User user);
	public boolean updatePassword(String username, String newPassword);
	public List<User> findAll();
}
