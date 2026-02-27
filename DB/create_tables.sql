--------------------------------------------------
--DB 테이블 생성

-- 1. 회원
CREATE TABLE MEMBER (
    user_id			VARCHAR2(50) PRIMARY KEY,
    password		VARCHAR2(255) NOT NULL,
    email			VARCHAR2(100) UNIQUE NOT NULL,
    name			VARCHAR2(50) NOT NULL,
    birth_date		DATE,
    gender			CHAR(1) CHECK(gender IN ('M', 'F')),
    phone			VARCHAR2(20),
    address			VARCHAR2(255),
    point_balance	NUMBER DEFAULT 0,
    role			VARCHAR2(20) DEFAULT 'USER',		--권한(일반사용자:'USER', 관리자:'ADMIN')
    status			VARCHAR2(20) DEFAULT 'ACTIVE',		--상태(active, quit 등) -> 불요시 삭제
    created_at		TIMESTAMP DEFAULT SYSTIMESTAMP		--JAVA(DTO)에서는 joinDate로 생성
);
SELECT * FROM MEMBER;

-- 2. 장소 통합
CREATE TABLE PLACE (
    place_id    NUMBER PRIMARY KEY,
    place_type  VARCHAR2(20) NOT NULL CHECK(place_type IN ('REST','ACC','FEST')), -- 'REST', 'ACC', 'FEST' 값만 입력되는 제한조건
    name        VARCHAR2(100) NOT NULL,
    address     VARCHAR2(255),
	view_count  NUMBER DEFAULT 0,
    latitude    NUMBER(10, 8),
    longitude   NUMBER(11, 8),
    image_url   VARCHAR2(500),
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 placeRegDate
);

SELECT * FROM PLACE
WHERE place_type = 'REST'; --563건
SELECT * FROM PLACE
WHERE place_type = 'ACC'; --288건
SELECT * FROM PLACE
WHERE place_type = 'FEST'; --149건

-- 3. 맛집 (PLACE 참조)
CREATE TABLE RESTAURANT (
    restaurant_id  NUMBER PRIMARY KEY REFERENCES PLACE(place_id) ON DELETE CASCADE,
    description    CLOB,
    phone          VARCHAR2(20),
    category       VARCHAR2(50),
    status         VARCHAR2(20) DEFAULT 'OPEN' CHECK(status IN('OPEN','CLOSED'))
);
SELECT * FROM RESTAURANT;

-- 4. 숙소 (PLACE 참조)
CREATE TABLE ACCOMMODATION (
    accommodation_id NUMBER PRIMARY KEY REFERENCES PLACE(place_id) ON DELETE CASCADE,
    description      CLOB,
    phone            VARCHAR2(20),
    price            NUMBER,
    status           VARCHAR2(20) DEFAULT 'OPEN' CHECK(status IN('OPEN','CLOSED'))
);
SELECT * FROM ACCOMMODATION;

-- 5. 축제 (PLACE 참조)
CREATE TABLE FESTIVAL (
    festival_id		NUMBER PRIMARY KEY REFERENCES PLACE(place_id) ON DELETE CASCADE,
    description		CLOB,
    start_date		DATE,					-- 축제 시작일
    end_date		DATE,					-- 축제 종료일
    status			VARCHAR2(20) DEFAULT 'UPCOMING' CHECK(status IN('UPCOMING','ONGOING','ENDED'))
);
SELECT * FROM FESTIVAL;    

-- 6. 축제 티켓 종류 테이블(추가?)
CREATE TABLE FESTIVAL_TICKET (
    ticket_id    NUMBER PRIMARY KEY,
    festival_id  NUMBER REFERENCES FESTIVAL(festival_id) ON DELETE CASCADE,
    ticket_type  VARCHAR2(100) NOT NULL, -- '1일권', '2일권', '전일권' 등
    price        NUMBER DEFAULT 0,       -- 티켓별 가격
    stock        NUMBER DEFAULT 0,       -- 티켓별 재고 (선택사항)
    description  VARCHAR2(500)           -- 티켓 상세 설명
);

-- 7. 예약 테이블
CREATE TABLE RESERVATION (
    reservation_id	VARCHAR2(50) PRIMARY KEY,
    user_id			VARCHAR2(50) REFERENCES MEMBER(user_id),
	place_id		NUMBER REFERENCES PLACE(place_id),
    check_in		DATE NOT NULL,			-- 시작일 (체크인, 방문일)
    check_out		DATE,					-- 종료일 (체크아웃, 축제 종료일)
    visit_time		VARCHAR2(10),		-- 방문 시간 (식당용)
    ticket_type		VARCHAR2(50),		-- 예약한 티켓 종류
    guest_count		NUMBER DEFAULT 1,
    request_note	CLOB,
    status			VARCHAR2(20) DEFAULT 'RESERVED' CHECK(STATUS IN('PENDING','CONFIRMED','COMPLETED','CANCELLED','NOSHOW')),
    payment_id		VARCHAR2(50),
    created_at		TIMESTAMP DEFAULT SYSTIMESTAMP	--DTO는 resDate
);
SELECT * FROM RESERVATION;

