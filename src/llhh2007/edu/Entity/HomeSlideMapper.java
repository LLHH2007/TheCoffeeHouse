package llhh2007.edu.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class HomeSlideMapper implements RowMapper<HomeSlide> {
	public HomeSlide mapRow(ResultSet rs, int rowNum) throws SQLException {
		HomeSlide HomeSlide = new HomeSlide();
		HomeSlide.setId(rs.getInt("id"));
		HomeSlide.setImg(rs.getString("img"));
		HomeSlide.setCaption(rs.getString("caption"));
		HomeSlide.setContent(rs.getString("content"));
		return HomeSlide;
	}
}
