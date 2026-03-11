<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:choose><c:when test="${category == 'EVENT'}">이벤트</c:when><c:otherwise>공지사항</c:otherwise></c:choose> - 맛집내</title>

<!-- 부트스트랩 선언 + 헤더/푸터 -->
<%@ include file="/WEB-INF/views/common/bootstrapSettings.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/common/main.css">
<style>
  * { box-sizing: border-box; }
  body { font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif; background: #f4f6f8; margin: 0; font-size: 14px; }
  :root { --primary: #198754; --primary-dark: #0f5c38; --primary-light: #e8f5e9; }

  /* ── 헤더 ── */
  .site-header {
    background: #fff; border-bottom: 1px solid #e9ecef;
    height: 56px; display: flex; align-items: center;
    padding: 0 32px; justify-content: space-between;
    position: sticky; top: 0; z-index: 200;
    box-shadow: 0 1px 4px rgba(0,0,0,.05);
  }
  .logo  { font-weight: 800; font-size: 1.15rem; color: var(--primary); letter-spacing: -0.5px; }
  .gnb   { display: flex; gap: 24px; }
  .gnb a { font-size: .875rem; color: #495057; text-decoration: none; font-weight: 500; }
  .gnb a.on { color: var(--primary); font-weight: 700; border-bottom: 2px solid var(--primary); padding-bottom: 1px; }
  .hd-btns { display: flex; gap: 8px; }
  .btn-sm-outline { border: 1px solid #dee2e6; background: #fff; border-radius: 6px; padding: 5px 13px; font-size: .8rem; color: #495057; cursor: pointer; }
  .btn-sm-green   { border: none; background: var(--primary); border-radius: 6px; padding: 5px 13px; font-size: .8rem; color: #fff; font-weight: 600; cursor: pointer; }

  /* ── 탭 ── */
  .comm-tabs { background: #fff; border-bottom: 2px solid #e9ecef; }
  .comm-tabs .tab {
    display: inline-block; padding: 11px 20px; font-size: .875rem;
    color: #868e96; font-weight: 500; text-decoration: none;
    border-bottom: 2px solid transparent; margin-bottom: -2px; cursor: pointer;
  }
  .comm-tabs .tab.on    { color: var(--primary); border-bottom-color: var(--primary); font-weight: 700; }
  .comm-tabs .tab:hover { color: var(--primary); }

  /* ── 본문 ── */
  .page-body { padding: 28px 0 64px; }

  /* ── 경로 ── */
  .breadcrumb-area { font-size: .75rem; color: #adb5bd; margin-bottom: 16px; display: flex; align-items: center; gap: 5px; }
  .breadcrumb-area a    { color: #adb5bd; text-decoration: none; }
  .breadcrumb-area a:hover { color: var(--primary); }
  .breadcrumb-area .cur { color: #495057; }

  /* ── 페이지 타이틀 ── */
  .page-title { font-size: 1.1rem; font-weight: 800; color: #212529; margin-bottom: 16px; }

  /* ── 진행 중 배너 (is_top='Y') ── */
  .ongoing-section { margin-bottom: 28px; }
  .section-label { font-size: .78rem; font-weight: 700; color: #495057; margin-bottom: 10px; display: flex; align-items: center; gap: 5px; }

  .ongoing-card {
    background: #fff; border: 1px solid #e9ecef; border-radius: 14px;
    overflow: hidden; text-decoration: none; display: flex;
    transition: box-shadow .18s, transform .18s;
  }
  .ongoing-card:hover { box-shadow: 0 6px 24px rgba(0,0,0,.1); transform: translateY(-2px); }

  .ongoing-img {
    width: 260px; min-width: 260px; height: 160px;
    overflow: hidden; background: #e9ecef; flex-shrink: 0;
  }
  .ongoing-img img { width: 100%; height: 100%; object-fit: cover; display: block; }

  .ongoing-info { padding: 18px 20px; flex: 1; display: flex; flex-direction: column; justify-content: space-between; min-width: 0; }
  .ongoing-badges { display: flex; gap: 6px; margin-bottom: 8px; }
  .bdg { display: inline-flex; align-items: center; gap: 3px; font-size: .68rem; padding: 2px 8px; border-radius: 4px; font-weight: 700; white-space: nowrap; }
  .bdg-event   { background: #fff8e1; color: #856404; }
  .bdg-ongoing { background: #d1e7dd; color: var(--primary-dark); }
  .bdg-end     { background: #f1f3f5; color: #868e96; }
  .bdg-pin     { background: #f3e8ff; color: #6f42c1; }
  .bdg-new     { background: #dc3545; color: #fff; font-size: .6rem; padding: 1px 5px; border-radius: 3px; }

  .ongoing-title { font-size: .975rem; font-weight: 700; color: #212529; margin-bottom: 8px; line-height: 1.4; }
  .ongoing-desc  { font-size: .8rem; color: #6c757d; line-height: 1.6;
                   overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; }
  .ongoing-meta  { font-size: .75rem; color: #adb5bd; display: flex; gap: 14px; margin-top: 10px; }
  .ongoing-meta span { display: flex; align-items: center; gap: 4px; }

  /* ── 종료된 이벤트 카드 그리드 ── */
  .ended-section { }
  .event-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 14px; }
  @media(max-width: 768px) { .event-grid { grid-template-columns: 1fr; } }

  .event-card {
    background: #fff; border: 1px solid #e9ecef; border-radius: 12px;
    overflow: hidden; text-decoration: none;
    transition: box-shadow .18s, transform .18s;
  }
  .event-card:hover { box-shadow: 0 4px 16px rgba(0,0,0,.09); transform: translateY(-2px); }
  .event-card.ended { opacity: .75; }
  .event-card.ended:hover { opacity: 1; }

  .event-card-img {
    width: 100%; height: 148px; overflow: hidden; background: #e9ecef; position: relative;
  }
  .event-card-img img { width: 100%; height: 100%; object-fit: cover; display: block; }
  .img-placeholder {
    width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;
    background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
    color: #adb5bd; font-size: 2rem;
  }

  /* 이미지 위 상태 오버레이 */
  .status-overlay {
    position: absolute; top: 10px; left: 10px;
  }

  .event-card-body { padding: 13px 15px 15px; }
  .event-card-title { font-size: .875rem; font-weight: 700; color: #212529; margin-bottom: 6px; line-height: 1.4;
                      overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; }
  .event-card-meta  { font-size: .73rem; color: #adb5bd; display: flex; justify-content: space-between; }

  /* ── 페이지네이션 ── */
  .paging { display: flex; justify-content: center; gap: 4px; padding: 24px 0 4px; }
  .pg {
    width: 30px; height: 30px; border: 1px solid #dee2e6; border-radius: 6px;
    background: #fff; color: #495057; font-size: .78rem; cursor: pointer;
    display: inline-flex; align-items: center; justify-content: center;
    text-decoration: none; transition: all .12s;
  }
  .pg.on, .pg:hover { background: var(--primary); border-color: var(--primary); color: #fff; font-weight: 700; }

  /* ── 검색 ── */
  .search-row { display: flex; justify-content: center; margin-top: 4px; }
  .search-box { display: flex; border: 1px solid #dee2e6; border-radius: 8px; overflow: hidden; width: 100%; max-width: 440px; }
  .search-box input  { flex: 1; border: none; padding: 8px 13px; font-size: .82rem; outline: none; }
  .search-box button { background: var(--primary); color: #fff; border: none; padding: 8px 16px; cursor: pointer; font-size: .82rem; }

  /* ── 푸터 ── */
  .site-footer { background: #212529; color: #6c757d; padding: 28px 32px; font-size: .78rem; }
</style>
</head>
<body>

<!-- 헤더 -->
<header class="site-header">
  <div style="display:flex;align-items:center;gap:32px;">
    <span class="logo">맛집내</span>
    <nav class="gnb">
      <a href="#">맛집</a><a href="#">숙소</a><a href="#">축제</a>
      <a href="#" class="on">커뮤니티</a><a href="#">고객지원</a>
    </nav>
  </div>
  <div class="hd-btns">
    <button class="btn-sm-outline">회원가입</button>
    <button class="btn-sm-green">로그인</button>
  </div>
</header>

<!-- 탭 -->
<div class="comm-tabs">
  <div class="container">
    <a class="tab" href="#">자유게시판</a>
    <a class="tab" href="#">공지사항</a>
    <a class="tab on">이벤트</a>
  </div>
</div>

<!-- 본문 -->
<div class="page-body">
  <div class="container">

    <!-- 경로 -->
    <div class="breadcrumb-area">
      <a href="#">커뮤니티</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <span class="cur">이벤트</span>
    </div>

    <!-- 페이지 타이틀 -->
    <div class="page-title">
      <i class="bi bi-gift-fill text-warning me-1"></i> 이벤트
    </div>

    <!-- ── 진행 중인 이벤트 (is_top='Y') ── -->
    <div class="ongoing-section">
      <div class="section-label">
        <i class="bi bi-fire text-warning"></i> 진행 중인 이벤트
      </div>

      <div style="display:flex; flex-direction:column; gap:10px;">

        <a href="#" class="ongoing-card">
          <div class="ongoing-img">
            <img src="https://images.unsplash.com/photo-1522199755839-a2bacb67c546?w=600&q=80" alt="">
          </div>
          <div class="ongoing-info">
            <div>
              <div class="ongoing-badges">
                <span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span>
                <span class="bdg bdg-ongoing">🟢 진행 중</span>
                <span class="bdg bdg-pin">📌 고정</span>
              </div>
              <div class="ongoing-title">🌸 봄맞이 여행 후기 이벤트 – 최대 5만 포인트 증정</div>
              <div class="ongoing-desc">
                봄 여행을 다녀오셨나요? 맛집내에 여행 후기를 남겨주시면 추첨을 통해 최대 5만 포인트를 드립니다! 지금 바로 참여하세요.
              </div>
            </div>
            <div class="ongoing-meta">
              <span><i class="bi bi-calendar3"></i> ~ 2026.03.31</span>
              <span><i class="bi bi-eye"></i> 8,420</span>
            </div>
          </div>
        </a>

        <a href="#" class="ongoing-card">
          <div class="ongoing-img">
            <img src="https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=600&q=80" alt="">
          </div>
          <div class="ongoing-info">
            <div>
              <div class="ongoing-badges">
                <span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span>
                <span class="bdg bdg-ongoing">🟢 진행 중</span>
                <span class="bdg bdg-pin">📌 고정</span>
              </div>
              <div class="ongoing-title">친구 초대하고 포인트 받기 이벤트 (~ 3/31)</div>
              <div class="ongoing-desc">
                친구에게 맛집내를 소개하고 함께 포인트를 받아보세요. 친구가 가입 완료 시 양쪽 모두에게 포인트가 적립됩니다.
              </div>
            </div>
            <div class="ongoing-meta">
              <span><i class="bi bi-calendar3"></i> ~ 2026.03.31</span>
              <span><i class="bi bi-eye"></i> 5,310</span>
            </div>
          </div>
        </a>

      </div>
    </div>

    <!-- ── 종료된 이벤트 ── -->
    <div class="ended-section">
      <div class="section-label">
        <i class="bi bi-clock-history" style="color:#adb5bd;"></i>
        <span style="color:#adb5bd;">종료된 이벤트</span>
      </div>

      <div class="event-grid">

        <!-- 이미지 있는 이벤트 -->
        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <img src="https://images.unsplash.com/photo-1545987796-200677ee1011?w=400&q=70" alt="">
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">설날 특집 여행지 추천 이벤트 – 당첨자 발표</div>
            <div class="event-card-meta">
              <span>~2026.02.14</span>
              <span><i class="bi bi-eye me-1"></i>12,430</span>
            </div>
          </div>
        </a>

        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <img src="https://images.unsplash.com/photo-1483389127117-b6a2102724ae?w=400&q=70" alt="">
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">겨울 여행 사진 공모전 – 최우수상 항공권 증정</div>
            <div class="event-card-meta">
              <span>~2026.01.31</span>
              <span><i class="bi bi-eye me-1"></i>9,870</span>
            </div>
          </div>
        </a>

        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <img src="https://images.unsplash.com/photo-1496275068113-fff8c90750d1?w=400&q=70" alt="">
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">맛집내 출시 1주년 감사 이벤트 – 포인트 100% 증정</div>
            <div class="event-card-meta">
              <span>~2025.12.31</span>
              <span><i class="bi bi-eye me-1"></i>21,040</span>
            </div>
          </div>
        </a>

        <!-- 이미지 없는 이벤트 (image_url=null) -->
        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <div class="img-placeholder">
              <i class="bi bi-gift"></i>
            </div>
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">연말 여행 설문 참여 이벤트 – 스타벅스 쿠폰 증정</div>
            <div class="event-card-meta">
              <span>~2025.12.15</span>
              <span><i class="bi bi-eye me-1"></i>7,550</span>
            </div>
          </div>
        </a>

        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <img src="https://images.unsplash.com/photo-1530789253388-582c481c54b0?w=400&q=70" alt="">
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">가을 단풍 여행지 추천 이벤트</div>
            <div class="event-card-meta">
              <span>~2025.11.30</span>
              <span><i class="bi bi-eye me-1"></i>6,130</span>
            </div>
          </div>
        </a>

        <a href="#" class="event-card ended">
          <div class="event-card-img">
            <div class="img-placeholder">
              <i class="bi bi-gift"></i>
            </div>
            <div class="status-overlay">
              <span class="bdg bdg-end">종료</span>
            </div>
          </div>
          <div class="event-card-body">
            <div class="event-card-title">첫 리뷰 작성 이벤트 – 포인트 2배 적립</div>
            <div class="event-card-meta">
              <span>~2025.10.31</span>
              <span><i class="bi bi-eye me-1"></i>4,820</span>
            </div>
          </div>
        </a>

      </div>
    </div>

    <!-- 페이지네이션 -->
    <div class="paging">
      <a class="pg">‹</a>
      <a class="pg on">1</a>
      <a class="pg">2</a>
      <a class="pg">›</a>
    </div>

    <!-- 검색 -->
    <div class="search-row">
      <div class="search-box">
        <input type="text" placeholder="이벤트 검색">
        <button><i class="bi bi-search"></i></button>
      </div>
    </div>

  </div>
</div>

<!-- 푸터 -->
<footer class="site-footer">
  <div>© 2026 맛집내. All rights reserved.</div>
</footer>

<script>
  document.querySelectorAll('.pg').forEach(pg => {
    pg.addEventListener('click', e => {
      e.preventDefault();
      document.querySelectorAll('.pg').forEach(p => p.classList.remove('on'));
      pg.classList.add('on');
    });
  });
</script>
</body>
</html>
