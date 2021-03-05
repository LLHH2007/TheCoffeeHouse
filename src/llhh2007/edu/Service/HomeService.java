package llhh2007.edu.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Dao.HomeSlideDAO;
import llhh2007.edu.Entity.HomeSlide;

@Service
@Transactional
public class HomeService implements IHomeService{
  @Autowired
  private HomeSlideDAO HomeSlideDAO;
  
  public List<HomeSlide> findAll() {
    return HomeSlideDAO.findAll();
  }
}
