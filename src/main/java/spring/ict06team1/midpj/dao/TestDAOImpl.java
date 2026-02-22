package spring.ict06team1.midpj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.ict06team1.midpj.dto.TestUserDTO;

@Repository
public class TestDAOImpl implements TestDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TestUserDTO> getAddressInfo_1() {
		System.out.println("TestDAOImpl - getAddressInfo_1");
		
		TestDAO dao = sqlSession.getMapper(TestDAO.class); // 인터페이스를 해줘야 함! 주의. 
		List<TestUserDTO> list = dao.getAddressInfo_1(); 
		return list;
	}

	@Override
	public List<TestUserDTO> getAddressInfo_2() {
		return null;
	}

}
