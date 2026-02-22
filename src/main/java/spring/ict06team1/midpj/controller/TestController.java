package spring.ict06team1.midpj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.ict06team1.midpj.service.TestServiceImpl;

@Controller
public class TestController {
	
	@Autowired
	private TestServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping("/getAddressInfo_1")
	public String getAddressInfo_1(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url => /getAddressInfo_1 >>>"); 
		
		service.getAddressInfo_1(request, response, model); 
		return "getAddressInfo_1"; 
	}
}
