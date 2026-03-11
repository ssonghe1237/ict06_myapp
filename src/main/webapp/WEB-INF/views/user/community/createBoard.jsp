<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->

<!-- 본문 -->
<div class="page-body">
  <div class="container" style="max-width:860px;">

    <!-- 경로 -->
    <div class="breadcrumb-area">
      <a href="#">커뮤니티</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <a href="#">자유게시판</a>
      <i class="bi bi-chevron-right" style="font-size:.65rem;"></i>
      <span class="cur">글쓰기</span>
    </div>

    <!-- 작성 카드 -->
    <div class="write-card">

      <!-- 카드 헤더 -->
      <div class="write-card-header">
        <i class="bi bi-pencil-square" style="color:var(--primary);font-size:1.1rem;"></i>
        <h2>게시글 작성</h2>
      </div>

      <!-- 폼 -->
      <div class="write-form">

        <!-- 카테고리 (COMMUNITY.category) -->
        <div>
          <div class="field-label">
            카테고리 <span class="required">*</span>
          </div>
          <div class="cat-select-wrap">
            <input type="radio" name="category" id="cat1" class="cat-radio" value="여행후기" checked>
            <label for="cat1" class="cat-label">여행후기</label>

            <input type="radio" name="category" id="cat2" class="cat-radio" value="질문">
            <label for="cat2" class="cat-label">질문</label>

            <input type="radio" name="category" id="cat3" class="cat-radio" value="정보공유">
            <label for="cat3" class="cat-label">정보공유</label>

            <input type="radio" name="category" id="cat4" class="cat-radio" value="동행구해요">
            <label for="cat4" class="cat-label">동행구해요</label>

            <input type="radio" name="category" id="cat5" class="cat-radio" value="맛집추천">
            <label for="cat5" class="cat-label">맛집추천</label>
          </div>
        </div>

        <!-- 제목 (COMMUNITY.title, max 200) -->
        <div>
          <div class="field-label">
            제목 <span class="required">*</span>
          </div>
          <input type="text" id="titleInput" class="input-title"
            placeholder="제목을 입력하세요 (최대 200자)"
            maxlength="200" oninput="countTitle()">
          <div class="char-counter" id="titleCounter">0 / 200</div>
          <div class="err-msg" id="titleErr">제목을 입력해주세요.</div>
        </div>

        <!-- 본문 (COMMUNITY.content, CLOB) -->
        <div>
          <div class="field-label">
            내용 <span class="required">*</span>
          </div>
          <textarea id="contentInput" class="textarea-content"
            placeholder="여행 이야기를 자유롭게 작성해보세요 :)"
            oninput="countContent()"></textarea>
          <div class="char-counter" id="contentCounter">0자</div>
          <div class="err-msg" id="contentErr">내용을 입력해주세요.</div>
        </div>

        <!-- 이미지 첨부 (IMAGE_STORE → CommunityDTO.imageList) -->
        <div>
          <div class="field-label">
            <i class="bi bi-images" style="color:#adb5bd;"></i>
            이미지 첨부
            <span style="font-size:.7rem;color:#adb5bd;font-weight:400;">(최대 5장 · JPG, PNG · 장당 10MB 이하)</span>
          </div>

          <!-- 드래그앤드롭 업로드 영역 -->
          <div class="upload-area" id="uploadArea"
            onclick="document.getElementById('fileInput').click()"
            ondragover="onDragOver(event)" ondragleave="onDragLeave(event)" ondrop="onDrop(event)">
            <i class="bi bi-cloud-upload upload-icon"></i>
            <div class="upload-text">
              이미지를 <strong>드래그&드롭</strong>하거나 클릭해서 업로드하세요
            </div>
            <div class="upload-hint">첫 번째 이미지가 대표 이미지(is_representative='Y')로 설정됩니다</div>
          </div>
          <input type="file" id="fileInput" accept="image/jpeg,image/png" multiple
            onchange="handleFiles(this.files)">

          <!-- 미리보기 -->
          <div class="preview-grid" id="previewGrid"></div>
        </div>

        <!-- 유의사항 -->
        <div class="notice-box">
          <strong>⚠️ 작성 전 꼭 확인해주세요</strong>
          <ul>
            <li>욕설·비방·홍보성 게시물은 예고 없이 삭제될 수 있습니다.</li>
            <li>개인정보(전화번호, 계좌번호 등)는 게시글에 포함하지 마세요.</li>
            <li>타인의 저작물을 무단 사용하지 마세요.</li>
          </ul>
        </div>

      </div><!-- /write-form -->

      <!-- 하단 버튼 -->
      <div class="write-footer">
        <a href="#" class="btn-cancel" onclick="if(!confirm('작성을 취소하시겠습니까?')) return false;">
          <i class="bi bi-x me-1"></i>취소
        </a>
        <button class="btn-submit" id="submitBtn" onclick="submitForm()">
          <i class="bi bi-send-fill" style="font-size:.78rem;"></i> 등록하기
        </button>
      </div>

    </div><!-- /write-card -->

  </div>
</div>
