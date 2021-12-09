select user(), database();

drop database if exists beansFarm;

create database if not exists beansFarm;

use beansFarm;

-- 회원
DROP TABLE IF EXISTS beansFarm.member RESTRICT;

-- 맴버쉽
DROP TABLE IF EXISTS beansFarm.membership RESTRICT;

-- 쿠폰
DROP TABLE IF EXISTS beansFarm.coupon RESTRICT;

-- QnA
DROP TABLE IF EXISTS beansFarm.qna RESTRICT;

-- 제품
DROP TABLE IF EXISTS beansFarm.product RESTRICT;

-- 원산지
DROP TABLE IF EXISTS beansFarm.origin RESTRICT;

-- 카테고리
DROP TABLE IF EXISTS beansFarm.category RESTRICT;

-- 상품옵션
DROP TABLE IF EXISTS beansFarm.p_option RESTRICT;

-- 옵션분류
DROP TABLE IF EXISTS beansFarm.option_classification RESTRICT;

-- 제품상세페이지
DROP TABLE IF EXISTS beansFarm.product_details_page RESTRICT;

-- 장바구니
DROP TABLE IF EXISTS beansFarm.cart RESTRICT;

-- 후기
DROP TABLE IF EXISTS beansFarm.review RESTRICT;

-- 문의분류
DROP TABLE IF EXISTS beansFarm.inquiry_classification RESTRICT;

-- FAQ
DROP TABLE IF EXISTS beansFarm.faq RESTRICT;

-- 관리자
DROP TABLE IF EXISTS beansFarm.manager RESTRICT;

-- 공지사항
DROP TABLE IF EXISTS beansFarm.notice RESTRICT;

-- 주문서
DROP TABLE IF EXISTS beansFarm.p_order RESTRICT;

-- 주소
DROP TABLE IF EXISTS beansFarm.address RESTRICT;

-- 반품
DROP TABLE IF EXISTS beansFarm.p_return RESTRICT;

-- 반품사유
DROP TABLE IF EXISTS beansFarm.return_reason RESTRICT;

-- 빈즈팜
DROP SCHEMA IF EXISTS beansFarm;

-- 빈즈팜
CREATE SCHEMA beansFarm;

-- 회원
CREATE TABLE beansFarm.member (
	m_no               BIGINT       NOT NULL, -- 회원번호
	m_id               VARCHAR(50)  NOT NULL, -- 아이디
	m_pw               VARCHAR(100) NOT NULL, -- 비밀번호
	m_name             VARCHAR(20)  NOT NULL, -- 이름
	m_phone            VARCHAR(13)  NOT NULL, -- 전화번호
	m_postnum          VARCHAR(7)   NOT NULL, -- 우편번호
	m_address          VARCHAR(50)  NOT NULL, -- 주소
	m_detailed_address VARCHAR(100) NOT NULL, -- 상세주소
	m_point            INT          NULL     DEFAULT 0, -- 포인트
	membership_no      INT          NOT NULL DEFAULT 1, -- 등급번호
	m_reg_date         TIMESTAMP    NULL     DEFAULT current_timestamp, -- 가입일
	m_email            VARCHAR(100) NOT NULL, -- 이메일
	m_leave            VARCHAR(1)   NOT NULL DEFAULT "n" -- 탈퇴여부
);

-- 회원
ALTER TABLE beansFarm.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			m_no -- 회원번호
		);

ALTER TABLE beansFarm.member
	MODIFY COLUMN m_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.member
	AUTO_INCREMENT = 0;

-- 맴버쉽
CREATE TABLE beansFarm.membership (
	membership_no   INT         NOT NULL, -- 등급번호
	membership_name VARCHAR(50) NOT NULL, -- 등급이름
	point_ratio     INT         NULL      -- 포인트율
);

-- 맴버쉽
ALTER TABLE beansFarm.membership
	ADD CONSTRAINT PK_membership -- 맴버쉽 기본키
		PRIMARY KEY (
			membership_no -- 등급번호
		);

ALTER TABLE beansFarm.membership
	MODIFY COLUMN membership_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.membership
	AUTO_INCREMENT = 0;

