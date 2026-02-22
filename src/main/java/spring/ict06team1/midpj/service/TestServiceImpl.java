package spring.ict06team1.midpj.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.ict06team1.midpj.dao.TestDAO;
import spring.ict06team1.midpj.dto.TestUserDTO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO dao; 
	
	@Override
	public void getAddressInfo_1(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - getAddressInfo_1");
		
		List<TestUserDTO> list = dao.getAddressInfo_1(); 
		model.addAttribute("list", list);
	}

	@Override
	public void getAddressInfo_2(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - getAddressInfo_2");
	}
}
