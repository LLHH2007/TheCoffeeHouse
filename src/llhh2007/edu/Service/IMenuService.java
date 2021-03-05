package llhh2007.edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Entity.Menu;

@Service
public interface IMenuService {
	public List<Menu> findAll();
}