-- 쿠폰
CREATE TABLE beansFarm.coupon (
	c_no              BIGINT       NOT NULL, -- 쿠폰번호
	m_no              BIGINT       NOT NULL, -- 회원번호
	c_name            VARCHAR(40)  NOT NULL, -- 쿠폰이름
	c_reg_date        TIMESTAMP    NULL     DEFAULT current_timestamp, -- 발행일자
	c_expiration_date TIMESTAMP    NULL,     -- 만료일자
	c_content         VARCHAR(100) NOT NULL, -- 쿠폰내용
	c_discount        INT          NOT NULL, -- 할인율
	c_use             VARCHAR(1)   NULL     DEFAULT "n" -- 사용여부
);

-- 쿠폰
ALTER TABLE beansFarm.coupon
	ADD CONSTRAINT PK_coupon -- 쿠폰 기본키
		PRIMARY KEY (
			c_no -- 쿠폰번호
		);

ALTER TABLE beansFarm.coupon
	MODIFY COLUMN c_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.coupon
	AUTO_INCREMENT = 0;

-- QnA
CREATE TABLE beansFarm.qna (
	q_no          BIGINT        NOT NULL, -- 문의번호
	q_title       VARCHAR(200)  NOT NULL, -- 문의제목
	q_content     VARCHAR(1024) NOT NULL, -- 문의내용
	q_image       VARCHAR(100)  NULL,     -- 문의이미지
	m_no          BIGINT        NOT NULL, -- 회원번호
	q_reg_date    TIMESTAMP     NULL     DEFAULT current_timestamp, -- 작성일자
	ic_no         INT           NOT NULL, -- 분류번호
	manager_no    INT           NULL,     -- 관리자번호
	q_status      VARCHAR(20)   NULL     DEFAULT "답변 대기중", -- 답변상태
	q_answer      VARCHAR(1024) NULL,     -- 답변내용
	q_answer_date TIMESTAMP     NULL      -- 답변일자
);

-- QnA
ALTER TABLE beansFarm.qna
	ADD CONSTRAINT PK_qna -- QnA 기본키
		PRIMARY KEY (
			q_no -- 문의번호
		);

ALTER TABLE beansFarm.qna
	MODIFY COLUMN q_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.qna
	AUTO_INCREMENT = 0;

-- 제품
CREATE TABLE beansFarm.product (
	p_no           BIGINT       NOT NULL, -- 제품번호
	category_no    INT          NOT NULL, -- 카테고리번호
	p_name         VARCHAR(40)  NOT NULL, -- 제품이름
	p_price        INT          NOT NULL, -- 판매가격
	p_manufacturer VARCHAR(40)  NOT NULL, -- 제조사
	origin_no      INT          NOT NULL, -- 원산지번호
	p_image        VARCHAR(200) NOT NULL, -- 제품이미지
	p_thumbnail    VARCHAR(200) NOT NULL  -- 제품썸네일
);

-- 제품
ALTER TABLE beansFarm.product
	ADD CONSTRAINT PK_product -- 제품 기본키
		PRIMARY KEY (
			p_no -- 제품번호
		);

ALTER TABLE beansFarm.product
	MODIFY COLUMN p_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.product
	AUTO_INCREMENT = 0;

-- 원산지
CREATE TABLE beansFarm.origin (
	origin_no   INT         NOT NULL, -- 원산지번호
	origin_name VARCHAR(40) NOT NULL  -- 원산지명
);

-- 원산지
ALTER TABLE beansFarm.origin
	ADD CONSTRAINT PK_origin -- 원산지 기본키
		PRIMARY KEY (
			origin_no -- 원산지번호
		);

ALTER TABLE beansFarm.origin
	MODIFY COLUMN origin_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.origin
	AUTO_INCREMENT = 0;

-- 카테고리
CREATE TABLE beansFarm.category (
	category_no   INT         NOT NULL, -- 카테고리번호
	category_name VARCHAR(40) NOT NULL  -- 카테고리이름
);

-- 카테고리
ALTER TABLE beansFarm.category
	ADD CONSTRAINT PK_category -- 카테고리 기본키
		PRIMARY KEY (
			category_no -- 카테고리번호
		);

ALTER TABLE beansFarm.category
	MODIFY COLUMN category_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.category
	AUTO_INCREMENT = 0;

