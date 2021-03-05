package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.Product;
import llhh2007.edu.Entity.ProductMapper;

@Repository
@Transactional
public class ProductDAO extends BaseDAO{

	public int save(Product Product) {
		String sql = "INSERT INTO Product (id, name, category, price, description, title, details,img,date) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, Product.getId(), Product.getName(), Product.getCategory(), Product.getPrice(),
				Product.getDescription(), Product.getTitle(), Product.getDetails(), Product.getImg(),java.time.LocalDate.now());
	}


	public boolean delete(String id) {
		String sql = "DELETE FROM Product WHERE id = ?";
		return jdbcTemplate.update(sql,id)>0;
	}

	public boolean update(Product Product) {
		String sql = "UPDATE Product SET name = ?, category = ?, price = ?, description = ?, title = ?, details = ?, img = ?, date=? WHERE id = ? ";
		return jdbcTemplate.update(sql, Product.getName(), Product.getCategory(), Product.getPrice(),
				Product.getDescription(), Product.getTitle(), Product.getDetails(), Product.getImg(), Product.getDate(),Product.getId())>0;
	}

	public Product findById(String id) {
		String sql = "SELECT * FROM Product WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new ProductMapper(), id);
	}
	
	public List<Product> findByIdCategory(String categoryId) {
		String sql = "SELECT * FROM Product WHERE category = ?";
		return jdbcTemplate.query(sql, new ProductMapper(), categoryId);
	}
	

	public List<Product> findAll() {
		String sql = "SELECT * FROM Product";
		return jdbcTemplate.query(sql, new ProductMapper());
	}
	
	public List<Product> findAllNew() {
		String sql = "SELECT * FROM Product sort order by date desc limit 6";
		return jdbcTemplate.query(sql, new ProductMapper());
	}
	
	public List<Product> findByPageId(int pageId,int total) {
		String sql = "SELECT * FROM Product limit ?,?";
		return jdbcTemplate.query(sql, new ProductMapper(),pageId-1,total);
	}
	
	public List<Product> findByCategoryByPageId(String category,int pageId,int total) {
		String sql = "SELECT * FROM Product where category = ? limit ?,?";
		return jdbcTemplate.query(sql, new ProductMapper(),category,pageId-1,total);
	}
}