-- 8. 결제 테이블
CREATE TABLE PAYMENT (
    payment_id     VARCHAR2(50) PRIMARY KEY,
    user_id        VARCHAR2(50) REFERENCES MEMBER(user_id),
    reservation_id VARCHAR2(50) REFERENCES RESERVATION(reservation_id),
    amount         NUMBER NOT NULL,
    payment_method VARCHAR2(50), 
    payment_status VARCHAR2(20) CHECK(PAYMENT_STATUS IN('COMPLETED','CANCELLED')), 
    created_at   TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 payDate
);
SELECT * FROM PAYMENT;

-- 9. REVIEW (리뷰)
CREATE TABLE REVIEW (
    review_id      NUMBER PRIMARY KEY,
    user_id        VARCHAR2(50) REFERENCES MEMBER(user_id), -- 자료형 수정
    place_id       NUMBER REFERENCES PLACE(place_id),       -- target_id 대신 place_id 추천
    rating         NUMBER(1) CHECK(rating BETWEEN 1 AND 5),
    content        CLOB,
    status         VARCHAR2(20) DEFAULT 'DISPLAY' CHECK(STATUS IN('DISPLAY','HIDDEN')),
    created_at     TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 reviewDate
);
SELECT * FROM REVIEW;

-- 10. IMAGE_STORE (다중 이미지 관리)
CREATE TABLE IMAGE_STORE (
    image_id           NUMBER PRIMARY KEY,
    target_id          NUMBER NOT NULL, -- PLACE_ID 혹은 REVIEW_ID
    target_type        VARCHAR2(20) NOT NULL, -- 'PLACE', 'REVIEW'
    image_url          VARCHAR2(500) NOT NULL,
    is_representative  CHAR(1) DEFAULT 'N' CHECK(IS_REPRESENTATIVE IN('Y','N')), 
    sort_order         NUMBER DEFAULT 0,
    created_at         TIMESTAMP DEFAULT SYSTIMESTAMP	--DTO는 imgUploadDate
);
SELECT * FROM IMAGE_STORE;

-- 11. FAQ (자주 묻는 질문)
CREATE TABLE FAQ (
    faq_id      NUMBER PRIMARY KEY,
    question    VARCHAR2(500) NOT NULL,
    answer      CLOB NOT NULL,
    category    VARCHAR2(50), --분류에 따라 제약조건 추가 CHECK(CATEGORY IN ('분류1','분류2'))
    order_no    NUMBER DEFAULT 0,
    visible     CHAR(1) DEFAULT 'Y' CHECK(VISIBLE IN('Y','N')),
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 faqRegDate
);
SELECT * FROM FAQ;
DROP TABLE FAQ;

-- 12. SURVEY (설문조사)
CREATE TABLE SURVEY (
    survey_id       NUMBER PRIMARY KEY,
    user_id         VARCHAR2(50) REFERENCES MEMBER(user_id), -- 자료형 수정
    nps_score       NUMBER(2),
    satisfaction_score NUMBER(2),
    inconvenience	CLOB,
    info_reliability_score	NUMBER(2),
    improvements	CLOB,
    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 surveyDate
);
SELECT * FROM SURVEY;

-- 13. POINT_POLICY (포인트 지급 기준)
CREATE TABLE POINT_POLICY (
	POLICY_KEY VARCHAR2(50) PRIMARY KEY CHECK(POLICY_KEY IN('EARN_REVIEW_REWARD','EARN_DAILY_LOGIN','USE_BOOKING','USE_EXPIRED')),
	AMOUNT NUMBER NOT NULL,
	DESCRIPTION VARCHAR2(100)
);
SELECT * FROM POINT_POLICY;

-- 14. POINT (포인트 내역)
CREATE TABLE POINT (
    point_id    NUMBER PRIMARY KEY,
    user_id     VARCHAR2(50) REFERENCES MEMBER(user_id),
    policy_key	VARCHAR2(50) REFERENCES POINT_POLICY(policy_key),
    amount      NUMBER NOT NULL,
    type        VARCHAR2(10) CHECK(TYPE IN('EARN','USE')), -- EARN, USE
    description VARCHAR2(255),
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 pointLogDate
);
SELECT * FROM POINT;

-- 15. INQUIRY (1:1 문의)
CREATE TABLE INQUIRY (
    inquiry_id   NUMBER PRIMARY KEY,
    user_id      VARCHAR2(50) REFERENCES MEMBER(user_id),
    title        VARCHAR2(200) NOT NULL,
    content      CLOB NOT NULL,
    status       VARCHAR2(20) DEFAULT 'PENDING' CHECK(status IN('PENDING', 'ANSWERED')), -- PENDING, ANSWERED
    admin_reply  CLOB, -- 관리자 답변 내용
    created_at	TIMESTAMP DEFAULT SYSTIMESTAMP, -- 문의 일시		--DTO는 inquiryDate
    answered_at   TIMESTAMP DEFAULT SYSTIMESTAMP -- 답변 일시
);
SELECT * FROM INQUIRY;