-- 상품옵션
CREATE TABLE beansFarm.p_option (
	op_no    INT         NOT NULL, -- 옵션번호
	p_no     BIGINT      NULL,     -- 제품번호
	op_name  VARCHAR(40) NOT NULL, -- 옵션명
	op_price INT         NOT NULL, -- 옵션가격
	op_stock INT         NULL     DEFAULT 0, -- 옵션재고
	oc_no    INT         NOT NULL  -- 옵션분류번호
);

-- 상품옵션
ALTER TABLE beansFarm.p_option
	ADD CONSTRAINT PK_p_option -- 상품옵션 기본키
		PRIMARY KEY (
			op_no -- 옵션번호
		);

ALTER TABLE beansFarm.p_option
	MODIFY COLUMN op_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.p_option
	AUTO_INCREMENT = 0;

-- 옵션분류
CREATE TABLE beansFarm.option_classification (
	oc_no   INT         NOT NULL, -- 옵션분류번호
	oc_name VARCHAR(40) NOT NULL  -- 옵션분류명
);

-- 옵션분류
ALTER TABLE beansFarm.option_classification
	ADD CONSTRAINT PK_option_classification -- 옵션분류 기본키
		PRIMARY KEY (
			oc_no -- 옵션분류번호
		);

ALTER TABLE beansFarm.option_classification
	MODIFY COLUMN oc_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.option_classification
	AUTO_INCREMENT = 0;

-- 제품상세페이지
CREATE TABLE beansFarm.product_details_page (
	p_no     BIGINT       NOT NULL, -- 제품번호
	pd_image VARCHAR(200) NOT NULL  -- 상세이미지
);

-- 제품상세페이지
ALTER TABLE beansFarm.product_details_page
	ADD CONSTRAINT PK_product_details_page -- 제품상세페이지 기본키
		PRIMARY KEY (
			p_no -- 제품번호
		);

ALTER TABLE beansFarm.product_details_page
	MODIFY COLUMN p_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.product_details_page
	AUTO_INCREMENT = 0;

-- 장바구니
CREATE TABLE beansFarm.cart (
	cart_no          BIGINT NOT NULL, -- 장바구니번호
	m_no             BIGINT NOT NULL, -- 회원번호
	p_no             BIGINT NOT NULL, -- 제품번호
	op_no1           INT    NULL,     -- 옵션번호1
	option_quantity1 INT    NULL,     -- 옵션수량1
	op_no2           INT    NULL,     -- 옵션번호2
	order_price      INT    NULL      -- 장바구니가격
);

-- 장바구니
ALTER TABLE beansFarm.cart
	ADD CONSTRAINT PK_cart -- 장바구니 기본키
		PRIMARY KEY (
			cart_no -- 장바구니번호
		);

ALTER TABLE beansFarm.cart
	MODIFY COLUMN cart_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.cart
	AUTO_INCREMENT = 0;

-- 후기
CREATE TABLE beansFarm.review (
	r_no        BIGINT        NOT NULL, -- 후기번호
	m_no        BIGINT        NOT NULL, -- 회원번호
	order_no    VARCHAR(200)  NOT NULL, -- 주문번호
	r_title     VARCHAR(40)   NOT NULL, -- 후기제목
	r_content   VARCHAR(1024) NOT NULL, -- 후기내용
	r_photo     VARCHAR(200)  NULL,     -- 후기사진
	r_thumbnail VARCHAR(200)  NULL,     -- 후기썸네일
	r_star      INT           NOT NULL, -- 별점
	r_view_cont INT           NULL     DEFAULT 0, -- 조회수
	r_reg_date  TIMESTAMP     NULL     DEFAULT current_timestamp -- 작성일자
);

-- 후기
ALTER TABLE beansFarm.review
	ADD CONSTRAINT PK_review -- 후기 기본키
		PRIMARY KEY (
			r_no -- 후기번호
		);

ALTER TABLE beansFarm.review
	MODIFY COLUMN r_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.review
	AUTO_INCREMENT = 0;

-- 문의분류
CREATE TABLE beansFarm.inquiry_classification (
	ic_no   INT         NOT NULL, -- 분류번호
	ic_name VARCHAR(40) NOT NULL  -- 분류명
);

-- 문의분류
ALTER TABLE beansFarm.inquiry_classification
	ADD CONSTRAINT PK_inquiry_classification -- 문의분류 기본키
		PRIMARY KEY (
			ic_no -- 분류번호
		);

