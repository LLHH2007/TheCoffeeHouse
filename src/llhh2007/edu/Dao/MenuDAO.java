package llhh2007.edu.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import llhh2007.edu.Entity.Menu;
import llhh2007.edu.Entity.MenuMapper;

@Repository
@Transactional
public class MenuDAO extends BaseDAO{
  public List<Menu> findAll() {
    String sql = "SELECT * FROM Menu";
    return jdbcTemplate.query(sql, new MenuMapper());
  }
}
