package spring.ict06team1.midpj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.ict06team1.midpj.dao.AdNoticeDAOImpl;

@Service
public class AdNoticeServiceImpl implements AdNoticeService {

	@Autowired
	private AdNoticeDAOImpl adNoDao;

	// 1. 공지/이벤트 목록 전체 조회, 검색/필터
	@Override
	public void getNoticeList(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - getNoticeList()]");
		
	}
	
	// 2. 상세 조회
	@Override
	public void getNoticeDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - getNoticeDetail()]");
		
	}

	// 3. 글 등록 처리
	@Override
	public void insertNotice(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - insertNotice()]");
		
	}

	// 4. 수정 처리
	@Override
	public void updateNotice(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - updateNotice()]");
		
	}

	// 5. 삭제 처리
	@Override
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - deleteNotice()]");
		
	}

	// 6. 이미지 업로드
	@Override
	public void uploadImage(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[AdminNoticeImpl - uploadImage()]");
		
	}

}