ALTER TABLE beansFarm.inquiry_classification
	MODIFY COLUMN ic_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.inquiry_classification
	AUTO_INCREMENT = 0;

-- FAQ
CREATE TABLE beansFarm.faq (
	faq_no      INT           NOT NULL, -- FAQ번호
	ic_no       INT           NULL,     -- 분류번호
	faq_title   VARCHAR(40)   NOT NULL, -- FAQ제목
	faq_content VARCHAR(1024) NOT NULL  -- FAQ내용
);

-- FAQ
ALTER TABLE beansFarm.faq
	ADD CONSTRAINT PK_faq -- FAQ 기본키
		PRIMARY KEY (
			faq_no -- FAQ번호
		);

ALTER TABLE beansFarm.faq
	MODIFY COLUMN faq_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.faq
	AUTO_INCREMENT = 0;

-- 관리자
CREATE TABLE beansFarm.manager (
	manager_no   INT          NOT NULL, -- 관리자번호
	manager_id   VARCHAR(40)  NOT NULL, -- 관리자ID
	manager_pw   VARCHAR(100) NOT NULL, -- 관리자 비밀번호
	manager_name VARCHAR(40)  NOT NULL  -- 관리자 이름
);

-- 관리자
ALTER TABLE beansFarm.manager
	ADD CONSTRAINT PK_manager -- 관리자 기본키
		PRIMARY KEY (
			manager_no -- 관리자번호
		);

ALTER TABLE beansFarm.manager
	MODIFY COLUMN manager_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.manager
	AUTO_INCREMENT = 0;

-- 공지사항
CREATE TABLE beansFarm.notice (
	notice_no         INT           NOT NULL, -- 공지번호
	notice_title      VARCHAR(40)   NOT NULL, -- 공지제목
	notice_content    VARCHAR(1024) NULL,     -- 내용
	manager_no        INT           NOT NULL, -- 관리자번호
	notice_reg_date   TIMESTAMP     NULL     DEFAULT current_timestamp, -- 작성일자
	notice_view_count INT           NULL     DEFAULT 0, -- 조회수
	notice_fix        VARCHAR(1)    NULL     DEFAULT "n" -- 고정게시글
);

-- 공지사항
ALTER TABLE beansFarm.notice
	ADD CONSTRAINT PK_notice -- 공지사항 기본키
		PRIMARY KEY (
			notice_no -- 공지번호
		);

ALTER TABLE beansFarm.notice
	MODIFY COLUMN notice_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.notice
	AUTO_INCREMENT = 0;

-- 주문서
CREATE TABLE beansFarm.p_order (
	order_no         VARCHAR(200) NOT NULL, -- 주문번호
	m_no             BIGINT       NOT NULL, -- 회원번호
	c_no             BIGINT       NULL,     -- 쿠폰번호
	postnum          VARCHAR(7)   NOT NULL, -- 우편번호
	address          VARCHAR(50)  NOT NULL, -- 주소
	detailed_address VARCHAR(100) NOT NULL, -- 상세주소
	recipient_name   VARCHAR(20)  NOT NULL, -- 받는분이름
	recipient_phone  VARCHAR(13)  NOT NULL, -- 받는분 전화
	point_use        INT          NULL,     -- 사용포인트
	order_price      INT          NOT NULL, -- 주문금액
	order_reg_date   TIMESTAMP    NULL     DEFAULT current_timestamp, -- 주문일시
	p_no             BIGINT       NULL,     -- 제품번호
	op_no1           INT          NULL,     -- 옵션번호1
	option_quantity1 INT          NULL,     -- 옵션수량1
	op_no2           INT          NULL,     -- 옵션번호2
	p_return         VARCHAR(1)   NULL     DEFAULT "n" -- 반품여부
);

-- 주문서
ALTER TABLE beansFarm.p_order
	ADD CONSTRAINT PK_p_order -- 주문서 기본키
		PRIMARY KEY (
			order_no -- 주문번호
		);

ALTER TABLE beansFarm.p_order
	MODIFY COLUMN order_no VARCHAR(200) NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.p_order
	AUTO_INCREMENT = 0;

