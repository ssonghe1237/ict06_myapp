-- 관리자용 축제 메뉴 사용을 위한 쿼리 모음
-- 축제 목록 조회 (페이징용) 
SELECT *
  FROM PLACE p
  JOIN FESTIVAL f 
    ON p.place_id = f.festival_id;

-- 키워드가 포함된 축제 검색 : p.Name, p.Address, f.Description 중 한 개라도 키워드와 일치하면 도출   
SELECT *
  FROM PLACE p
  JOIN FESTIVAL f 
    ON p.place_id = f.festival_id
 WHERE p.Name LIKE '%신나는%'
    OR p.ADDRESS LIKE '%서울%'
    OR f.DESCRIPTION LIKE '%신나는%';