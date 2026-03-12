/* createBoard.js */

  /* ── 제목 글자수 카운터 ── */
  function countTitle() {
    const len = document.getElementById('titleInput').value.length;
    const el  = document.getElementById('titleCounter');
    el.textContent = len + ' / 200';
    el.className = 'char-counter' + (len >= 200 ? ' limit' : len >= 160 ? ' warn' : '');
  }

  /* ── 본문 글자수 카운터 ── */
  function countContent() {
    const len = document.getElementById('contentInput').value.length;
    const el  = document.getElementById('contentCounter');
    el.textContent = len.toLocaleString() + '자';
  }

  /* ── 이미지 업로드 ── */
  let uploadedFiles = [];
  const MAX_FILES = 5;

  function handleFiles(files) {
    const arr = Array.from(files);
    const remain = MAX_FILES - uploadedFiles.length;
    if (remain <= 0) { alert('이미지는 최대 5장까지 첨부 가능합니다.'); return; }
    arr.slice(0, remain).forEach(file => {
      if (!['image/jpeg','image/png'].includes(file.type)) {
        alert('JPG, PNG 형식만 업로드 가능합니다.'); return;
      }
      if (file.size > 10 * 1024 * 1024) {
        alert('파일 크기는 10MB 이하만 가능합니다.'); return;
      }
      uploadedFiles.push(file);
      const reader = new FileReader();
      reader.onload = e => renderPreview(e.target.result, uploadedFiles.length - 1);
      reader.readAsDataURL(file);
    });
    document.getElementById('fileInput').value = '';
  }

  function renderPreview(src, idx) {
    const grid = document.getElementById('previewGrid');
    const item = document.createElement('div');
    item.className = 'preview-item';
    item.id = 'preview_' + idx;
    item.innerHTML = `
      <img src="${src}" alt="첨부 이미지 ${idx+1}">
      ${idx === 0 ? '<div class="rep-badge">대표</div>' : ''}
      <button class="preview-del" onclick="removePreview(${idx})">
        <i class="bi bi-x"></i>
      </button>`;
    grid.appendChild(item);
  }

  function removePreview(idx) {
    uploadedFiles.splice(idx, 1);
    const grid = document.getElementById('previewGrid');
    grid.innerHTML = '';
    uploadedFiles.forEach((file, i) => {
      const reader = new FileReader();
      reader.onload = e => renderPreview(e.target.result, i);
      reader.readAsDataURL(file);
    });
  }

  /* 드래그앤드롭 */
  function onDragOver(e)  { e.preventDefault(); document.getElementById('uploadArea').classList.add('dragover'); }
  function onDragLeave()  { document.getElementById('uploadArea').classList.remove('dragover'); }
  function onDrop(e)      { e.preventDefault(); onDragLeave(); handleFiles(e.dataTransfer.files); }

  /* ── 유효성 검사 & 등록 ── */
  function submitForm() {
    let valid = true;

    const title   = document.getElementById('titleInput');
    const content = document.getElementById('contentInput');
    const titleErr   = document.getElementById('titleErr');
    const contentErr = document.getElementById('contentErr');

    // 제목
    if (!title.value.trim()) {
      title.classList.add('err');
      titleErr.classList.add('show');
      valid = false;
    } else {
      title.classList.remove('err');
      titleErr.classList.remove('show');
    }

    // 내용
    if (!content.value.trim()) {
      content.classList.add('err');
      contentErr.classList.add('show');
      valid = false;
    } else {
      content.classList.remove('err');
      contentErr.classList.remove('show');
    }

    if (!valid) return;

    // 실제 프로젝트에서는 form.submit() 또는 fetch POST
    alert('게시글이 등록되었습니다!');
  }

  /* 제목 입력 시 실시간 에러 해제 */
  document.getElementById('titleInput').addEventListener('input', function() {
    if (this.value.trim()) {
      this.classList.remove('err');
      document.getElementById('titleErr').classList.remove('show');
    }
  });
  document.getElementById('contentInput').addEventListener('input', function() {
    if (this.value.trim()) {
      this.classList.remove('err');
      document.getElementById('contentErr').classList.remove('show');
    }
  });
