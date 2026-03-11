<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->


<!-- ==============================================
[커뮤니티 자유 게시판]


=============================================== -->


<!-- ── 인기글 TOP 3 (COMMUNITY 테이블, like_count DESC 기준) ── -->
<div class="pop-section">
  <div class="pop-header">
    <span class="pop-title"><i class="bi bi-fire text-warning me-1"></i>인기글 TOP 3</span>
    <span class="pop-sub">최근 7일 · 좋아요 순</span>
  </div>
  <div class="pop-grid">

    <a href="#" class="pop-card">
      <span class="pop-num n1">1</span>
      <div class="pop-info">
        <span class="pop-cat">여행후기</span>
        <p class="pop-ttl">도쿄 3박 4일 완벽 가이드 – 현지인이 알려주는 숨은 맛집</p>
        <div class="pop-meta">
          <span><i class="bi bi-eye"></i> 4,823</span>
          <span><i class="bi bi-heart-fill text-danger"></i> 312</span>
          <span><i class="bi bi-chat"></i> 88</span>
        </div>
      </div>
    </a>

    <a href="#" class="pop-card">
      <span class="pop-num n2">2</span>
      <div class="pop-info">
        <span class="pop-cat">정보공유</span>
        <p class="pop-ttl">항공권 최저가 잡는 시즌별 타이밍 정리</p>
        <div class="pop-meta">
          <span><i class="bi bi-eye"></i> 3,320</span>
          <span><i class="bi bi-heart-fill text-danger"></i> 188</span>
          <span><i class="bi bi-chat"></i> 37</span>
        </div>
      </div>
    </a>

    <a href="#" class="pop-card">
      <span class="pop-num n3">3</span>
      <div class="pop-info">
        <span class="pop-cat">여행후기</span>
        <p class="pop-ttl">제주 혼자 여행 꿀팁 총정리 (숙소·렌트카·코스)</p>
        <div class="pop-meta">
          <span><i class="bi bi-eye"></i> 3,540</span>
          <span><i class="bi bi-heart-fill text-danger"></i> 241</span>
          <span><i class="bi bi-chat"></i> 57</span>
        </div>
      </div>
    </a>

  </div>
</div>


<!-- ── 커뮤니티 이용 안내 배너 ── -->
<div class="guide-banner">
  <div class="guide-banner-icon">
    <i class="bi bi-lightbulb-fill"></i>
  </div>
  <div class="guide-banner-text">
    <strong>커뮤니티 이용 안내</strong>
    서로를 존중하는 건강한 여행 커뮤니티를 만들어 주세요. 욕설·비방·홍보성 게시물은 예고 없이 삭제될 수 있습니다.
  </div>
  <br>
  <hr>
  <br>
</div>