-- 주소
CREATE TABLE beansFarm.address (
	addr_no          BIGINT       NOT NULL, -- 주소번호
	m_no             BIGINT       NULL,     -- 회원번호
	addr_nickname    VARCHAR(40)  NOT NULL DEFAULT "기본 주소", -- 배송지별칭
	postnum          VARCHAR(7)   NOT NULL, -- 우편번호
	address          VARCHAR(50)  NOT NULL, -- 주소
	detailed_address VARCHAR(100) NOT NULL, -- 상세주소
	recipient_name   VARCHAR(20)  NOT NULL, -- 받는분이름
	recipient_phone  VARCHAR(13)  NOT NULL, -- 받는분 전화
	address_delete   VARCHAR(1)   NULL     DEFAULT "n" -- 삭제여부
);

-- 주소
ALTER TABLE beansFarm.address
	ADD CONSTRAINT PK_address -- 주소 기본키
		PRIMARY KEY (
			addr_no -- 주소번호
		);

ALTER TABLE beansFarm.address
	MODIFY COLUMN addr_no BIGINT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.address
	AUTO_INCREMENT = 0;

-- 반품
CREATE TABLE beansFarm.p_return (
	return_no        INT           NOT NULL, -- 반품번호
	order_no         VARCHAR(200)  NULL,     -- 주문번호
	return_reason_no INT           NULL,     -- 반품사유번호
	return_content   VARCHAR(1024) NOT NULL  -- 반품내용
);

-- 반품
ALTER TABLE beansFarm.p_return
	ADD CONSTRAINT PK_p_return -- 반품 기본키
		PRIMARY KEY (
			return_no -- 반품번호
		);

ALTER TABLE beansFarm.p_return
	MODIFY COLUMN return_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.p_return
	AUTO_INCREMENT = 0;

-- 반품사유
CREATE TABLE beansFarm.return_reason (
	return_reason_no INT         NOT NULL, -- 반품사유번호
	return_reason    VARCHAR(50) NULL      -- 반품사유
);

-- 반품사유
ALTER TABLE beansFarm.return_reason
	ADD CONSTRAINT PK_return_reason -- 반품사유 기본키
		PRIMARY KEY (
			return_reason_no -- 반품사유번호
		);

ALTER TABLE beansFarm.return_reason
	MODIFY COLUMN return_reason_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE beansFarm.return_reason
	AUTO_INCREMENT = 0;

-- 회원
ALTER TABLE beansFarm.member
	ADD CONSTRAINT FK_membership_TO_member -- 맴버쉽 -> 회원
		FOREIGN KEY (
			membership_no -- 등급번호
		)
		REFERENCES beansFarm.membership ( -- 맴버쉽
			membership_no -- 등급번호
		);

-- 쿠폰
ALTER TABLE beansFarm.coupon
	ADD CONSTRAINT FK_member_TO_coupon -- 회원 -> 쿠폰
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- QnA
ALTER TABLE beansFarm.qna
	ADD CONSTRAINT FK_member_TO_qna -- 회원 -> QnA
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- QnA
ALTER TABLE beansFarm.qna
	ADD CONSTRAINT FK_inquiry_classification_TO_qna -- 문의분류 -> QnA
		FOREIGN KEY (
			ic_no -- 분류번호
		)
		REFERENCES beansFarm.inquiry_classification ( -- 문의분류
			ic_no -- 분류번호
		);

-- QnA
ALTER TABLE beansFarm.qna
	ADD CONSTRAINT FK_manager_TO_qna -- 관리자 -> QnA
		FOREIGN KEY (
			manager_no -- 관리자번호
		)
		REFERENCES beansFarm.manager ( -- 관리자
			manager_no -- 관리자번호
		);

-- 제품
ALTER TABLE beansFarm.product
	ADD CONSTRAINT FK_origin_TO_product -- 원산지 -> 제품
		FOREIGN KEY (
			origin_no -- 원산지번호
		)
		REFERENCES beansFarm.origin ( -- 원산지
			origin_no -- 원산지번호
		);

-- 제품
ALTER TABLE beansFarm.product
	ADD CONSTRAINT FK_category_TO_product -- 카테고리 -> 제품
		FOREIGN KEY (
			category_no -- 카테고리번호
		)
		REFERENCES beansFarm.category ( -- 카테고리
			category_no -- 카테고리번호
		);

-- 상품옵션
ALTER TABLE beansFarm.p_option
	ADD CONSTRAINT FK_option_classification_TO_p_option -- 옵션분류 -> 상품옵션
		FOREIGN KEY (
			oc_no -- 옵션분류번호
		)
		REFERENCES beansFarm.option_classification ( -- 옵션분류
			oc_no -- 옵션분류번호
		);

