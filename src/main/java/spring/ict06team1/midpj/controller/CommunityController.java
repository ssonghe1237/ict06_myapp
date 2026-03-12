package spring.ict06team1.midpj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.ict06team1.midpj.dto.CommunityDTO;
import spring.ict06team1.midpj.service.CommunityService;

@Controller
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private CommunityService communityService;

	//커뮤니티 홈
    @RequestMapping("/community.co")
    public String community(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url => community.co >>>");
        return "user/community/community";
    }
    
    //[자유게시판] ----------------------------------------------------------
    //자유게시판 리스트
    @RequestMapping("/board.co")
    public String board(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url => board.co >>>");
        return "user/community/board";
    }
    
 	//자유게시판 > 게시글 상세
    @RequestMapping("/boardDetail.co")
    public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url => boardDetail.co >>>");
        return "user/community/boardDetail";
    }
    
    //자유게시판 > 게시글 등록
    @RequestMapping("/createBoard.co")
    public String createBoard(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url => createBoard.co >>>");
        return "user/community/createBoard";
    }
    
    //자유게시판 > 게시글 수정
    @RequestMapping("/modifyBoard.co")
    public String modifyBoard(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url => createBoard.co >>>");
        return "user/community/modifyBoard";
    }
    
    
    


   

}
