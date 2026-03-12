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

  /* ── 커뮤니티 탭 ── */
  .comm-tabs { background: #fff; border-bottom: 2px solid #e9ecef; }
  .comm-tabs .tab {
    display: inline-block; padding: 11px 20px; font-size: .875rem;
    color: #868e96; font-weight: 500; cursor: pointer;
    border-bottom: 2px solid transparent; margin-bottom: -2px; text-decoration: none;
  }
  .comm-tabs .tab.on   { color: var(--primary); border-bottom-color: var(--primary); font-weight: 700; }
  .comm-tabs .tab:hover { color: var(--primary); }

  /* ── 본문 ── */
  .page-body { padding: 28px 0 64px; }

  /* ── 경로 ── */
  .breadcrumb-area { font-size: .75rem; color: #adb5bd; margin-bottom: 16px; display: flex; align-items: center; gap: 5px; }
  .breadcrumb-area a { color: #adb5bd; text-decoration: none; }
  .breadcrumb-area a:hover { color: var(--primary); }
  .breadcrumb-area .cur { color: #495057; }

  /* ── 페이지 타이틀 ── */
  .page-title-row { margin-bottom: 16px; }
  .page-title { font-size: 1.1rem; font-weight: 800; color: #212529; }

  /* ── 게시판 카드 ── */
  .board-card { background: #fff; border: 1px solid #e9ecef; border-radius: 12px; overflow: hidden; }

  /* 컬럼 헤더 */
  .tbl-head {
    display: grid;
    grid-template-columns: 52px 1fr 84px 62px 96px;
    padding: 8px 20px; background: #f8f9fa; border-bottom: 1px solid #e9ecef;
    font-size: .72rem; color: #868e96; font-weight: 700;
  }
  .c { text-align: center; }
  .r { text-align: right; }

  /* 행 */
  .tbl-row {
    display: grid;
    grid-template-columns: 52px 1fr 84px 62px 96px;
    padding: 12px 20px; border-bottom: 1px solid #f4f6f8;
    align-items: center; cursor: pointer; text-decoration: none;
    transition: background .1s;
  }
  .tbl-row:last-child { border-bottom: none; }
  .tbl-row:hover      { background: #f8fff8; }

  /* 상단 고정 행 강조 */
  .tbl-row.pinned { background: #f6fdf8; }
  .tbl-row.pinned:hover { background: #edfaf2; }

  /* 배지 */
  .bdg { display: inline-flex; align-items: center; gap: 3px; font-size: .67rem; padding: 2px 7px; border-radius: 4px; font-weight: 700; white-space: nowrap; }
  .bdg-notice { background: var(--primary-light); color: var(--primary); }
  .bdg-event  { background: #fff8e1; color: #856404; }
  .bdg-pin    { background: #f3e8ff; color: #6f42c1; font-size: .65rem; padding: 1px 5px; border-radius: 3px; margin-left: 3px; }
  .bdg-new    { background: #dc3545; color: #fff; font-size: .6rem; padding: 1px 4px; border-radius: 3px; margin-left: 3px; }

  /* 제목 */
  .notice-ttl { font-size: .875rem; color: #212529; display: flex; align-items: center; min-width: 0; }
  .notice-ttl span.t { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
  .tbl-row.pinned .notice-ttl span.t { font-weight: 600; }

  /* 이미지 있음 아이콘 */
  .img-icon { color: #adb5bd; font-size: .72rem; margin-left: 5px; flex-shrink: 0; }

  .meta { font-size: .75rem; color: #adb5bd; }

  /* ── 검색 ── */
  .search-row { display: flex; justify-content: center; margin-top: 14px; }
  .search-box { display: flex; border: 1px solid #dee2e6; border-radius: 8px; overflow: hidden; width: 100%; max-width: 440px; }
  .search-box input  { flex: 1; border: none; padding: 8px 13px; font-size: .82rem; outline: none; }
  .search-box button { background: var(--primary); color: #fff; border: none; padding: 8px 16px; cursor: pointer; font-size: .82rem; }

  /* ── 페이지네이션 ── */
  .paging { display: flex; justify-content: center; gap: 4px; padding: 18px 0 4px; }
  .pg {
    width: 30px; height: 30px; border: 1px solid #dee2e6; border-radius: 6px;
    background: #fff; color: #495057; font-size: .78rem; cursor: pointer;
    display: inline-flex; align-items: center; justify-content: center;
    text-decoration: none; transition: all .12s;
  }
  .pg.on, .pg:hover { background: var(--primary); border-color: var(--primary); color: #fff; font-weight: 700; }

  /* ── 빈 상태 ── */
  .empty { padding: 56px 20px; text-align: center; color: #ced4da; font-size: .875rem; }
  .empty i { font-size: 2.2rem; display: block; margin-bottom: 10px; }

  /* ── 관리자 전용 등록 버튼 ── */
  .admin-bar { display: flex; justify-content: flex-end; margin-bottom: 10px; }
  .btn-admin-write {
    background: var(--primary); color: #fff; border: none; border-radius: 7px;
    padding: 7px 16px; font-size: .8rem; font-weight: 600; cursor: pointer;
    display: inline-flex; align-items: center; gap: 5px; text-decoration: none;
  }
  .btn-admin-write:hover { background: var(--primary-dark); color: #fff; }

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

<!-- 커뮤니티 상단 탭 -->
<div class="comm-tabs">
  <div class="container">
    <a class="tab" onclick="switchTab(this,'free')" id="tabFree">자유게시판</a>
    <a class="tab on" onclick="switchTab(this,'notice')" id="tabNotice">공지사항</a>
    <a class="tab" onclick="switchTab(this,'event')" id="tabEvent">이벤트</a>
  </div>
</div>

<!-- 본문 -->
<div class="page-body">
  <div class="container">

    <!-- 경로 -->
    <div class="breadcrumb-area">
      <a href="#">커뮤니티</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <span class="cur" id="breadCur">공지사항</span>
    </div>

    <!-- 타이틀 -->
    <div class="page-title-row">
      <span class="page-title" id="pageTitle">
        <i class="bi bi-megaphone-fill text-success me-1"></i> 공지사항
      </span>
    </div>

    <!-- ──────────────── 공지사항 목록 (NOTICE, category='NOTICE') ──────────────── -->
    <div id="noticeBoard">

      <div class="board-card">
        <!-- 컬럼 헤더 (1개만) -->
        <div class="tbl-head">
          <span>구분</span>
          <span>제목</span>
          <span class="c">작성자</span>
          <span class="c">조회</span>
          <span class="r">날짜</span>
        </div>

        <!-- 상단 고정 (is_top='Y') -->
        <a href="#" class="tbl-row pinned">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">맛집내 서비스 이용약관 개정 안내</span>
            <span class="bdg-pin">📌 고정</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">5,210</span>
          <span class="r meta">2026.01.15</span>
        </a>
        <a href="#" class="tbl-row pinned">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">개인정보처리방침 변경 안내 (2026년 1월 기준)</span>
            <span class="bdg-pin">📌 고정</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">3,874</span>
          <span class="r meta">2026.01.15</span>
        </a>

        <!-- 구분선 -->
        <div style="border-top: 2px dashed #e9ecef; margin: 0;"></div>

        <!-- 일반 목록 (is_top='N') -->
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">2026년 3월 정기 점검 안내</span>
            <span class="bdg-new">N</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">1,034</span>
          <span class="r meta">2026.03.08</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">맛집내 앱 v2.3.0 업데이트 안내</span>
            <span class="bdg-new">N</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">876</span>
          <span class="r meta">2026.03.05</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">고객센터 운영시간 변경 안내 (주말 포함)</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">2,450</span>
          <span class="r meta">2026.02.20</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">포인트 정책 개편 안내 – 리뷰·로그인 적립 변경</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">3,100</span>
          <span class="r meta">2026.02.10</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">결제 오류 관련 긴급 안내 및 조치 사항</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">4,820</span>
          <span class="r meta">2026.01.30</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">2026년 설 연휴 고객센터 운영 안내</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">1,980</span>
          <span class="r meta">2026.01.22</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">맛집내 커뮤니티 운영 정책 안내</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">6,320</span>
          <span class="r meta">2026.01.02</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">리뷰 작성 가이드라인 업데이트 안내</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">2,710</span>
          <span class="r meta">2025.12.15</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">2025년 연말 점검 일정 안내</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">1,640</span>
          <span class="r meta">2025.12.01</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-notice"><i class="bi bi-megaphone"></i> 공지</span></span>
          <span class="notice-ttl">
            <span class="t">예약 취소·환불 정책 개편 안내</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">5,130</span>
          <span class="r meta">2025.11.20</span>
        </a>
      </div><!-- /board-card -->

      <!-- 페이지네이션 -->
      <div class="paging">
        <a class="pg">‹</a>
        <a class="pg on">1</a>
        <a class="pg">2</a>
        <a class="pg">3</a>
        <a class="pg">›</a>
      </div>

      <!-- 검색 -->
      <div class="search-row">
        <div class="search-box">
          <input type="text" placeholder="공지사항 검색">
          <button><i class="bi bi-search"></i></button>
        </div>
      </div>

    </div><!-- /noticeBoard -->

    <!-- ──────────────── 이벤트 목록 (NOTICE, category='EVENT') ──────────────── -->
    <div id="eventBoard" style="display:none;">

      <div class="board-card">
        <!-- 컬럼 헤더 (1개만) -->
        <div class="tbl-head">
          <span>구분</span>
          <span>제목</span>
          <span class="c">작성자</span>
          <span class="c">조회</span>
          <span class="r">날짜</span>
        </div>

        <!-- 상단 고정 이벤트 (is_top='Y') -->
        <a href="#" class="tbl-row pinned">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">🌸 봄맞이 여행 후기 이벤트 – 최대 5만 포인트 증정</span>
            <span class="bdg-pin">📌 고정</span>
            <i class="bi bi-image img-icon" title="이미지 포함"></i>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">8,420</span>
          <span class="r meta">2026.03.01</span>
        </a>
        <a href="#" class="tbl-row pinned">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">친구 초대하고 포인트 받기 이벤트 (~ 3/31)</span>
            <span class="bdg-pin">📌 고정</span>
            <i class="bi bi-image img-icon" title="이미지 포함"></i>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">5,310</span>
          <span class="r meta">2026.02.28</span>
        </a>

        <!-- 구분선 -->
        <div style="border-top: 2px dashed #e9ecef; margin: 0;"></div>

        <!-- 일반 이벤트 (is_top='N') -->
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">설날 특집 여행지 추천 이벤트 – 당첨자 발표</span>
            <i class="bi bi-image img-icon" title="이미지 포함"></i>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">12,430</span>
          <span class="r meta">2026.02.01</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">겨울 여행 사진 공모전 – 최우수상 항공권 증정</span>
            <i class="bi bi-image img-icon" title="이미지 포함"></i>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">9,870</span>
          <span class="r meta">2026.01.10</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">맛집내 출시 1주년 감사 이벤트 – 포인트 100% 증정</span>
            <i class="bi bi-image img-icon" title="이미지 포함"></i>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">21,040</span>
          <span class="r meta">2025.12.20</span>
        </a>
        <a href="#" class="tbl-row">
          <span><span class="bdg bdg-event"><i class="bi bi-gift"></i> 이벤트</span></span>
          <span class="notice-ttl">
            <span class="t">연말 여행 설문 참여 이벤트 – 스타벅스 쿠폰 증정</span>
          </span>
          <span class="c meta">관리자</span>
          <span class="c meta">7,550</span>
          <span class="r meta">2025.12.01</span>
        </a>
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

    </div><!-- /eventBoard -->

  </div>
</div>

<!-- 푸터 -->
<footer class="site-footer">
  <div>© 2026 맛집내. All rights reserved.</div>
</footer>

<script>
  /* ── 커뮤니티 상단 탭 전환 ── */
  function switchTab(el, type) {
    document.querySelectorAll('.comm-tabs .tab').forEach(t => t.classList.remove('on'));
    el.classList.add('on');
    if (type === 'free') location.href = '#'; // boardList.co
  }

  /* ── NOTICE / EVENT 내부 탭 전환 ── */
  function switchInner(cat) {
    const isNotice = cat === 'NOTICE';

    // 내부 탭 활성화
    document.getElementById('innerNotice').classList.toggle('on', isNotice);
    document.getElementById('innerEvent').classList.toggle('on', !isNotice);

    // 게시판 영역 전환
    document.getElementById('noticeBoard').style.display = isNotice ? 'block' : 'none';
    document.getElementById('eventBoard').style.display  = isNotice ? 'none'  : 'block';

    // 페이지 타이틀 & 경로 변경
    const title = document.getElementById('pageTitle');
    const cur   = document.getElementById('breadCur');
    if (isNotice) {
      title.innerHTML = '<i class="bi bi-megaphone-fill text-success me-1"></i> 공지사항';
      cur.textContent = '공지사항';
      document.getElementById('tabNotice').classList.add('on');
      document.getElementById('tabEvent').classList.remove('on');
    } else {
      title.innerHTML = '<i class="bi bi-gift-fill text-warning me-1"></i> 이벤트';
      cur.textContent = '이벤트';
      document.getElementById('tabEvent').classList.add('on');
      document.getElementById('tabNotice').classList.remove('on');
    }
  }

  /* 페이지네이션 */
  document.querySelectorAll('.pg').forEach(pg => {
    pg.addEventListener('click', e => {
      e.preventDefault();
      pg.closest('.paging').querySelectorAll('.pg').forEach(p => p.classList.remove('on'));
      pg.classList.add('on');
    });
  });
</script>
</body>
</html>
