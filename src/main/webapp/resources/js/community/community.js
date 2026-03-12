/* community.js */

/* 탭 클릭 인터랙션 (카테고리 필터) */
 document.querySelectorAll('.chip').forEach(chip => {
    chip.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelectorAll('.chip').forEach(c => c.classList.remove('on'));
      this.classList.add('on');
    });
  });
  document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelectorAll('.tab').forEach(t => t.classList.remove('on'));
      this.classList.add('on');
    });
  });
  document.querySelectorAll('.pg').forEach(pg => {
    pg.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelectorAll('.pg').forEach(p => p.classList.remove('on'));
      this.classList.add('on');
    });
  });