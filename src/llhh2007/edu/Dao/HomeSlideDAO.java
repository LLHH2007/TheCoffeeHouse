package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.HomeSlide;
import llhh2007.edu.Entity.HomeSlideMapper;

@Repository
@Transactional
public class HomeSlideDAO extends BaseDAO{

  public List<HomeSlide> findAll() {
    String sql = "SELECT * FROM HomeSlide";
    return jdbcTemplate.query(sql, new HomeSlideMapper());
  }
}