-- 16. NOTICE (공지사항)
CREATE TABLE NOTICE (
    notice_id    NUMBER PRIMARY KEY,
    admin_id     VARCHAR2(50) REFERENCES MEMBER(user_id), -- 관리자 user_id
    title        VARCHAR2(200) NOT NULL,
    content      CLOB NOT NULL,
    view_count   NUMBER DEFAULT 0,
    is_top       CHAR(1) DEFAULT 'N' CHECK(IS_TOP IN('Y','N')), -- 상단 고정 여부
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 noticeRegDate
);
SELECT * FROM NOTICE;

-- 17. FAVORITE (즐겨찾기 / 북마크)
CREATE TABLE FAVORITE (
    favorite_id  NUMBER PRIMARY KEY,
    user_id      VARCHAR2(50) REFERENCES MEMBER(user_id),
    place_id     NUMBER REFERENCES PLACE(place_id),
    created_at   TIMESTAMP DEFAULT SYSTIMESTAMP,		--DTO는 favRegDate
    UNIQUE(user_id, place_id) -- 중복 북마크 방지
);
SELECT * FROM FAVORITE;

-- 18. SEARCH_HISTORY(최근 검색어)
CREATE TABLE SEARCH_HISTORY (
    history_id   NUMBER PRIMARY KEY,
    user_id      VARCHAR2(50) REFERENCES MEMBER(user_id),
    keyword      VARCHAR2(100) NOT NULL,
    created_at   TIMESTAMP DEFAULT SYSTIMESTAMP		--DTO는 searchDate
);
SELECT * FROM SEARCH_HISTORY;

--------------------------------------------------
-- 시퀀스/트리거 생성
--------------------------------------------------
--1) 시퀀스 생성
CREATE SEQUENCE SEQ_PLACE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TICKET START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_REVIEW START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_IMAGE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_FAQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_INQUIRY START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_NOTICE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_SURVEY START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_POINT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_FAVORITE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_SEARCH START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_RES START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PAY START WITH 1 INCREMENT BY 1;

--2) 예약/결제번호 생성용 트리거(RYYMMDDXXX)
CREATE OR REPLACE TRIGGER TRG_RESERVATION_ID
BEFORE INSERT ON RESERVATION FOR EACH ROW
BEGIN
  SELECT 'R' || TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(SEQ_RES.NEXTVAL, 3, '0')
  INTO :NEW.reservation_id FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_PAYMENT_ID
BEFORE INSERT ON PAYMENT FOR EACH ROW
BEGIN
  SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(SEQ_PAY.NEXTVAL, 3, '0')
  INTO :NEW.payment_id FROM DUAL;
END;

--3) 축제 status 자동계산 트리거
CREATE OR REPLACE TRIGGER TRG_FESTIVAL_STATUS
BEFORE INSERT OR UPDATE ON FESTIVAL
FOR EACH ROW
BEGIN
    IF :NEW.end_date < TRUNC(SYSDATE) THEN
        :NEW.status := 'CLOSED';
    ELSIF :NEW.start_date > TRUNC(SYSDATE) THEN
        :NEW.status := 'UPCOMING';
    ELSE
        :NEW.status := 'ONGOING';
    END IF;
END;

--4) FAQ_ID 자동생성 트리거
CREATE OR REPLACE TRIGGER TRG_FAQ_ID
BEFORE INSERT ON FAQ
FOR EACH ROW
BEGIN
  IF :NEW.faq_id IS NULL THEN
    SELECT SEQ_FAQ.NEXTVAL INTO :NEW.faq_id FROM DUAL;
  END IF;
END;

--------------------------------------------------
-- 테이블 초기화용 (참조 관계 역순으로 삭제)
--------------------------------------------------
-- 1. 자식 테이블
DROP TABLE SEARCH_HISTORY;
DROP TABLE FAVORITE;
DROP TABLE NOTICE;
DROP TABLE INQUIRY;
DROP TABLE POINT;
DROP TABLE POINT_POLICY;
DROP TABLE SURVEY;
DROP TABLE FAQ;
DROP TABLE IMAGE_STORE;
DROP TABLE REVIEW;
DROP TABLE FESTIVAL_TICKET;

-- 2. 거래 관련 테이블 (결제는 예약을 참조하므로 결제 먼저 삭제)
DROP TABLE PAYMENT;
DROP TABLE RESERVATION;

-- 3. 장소 상세 테이블 (부모인 PLACE를 참조하므로 먼저 삭제)
DROP TABLE RESTAURANT;
DROP TABLE ACCOMMODATION;
DROP TABLE FESTIVAL;

-- 4. 최상위 부모 테이블
DROP TABLE PLACE;
DROP TABLE MEMBER;

-- 5. 시퀀스 삭제
DROP SEQUENCE SEQ_PLACE;
--이하 동일

-- (참고) 만약 순서 상관없이 강제로 다 지우고 싶을 때만 아래 방식 사용
-- DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- DROP TABLE PLACE CASCADE CONSTRAINTS;