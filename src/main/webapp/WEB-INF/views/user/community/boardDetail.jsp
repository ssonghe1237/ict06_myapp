<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->

<!-- 본문 -->
<div class="page-body">
  <div class="container" style="max-width: 860px;">

    <!-- 경로 -->
    <div class="breadcrumb-area">
      <a href="#">커뮤니티</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <a href="#">자유게시판</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <span class="cur">게시글 상세</span>
    </div>

    <!-- ── 게시글 ── -->
    <div class="post-box">

      <!-- 헤더 -->
      <div class="post-header">
        <span class="post-cat">여행후기</span>
        <h1 class="post-title">도쿄 3박 4일 완벽 가이드 – 현지인이 알려주는 숨은 맛집</h1>
        <div class="post-meta">
          <div class="post-author">
            <div class="avatar">여</div>
            <div>
              <div class="author-name">여행매니아</div>
              <div class="author-date">2026.03.09 &nbsp;·&nbsp; 수정됨 2026.03.09</div>
            </div>
          </div>
          <div class="post-stats">
            <span><i class="bi bi-eye"></i> 4,823</span>
            <span><i class="bi bi-heart-fill text-danger"></i> 312</span>
            <span><i class="bi bi-chat"></i> 88</span>
          </div>
        </div>
      </div>

      <!-- 본문 -->
      <div class="post-body">
        <p>안녕하세요! 지난달에 도쿄 3박 4일 다녀온 후기 공유드립니다. 현지 친구 덕분에 관광객들이 잘 모르는 숨은 맛집들을 많이 다녀올 수 있었어요 😊</p>

        <p><strong>📍 1일차 – 신주쿠 / 시부야</strong><br>
        아사쿠사 도착 후 센소지 사원 구경. 아침 일찍 가면 인파가 적어서 좋아요. 점심은 근처 골목에 있는 텐동 전문점 추천드립니다. 줄이 좀 길지만 기다릴 만해요. 저녁은 시부야 센터가이 근처 야키니쿠 골목에서 마무리했어요.</p>

        <p><strong>📍 2일차 – 아키하바라 / 우에노</strong><br>
        전자상가 구경 후 우에노 공원 산책. 벚꽃 시즌이 겹치면 정말 예뻐요. 점심은 아메요코 시장 골목에서 해산물 덮밥! 저녁은 유라쿠초 가드 아래 고가 아래 야키토리집 강추입니다.</p>

        <p><strong>📍 3일차 – 하라주쿠 / 오모테산도</strong><br>
        다케시타도리 구경하고, 오모테산도 힐즈 근처 카페 투어. 4일차 오전에 나리타로 이동하면서 공항 라멘 먹고 마무리했어요.</p>

        <p>총 경비는 항공포함 70만원 초반대였고, 환전은 한국에서 미리 해가는 게 훨씬 이득이었어요. 궁금한 거 댓글로 질문 주세요! 🙌</p>
      </div>

      <!-- 첨부 이미지 (IMAGE_STORE JOIN → CommunityDTO.imageList) -->
      <div class="post-images">
        <div class="post-images-label">
          <i class="bi bi-images"></i> 첨부 이미지 4장
        </div>
        <!-- 대표 이미지 (is_representative='Y') -->
        <div class="img-main" onclick="openLightbox(0)">
          <img id="mainImg"
            src="https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=900&q=80"
            alt="도쿄 여행 대표 이미지">
        </div>
        <!-- 서브 썸네일 (sort_order 순) -->
        <div class="img-thumbs">
          <div class="img-thumb active" onclick="changeMain(0)">
            <img src="https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=200&q=70" alt="">
          </div>
          <div class="img-thumb" onclick="changeMain(1)">
            <img src="https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=200&q=70" alt="">
          </div>
          <div class="img-thumb" onclick="changeMain(2)">
            <img src="https://images.unsplash.com/photo-1513407030348-c983a97b98d8?w=200&q=70" alt="">
          </div>
          <div class="img-thumb" onclick="changeMain(3)">
            <img src="https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?w=200&q=70" alt="">
          </div>
        </div>
      </div>

      <!-- 좋아요 -->
      <div class="like-area">
        <button class="btn-like liked" id="btnLike" onclick="toggleLike()">
          <i class="bi bi-heart-fill" id="heartIcon"></i>
          <span id="likeLabel">좋아요 취소</span>
          <span id="likeCount">312</span>
        </button>
      </div>

      <!-- 하단 버튼 -->
      <div class="post-footer">
        <a href="#" class="btn-list">
          <i class="bi bi-list-ul"></i> 목록
        </a>
        <!-- 본인 or 관리자일 때만 노출 -->
        <div style="display:flex; gap:6px;">
          <a href="#" class="btn-edit">
            <i class="bi bi-pencil"></i> 수정
          </a>
          <button class="btn-del" onclick="if(confirm('정말 삭제하시겠습니까?')) alert('삭제되었습니다.')">
            <i class="bi bi-trash"></i> 삭제
          </button>
        </div>
      </div>

    </div><!-- /post-box -->

    <!-- ── 댓글 ── -->
    <div class="comment-box">

      <div class="comment-header">
        <i class="bi bi-chat-dots"></i>
        댓글 <span class="comment-count">88</span>
      </div>

      <!-- 댓글 목록 (COMMUNITY_COMMENT JOIN MEMBER) -->
      <div id="commentList">

        <!-- 댓글 1 - 본인 -->
        <div class="comment-item" id="cmt_1">
          <div class="comment-top">
            <div class="comment-author-wrap">
              <div class="comment-avatar me">나</div>
              <span class="comment-name">솔로트래블러</span>
              <span class="comment-date">2026.03.09 14:22</span>
            </div>
            <!-- 본인 댓글만 삭제 버튼 노출 -->
            <button class="btn-comment-del" onclick="deleteComment(1)">
              <i class="bi bi-x-lg"></i> 삭제
            </button>
          </div>
          <div class="comment-content">
            정말 유용한 정보 감사해요! 저도 4월에 도쿄 가는데 유라쿠초 야키토리 꼭 가봐야겠어요 😋
          </div>
        </div>

        <!-- 댓글 2 -->
        <div class="comment-item" id="cmt_2">
          <div class="comment-top">
            <div class="comment-author-wrap">
              <div class="comment-avatar">항</div>
              <span class="comment-name">항공덕후</span>
              <span class="comment-date">2026.03.09 15:08</span>
            </div>
          </div>
          <div class="comment-content">
            환전 팁 진짜 중요한 포인트! 저도 현지에서 환전했다가 수수료 꽤 뜯겼거든요. 공항 환전소보다 시내 은행이 낫긴 한데 역시 한국에서 미리 해가는 게 젤 낫더라고요.
          </div>
        </div>

        <!-- 댓글 3 -->
        <div class="comment-item" id="cmt_3">
          <div class="comment-top">
            <div class="comment-author-wrap">
              <div class="comment-avatar">먹</div>
              <span class="comment-name">먹방여행자</span>
              <span class="comment-date">2026.03.09 16:44</span>
            </div>
          </div>
          <div class="comment-content">
            아메요코 시장 해산물 덮밥 저도 먹었어요!! 진짜 너무 맛있었는데, 혹시 가게 이름 기억하세요? 워낙 비슷한 가게들이 많아서 어디로 가야할지 모르겠더라고요 ㅎㅎ
          </div>
        </div>

        <!-- 댓글 4 -->
        <div class="comment-item" id="cmt_4">
          <div class="comment-top">
            <div class="comment-author-wrap">
              <div class="comment-avatar">다</div>
              <span class="comment-name">다낭러버</span>
              <span class="comment-date">2026.03.10 09:15</span>
            </div>
          </div>
          <div class="comment-content">
            70만원 초반이면 진짜 저렴하게 다녀오셨네요! 혹시 항공사랑 숙소 어디 이용하셨는지 여쭤봐도 될까요?
          </div>
        </div>

        <!-- 댓글 5 -->
        <div class="comment-item" id="cmt_5">
          <div class="comment-top">
            <div class="comment-author-wrap">
              <div class="comment-avatar">유</div>
              <span class="comment-name">유럽전문가</span>
              <span class="comment-date">2026.03.10 11:30</span>
            </div>
          </div>
          <div class="comment-content">
            센소지 아침 일찍 방문 팁은 진짜 꿀팁이에요. 저는 오전 6시에 갔었는데 거의 아무도 없어서 사진 실컷 찍었어요 ㅎㅎ
          </div>
        </div>

      </div><!-- /commentList -->

      <!-- 댓글 입력 (로그인 시) -->
      <div class="comment-write">
        <div class="write-avatar">나</div>
        <textarea id="commentContent" rows="2" placeholder="댓글을 입력하세요"></textarea>
        <button class="btn-comment-submit" onclick="submitComment()">등록</button>
      </div>

    </div><!-- /comment-box -->

    <!-- ── 이전글 / 다음글 ── -->
    <div class="post-nav-box">
      <a href="#" class="post-nav-item">
        <div class="post-nav-label">
          <i class="bi bi-chevron-up"></i> 다음글
        </div>
        <div class="post-nav-title">항공권 최저가 잡는 시즌별 타이밍 정리</div>
        <div class="post-nav-date">2026.03.10</div>
      </a>
      <a href="#" class="post-nav-item prev">
        <div class="post-nav-label">
          <i class="bi bi-chevron-down"></i> 이전글
        </div>
        <div class="post-nav-title">제주 혼자 여행 꿀팁 총정리 (숙소·렌트카·코스)</div>
        <div class="post-nav-date">2026.03.08</div>
      </a>
    </div>

  </div>
</div>



