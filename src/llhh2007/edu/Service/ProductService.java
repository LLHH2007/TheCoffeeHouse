package llhh2007.edu.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dao.ProductDAO;
import llhh2007.edu.Entity.Product;

@Service
@Transactional
public class ProductService implements IProductService{
	@Autowired
	private ProductDAO ProductDAO;

	public List<Product> findAll() {
		return ProductDAO.findAll();
	}

	public Product findById(String id) {
		return ProductDAO.findById(id);
	}

	public int save(Product Product) {
		// validate business
		return ProductDAO.save(Product);
	}

	public boolean update(Product Product) {
		// validate business
		return ProductDAO.update(Product);
	}

	public boolean delete(String id) {
		// validate business
		return ProductDAO.delete(id);
	}

	public List<Product> findAllByCategory(String categoryId) {
		return ProductDAO.findByIdCategory(categoryId);
	}

	public List<Product> findAllNew() {
		return ProductDAO.findAllNew();
	}

	public List<Product> findByPageId(int pageId,int total) {
		return ProductDAO.findByPageId(pageId,total);
	}
	
	public List<Product> findByCategoryByPageId(String category,int pageId,int total) {
		return ProductDAO.findByCategoryByPageId(category,pageId,total);
	}
	
	public List<String> findPageLink(int total) {
		int numOfProduct = ProductDAO.findAll().size();
		int numOfPage = numOfProduct%total==0?numOfProduct/total:numOfProduct/total+1;
		List<String> ls = new ArrayList<String>();
		for(int i = 1; i <= numOfPage; i++) {
			ls.add("/product/"+i);
		}
		return ls;
	}
	
	public List<String> findPageLinkCategory(String categoryId, int total) {
		int numOfProduct = ProductDAO.findByIdCategory(categoryId).size();
		int numOfPage = numOfProduct%total==0?numOfProduct/total:numOfProduct/total+1;
		List<String> ls = new ArrayList<String>();
		for(int i = 1; i <= numOfPage; i++) {
			ls.add("/product/category/"+categoryId+"/"+i);
		}
		return ls;
	}
}
