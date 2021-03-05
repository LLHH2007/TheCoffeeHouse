package llhh2007.edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import llhh2007.edu.Entity.HomeSlide;

@Service
public interface IHomeService {
	public List<HomeSlide> findAll();
}
