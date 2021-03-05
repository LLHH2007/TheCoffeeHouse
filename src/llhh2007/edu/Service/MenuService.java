package llhh2007.edu.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dao.MenuDAO;
import llhh2007.edu.Entity.Menu;

@Service
@Transactional
public class MenuService implements IMenuService{
  @Autowired
  private MenuDAO MenuDAO;
  
  public List<Menu> findAll() {
    return MenuDAO.findAll();
  }
}
