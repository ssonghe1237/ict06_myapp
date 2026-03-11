<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 홈</title>

<!-- 부트스트랩 선언 + 헤더/푸터 -->
<%@ include file="/WEB-INF/views/common/bootstrapSettings.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/user/community/community.css">
<link rel="stylesheet" href="${path}/resources/css/user/community/boardDetail.css">
<link rel="stylesheet" href="${path}/resources/css/user/community/createBoard.css">
<link rel="stylesheet" href="${path}/resources/css/user/community/modifyBoard.css">

<script src="https://kit.fontawesome.com/648e5e962b.js" crossorigin="anonymous"></script><!-- 아이콘 -->

<script src="${path}/resources/js/community/community.js" defer></script>
<script src="${path}/resources/js/community/boardDetail.js" defer></script>

</head>
<body>
<div class="wrap">
	<!-- header -->
	<%@ include file="../../common/header.jsp" %>
	
	<br>
	<!-- 상단 탭 : 자유게시판 / 공지사항(NOTICE) / 이벤트(EVENT) -->
	<div class="comm-tabs">
	  <div class="container">
	    <a class="tab on">자유게시판</a>
	    <a class="tab">공지사항</a>
	    <a class="tab">이벤트</a>
	  </div>
	</div>

	<!-- 본문 -->
	<div class="page-body">
	  <div class="container">
	    
		<%@ include file="board.jsp" %>
		<!-- board  :  게시글 목록  -->
		<!-- boardDetail  :  게시글 상세  -->
		<!-- createBoard  :  게시글 작성  -->
		<!-- modifyBoard  :  게시글 수정  -->
	
	  </div>
	</div>

	<!-- footer -->
    <%@ include file="../../common/footer.jsp" %>
    
</div>
</body>
</html>