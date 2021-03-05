package llhh2007.edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Entity.Category;

@Service
public interface ICategoryService {
	public List<Category> findAll();
	public Category findById(String id);
	public void save(Category Category);
	public void update(Category Category);
	public void delete(int id);
}
