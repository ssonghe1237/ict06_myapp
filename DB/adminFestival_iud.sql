-- 관리자용 축제 메뉴 사용을 위한 쿼리 모음
-- 축제 목록 조회 
SELECT *
  FROM PLACE p
  JOIN FESTIVAL f 
    ON p.place_id = f.festival_id;