package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.Category;
import llhh2007.edu.Entity.CategoryMapper;

@Repository
@Transactional
public class CategoryDAO extends BaseDAO{
	
  public void save(Category category) {
    String sql = "INSERT INTO category (id, name) VALUES (?, ?)";
    jdbcTemplate.update(sql, category.getId(), category.getName());
  }
  public void delete(int id) {
    String sql = "DELETE FROM category WHERE id = " + id;
    jdbcTemplate.update(sql);
  }
  
  public void delete(String name) {
	    String sql = "DELETE FROM category WHERE name = " + name;
	    jdbcTemplate.update(sql);
	  }
  
  public void update(Category category) {
    String sql = "UPDATE category SET name = ? WHERE id = ? ";
    jdbcTemplate.update(sql, category.getName(),category.getId());
  }
  public Category findById(String id) {
    String sql = "SELECT * FROM category WHERE id = ?";
    return jdbcTemplate.queryForObject(sql, new CategoryMapper(), id);
  }
  public List<Category> findAll() {
    String sql = "SELECT * FROM category";
    return jdbcTemplate.query(sql, new CategoryMapper());
  }
}