-- 상품옵션
ALTER TABLE beansFarm.p_option
	ADD CONSTRAINT FK_product_TO_p_option -- 제품 -> 상품옵션
		FOREIGN KEY (
			p_no -- 제품번호
		)
		REFERENCES beansFarm.product ( -- 제품
			p_no -- 제품번호
		);

-- 제품상세페이지
ALTER TABLE beansFarm.product_details_page
	ADD CONSTRAINT FK_product_TO_product_details_page -- 제품 -> 제품상세페이지
		FOREIGN KEY (
			p_no -- 제품번호
		)
		REFERENCES beansFarm.product ( -- 제품
			p_no -- 제품번호
		);

-- 장바구니
ALTER TABLE beansFarm.cart
	ADD CONSTRAINT FK_member_TO_cart -- 회원 -> 장바구니
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- 장바구니
ALTER TABLE beansFarm.cart
	ADD CONSTRAINT FK_product_TO_cart -- 제품 -> 장바구니
		FOREIGN KEY (
			p_no -- 제품번호
		)
		REFERENCES beansFarm.product ( -- 제품
			p_no -- 제품번호
		);

-- 장바구니
ALTER TABLE beansFarm.cart
	ADD CONSTRAINT FK_p_option_TO_cart2 -- 상품옵션 -> 장바구니
		FOREIGN KEY (
			op_no1 -- 옵션번호1
		)
		REFERENCES beansFarm.p_option ( -- 상품옵션
			op_no -- 옵션번호
		);

-- 장바구니
ALTER TABLE beansFarm.cart
	ADD CONSTRAINT FK_p_option_TO_cart -- 상품옵션 -> 장바구니2
		FOREIGN KEY (
			op_no2 -- 옵션번호2
		)
		REFERENCES beansFarm.p_option ( -- 상품옵션
			op_no -- 옵션번호
		);

-- 후기
ALTER TABLE beansFarm.review
	ADD CONSTRAINT FK_member_TO_review -- 회원 -> 후기
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- 후기
ALTER TABLE beansFarm.review
	ADD CONSTRAINT FK_p_order_TO_review -- 주문서 -> 후기
		FOREIGN KEY (
			order_no -- 주문번호
		)
		REFERENCES beansFarm.p_order ( -- 주문서
			order_no -- 주문번호
		);

-- FAQ
ALTER TABLE beansFarm.faq
	ADD CONSTRAINT FK_inquiry_classification_TO_faq -- 문의분류 -> FAQ
		FOREIGN KEY (
			ic_no -- 분류번호
		)
		REFERENCES beansFarm.inquiry_classification ( -- 문의분류
			ic_no -- 분류번호
		);

-- 공지사항
ALTER TABLE beansFarm.notice
	ADD CONSTRAINT FK_manager_TO_notice -- 관리자 -> 공지사항
		FOREIGN KEY (
			manager_no -- 관리자번호
		)
		REFERENCES beansFarm.manager ( -- 관리자
			manager_no -- 관리자번호
		);

-- 주문서
ALTER TABLE beansFarm.p_order
	ADD CONSTRAINT FK_member_TO_p_order -- 회원 -> 주문서
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- 주소
ALTER TABLE beansFarm.address
	ADD CONSTRAINT FK_member_TO_address -- 회원 -> 주소
		FOREIGN KEY (
			m_no -- 회원번호
		)
		REFERENCES beansFarm.member ( -- 회원
			m_no -- 회원번호
		);

-- 반품
ALTER TABLE beansFarm.p_return
	ADD CONSTRAINT FK_p_order_TO_p_return -- 주문서 -> 반품
		FOREIGN KEY (
			order_no -- 주문번호
		)
		REFERENCES beansFarm.p_order ( -- 주문서
			order_no -- 주문번호
		);

-- 반품
ALTER TABLE beansFarm.p_return
	ADD CONSTRAINT FK_return_reason_TO_p_return -- 반품사유 -> 반품
		FOREIGN KEY (
			return_reason_no -- 반품사유번호
		)
		REFERENCES beansFarm.return_reason ( -- 반품사유
			return_reason_no -- 반품사유번호
		);