-- System 계정에서 실행
-- 2. 계정생성(ict06_team1_midpj) 및 테이블생성
--******************* 일반 계정 생성 =>[시스템계정(System)에서 작업 ***********
--- 1. 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
   create user ict06_team1_midpj identified by tiger default tablespace users;
-- 2. 사용자 권한 부여
   grant connect, resource to ict06_team1_midpj;
   grant create view to ict06_team1_midpj;
   
--  grant connect, resource,create view to ict06_team1_midpj;   
-- 3. 락 해제
-- alter user <계정이름> account unlock;
    alter user ict06_team1_midpj account unlock;

-- 실행결과   
--ict06_team1_midpj이(가) 생성되었습니다.
--Grant을(를) 성공했습니다.
--ict06_team1_midpj이(가) 변경되었습니다.