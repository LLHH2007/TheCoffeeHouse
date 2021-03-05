package llhh2007.edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Entity.Product;

@Service
public interface IProductService {
	public List<Product> findAll();
	public Product findById(String id);
	public int save(Product Product);
	public boolean update(Product Product);
	public boolean delete(String id);
	public List<Product> findAllByCategory(String categoryId);
	public List<Product> findAllNew();
	public List<Product> findByPageId(int pageId,int total);
	public List<Product> findByCategoryByPageId(String category,int pageId,int total);
	public List<String> findPageLink(int total);
	public List<String> findPageLinkCategory(String categoryId, int total);
}
