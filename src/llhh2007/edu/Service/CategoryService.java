package llhh2007.edu.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.Category;
import llhh2007.edu.Dao.CategoryDAO;

@Service
@Transactional
public class CategoryService implements ICategoryService{
  @Autowired
  private CategoryDAO CategoryDAO;
  
  public List<Category> findAll() {
    return CategoryDAO.findAll();
  }
  public Category findById(String id) {
    return CategoryDAO.findById(id);
  }
  
  public void save(Category Category){
    // validate business
    CategoryDAO.save(Category);
  }
  public void update(Category Category){
    // validate business
    CategoryDAO.update(Category);
  }
  
  public void delete(int id){
    // validate business
    CategoryDAO.delete(id);
  }
}