<!-- ── 게시판 ── -->
<div class="board-card">

  <!-- 카테고리 필터 (COMMUNITY.category 값 기반) + 글쓰기 -->
  <div class="filter-bar">
    <div class="tag-chips">
      <a class="chip on">전체</a>
      <a class="chip">맛집수다</a>
      <a class="chip">숙소수다</a>
      <a class="chip">축제수다</a>
      <a class="chip">정보공유</a>
      <a class="chip">동행구해요</a>
    </div>
    <!-- 로그인 시에만 노출 -->
    <a href="#" class="btn-write">
      <i class="bi bi-pencil-fill" style="font-size:.7rem;"></i> 글쓰기
    </a>
  </div>

  <!-- 컬럼 헤더 -->
  <div class="tbl-head">
    <span>구분</span>
    <span>제목</span>
    <span class="c">카테고리</span>
    <span class="c">작성자</span>
    <span class="c">조회</span>
    <span class="c">추천</span>
    <span class="r">날짜</span>
  </div>

  <!-- 게시글 목록 (COMMUNITY JOIN MEMBER) -->
  <div class="tbl-body">

    <!-- 좋아요 312 → hot 처리 -->
    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">도쿄 3박 4일 완벽 가이드 – 현지인이 알려주는 숨은 맛집</span>
        <span class="cmtcnt">[88]</span>
        <span class="bdg-new">N</span>
      </span>
      <span class="c"><span class="cat-chip">여행후기</span></span>
      <span class="c meta">여행매니아</span>
      <span class="c meta">4,823</span>
      <span class="c meta hot"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 312</span>
      <span class="r meta">2026.03.09</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">제주 혼자 여행 꿀팁 총정리 (숙소·렌트카·코스)</span>
        <span class="cmtcnt">[57]</span>
        <span class="bdg-new">N</span>
      </span>
      <span class="c"><span class="cat-chip">여행후기</span></span>
      <span class="c meta">솔로트래블러</span>
      <span class="c meta">3,540</span>
      <span class="c meta hot"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 241</span>
      <span class="r meta">2026.03.08</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">5월에 같이 유럽 여행 가실 분 구해요 🙋</span>
        <span class="cmtcnt">[32]</span>
      </span>
      <span class="c"><span class="cat-chip">동행구해요</span></span>
      <span class="c meta">globe_hopper</span>
      <span class="c meta">1,230</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 45</span>
      <span class="r meta">2026.03.08</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">방콕 쑤완나품 공항 환전 꿀팁 – 어디서 하는 게 이득?</span>
        <span class="cmtcnt">[21]</span>
      </span>
      <span class="c"><span class="cat-chip">정보공유</span></span>
      <span class="c meta">BKK러버</span>
      <span class="c meta">2,100</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 98</span>
      <span class="r meta">2026.03.07</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">산토리니 일몰 포인트 베스트 5곳 추천</span>
        <span class="cmtcnt">[14]</span>
      </span>
      <span class="c"><span class="cat-chip">정보공유</span></span>
      <span class="c meta">Greece_boy</span>
      <span class="c meta">1,870</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 76</span>
      <span class="r meta">2026.03.07</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">파리 루브르박물관 줄 안 서고 입장하는 방법</span>
        <span class="cmtcnt">[43]</span>
      </span>
      <span class="c"><span class="cat-chip">정보공유</span></span>
      <span class="c meta">유럽전문가</span>
      <span class="c meta">2,980</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 154</span>
      <span class="r meta">2026.03.06</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">항공권 최저가 잡는 시즌별 타이밍 정리</span>
        <span class="cmtcnt">[37]</span>
      </span>
      <span class="c"><span class="cat-chip">정보공유</span></span>
      <span class="c meta">항공덕후</span>
      <span class="c meta">3,320</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 188</span>
      <span class="r meta">2026.03.06</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">오사카에서 꼭 먹어야 할 길거리 음식 10가지</span>
        <span class="cmtcnt">[29]</span>
      </span>
      <span class="c"><span class="cat-chip">맛집추천</span></span>
      <span class="c meta">먹방여행자</span>
      <span class="c meta">2,640</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 132</span>
      <span class="r meta">2026.03.05</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">베트남 다낭 3박 5일 완전 정복 일정 공유</span>
        <span class="cmtcnt">[18]</span>
      </span>
      <span class="c"><span class="cat-chip">여행후기</span></span>
      <span class="c meta">다낭러버</span>
      <span class="c meta">1,920</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 89</span>
      <span class="r meta">2026.03.04</span>
    </a>

    <a href="#" class="tbl-row">
      <span><span class="bdg bdg-free">자유</span></span>
      <span class="post-ttl">
        <span class="t">혼자 여행할 때 안전하게 다니는 팁 모음</span>
        <span class="cmtcnt">[52]</span>
      </span>
      <span class="c"><span class="cat-chip">정보공유</span></span>
      <span class="c meta">안전여행자</span>
      <span class="c meta">2,210</span>
      <span class="c meta"><i class="bi bi-heart-fill" style="font-size:.65rem;"></i> 103</span>
      <span class="r meta">2026.03.03</span>
    </a>

  </div>
</div>

<!-- 페이지네이션 -->
<div class="paging">
  <a class="pg">‹</a>
  <a class="pg on">1</a>
  <a class="pg">2</a>
  <a class="pg">3</a>
  <a class="pg">4</a>
  <a class="pg">5</a>
  <a class="pg">›</a>
</div>

<!-- 검색 (제목+내용 / 제목 / 작성자) -->
<div class="search-row">
  <div class="search-box">
    <select>
      <option>제목+내용</option>
      <option>제목</option>
      <option>작성자</option>
    </select>
    <input type="text" placeholder="검색어를 입력하세요">
    <button><i class="bi bi-search"></i></button>
  </div>
</div>
	
