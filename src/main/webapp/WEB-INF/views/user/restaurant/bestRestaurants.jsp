<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> <!-- ${path} 정의 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집 페이지</title>

<!-- 부트스트랩 선언 + 헤더/푸터 -->
<%@ include file="/WEB-INF/views/common/bootstrapSettings.jsp" %>

</head>
<body>
   <div class="wrap">
      <%@ include file="../../common/header.jsp" %>
      
      <%@ include file="./restaurantMenus.jsp" %>
      <%@ include file="./restaurantRankMenus.jsp" %>
      
      <div align="center">
			<img src="${path}/resources/images/user/restaurant/bestRestaurants_realTime.png" width="100%" alt="main">
	  </div>
	  
	  <!-- 관련 SQL -->
		SQL 쿼리 : 베스트 맛집 랭킹 쿼리
		<pre>
			<code>
			<c:out value="
				SELECT *
				FROM (
				    SELECT
				        p.place_id AS restaurant_id,
				        p.description,
				        p.phone,
				        p.category,
				        p.status,
				
				        AVG(r.rating) AS avg_rating,
				        COUNT(r.review_id) AS review_count,
				
				        (
				            6371 * ACOS(
				                COS(RADIANS(?)) *
				                COS(RADIANS(p.latitude)) *
				                COS(RADIANS(p.longitude) - RADIANS(?)) +
				                SIN(RADIANS(?)) *
				                SIN(RADIANS(p.latitude))
				            )
				        ) AS distance_km
				
				    FROM PLACE p
				    LEFT JOIN REVIEW r
				        ON p.place_id = r.place_id
				        AND r.status = 'ACTIVE'
				
				    WHERE p.place_type = 'REST'
				      AND p.status = 'OPEN'
				      AND p.latitude BETWEEN ? AND ?
				      AND p.longitude BETWEEN ? AND ?
				
				    GROUP BY
				        p.place_id,
				        p.description,
				        p.phone,
				        p.category,
				        p.status,
				        p.latitude,
				        p.longitude
				) sub
				WHERE distance_km <= ?
				  AND review_count > 0
				ORDER BY avg_rating DESC, review_count DESC
				LIMIT 10;
			" />
			</code>
		</pre>
  	
      <%@ include file="../../common/footer.jsp" %>
   </div>
</body>
</html>