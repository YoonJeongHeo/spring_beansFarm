-- -----------------------------------------------------------------------------------------------------------------
-- 사전준비
-- 0. C드라이브를 들어가서 beansFarm폴더 만들기
-- 0-1. beansFarm폴더안에 product, review, temp, qna 폴더를 만들어준다.
-- 0-2. product폴더안에 productDetails폴더를 만들어 준다.
-- 0-3. 각 폴더안에 none.png사진 넣어주기.
-- ---- 모든 이미지는 이클립스내에 images 안에 있으니 참고 하시면 됩니다

-- 1. 디비 테이블을 생성후 멤버쉽을 넣어줍니다.
-- 2. 이클립스내에 태스트중 회원,쿠폰, 관리자순으로 돌립니다.)
-- (그 후, 멤버쉽을 주석걸고 실행하시면 됩니다.)


-- 멤버쉽
-- insert into membership values(1, 'WHITE', 1);
-- insert into membership values(2, 'SILVER', 3);
-- insert into membership values(3, 'GOLD', 5);
-- insert into membership values(4, 'VIP', 7);
-- insert into membership values(5, 'VVIP', 9);

-- 문의분류
insert into inquiry_classification
values(1, "상품문의"), (2, "결제문의"), (3, "배송문의"), (4, "기타");

-- 원산지
insert into origin(origin_name) values("에티오피아");
insert into origin(origin_name) values("과테말라");
insert into origin(origin_name) values("예가체프");
insert into origin(origin_name) values("브라질");
insert into origin(origin_name) values("인도");
insert into origin(origin_name) values("인도네시아");
insert into origin(origin_name) values("콜롬비아");
insert into origin(origin_name) values("파푸아");
insert into origin(origin_name) values("코스타리카");
insert into origin(origin_name) values("케냐");

-- 카테고리
insert into category(category_name) values("고소한 맛");
insert into category(category_name) values("산미 맛");
insert into category(category_name) values("디카페인");

-- 옵션분류
insert into option_classification(oc_name) values("용량선택");
insert into option_classification(oc_name) values("분쇄선택");

-- 제품(고소한맛)
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(1, "브라질 옐로우 버번", 8000, "원두팜", 4, "브라질.jpg", "브라질.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(1, "브라질 세하도 파인컵 NY2", 5300, "원두팜", 4, "브라질.jpg", "브라질.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(1, "인도 마이소르 너깃 엑스트라 볼드", 8000, "원두팜", 5, "인도.jpg", "인도.jpg");

-- 제품(산미)
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "과테말라 엘 소코로 옐로우 카투라", 13000, "원두팜", 2, "과테말라.jpg", "과테말라.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "에티오피아 아리차 내추럴 G1 스페셜티", 12000, "원두팜", 1, "에티오피아.jpg", "에티오피아.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "에티오피아 예가체프 G2", 8500, "원두팜", 1, "에티오피아.jpg", "에티오피아.jpg");

-- 제품(디카페인)
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(3, "콜롬비아 엑셀소 마운틴 워터 디카페인", 13000, "원두팜", 7, "콜롬비아디카페인.jpg", "콜롬비아디카페인.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(3, "브라질 마운틴 워터 디카페인", 14000, "원두팜", 4, "브라질디카페인.jpg", "브라질디카페인.jpg");

-- 상품옵션(용량선택) 1~8 
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "1kg", 2000, 10, 1);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "200g", 0, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "500g", 1000, 10, 1);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "1kg", 2000, 10, 1);

-- 상품옵션(분쇄선택) 1~8 
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(1, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(2, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(3, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(4, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(5, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(6, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(7, "에스프레소 분쇄", 0, 10, 2);

insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "원두상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "프렌치프레스 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "드립 및 커피메이커", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "더치상태", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "모카포트 분쇄", 0, 10, 2);
insert into p_option(p_no, op_name, op_price, op_stock, oc_no) values(8, "에스프레소 분쇄", 0, 10, 2);

-- 주소
insert into address(m_no, addr_nickname, postnum, address, detailed_address, recipient_name, recipient_phone)
values(1, "우리집", 1234567, "대구달성군", "104동802호", "백승엽", "01072721823");

-- 장바구니
insert into cart(m_no, p_no, op_no1, option_quantity1, op_no2, order_price)
   values(1, 1, 1, 1, 1, 8000);
  
-- FAQ
insert into faq(ic_no, faq_title, faq_content) values(1, "질문사항", "질문사항내용");

-- 공지사항
insert into notice(notice_title, notice_content, manager_no)
values("공지제목", "공지내용", 1);


-- 주문서s
 insert into p_order(order_id, m_no, postnum, address, detailed_address, recipient_name, recipient_phone, order_price, p_no, op_no1, option_quantity1, op_no2)
    values(1, 1, "100", "대구", "달서구", "홍길동", "010-1111-1111", 5000, 1, 1, 1, 1);
   
-- 제품상세페이지
insert into product_details_page(p_no, pd_image) values(1, "브라질 옐로우 버번.jpg");
insert into product_details_page(p_no, pd_image) values(2, "브라질 세하도 파인컵 NY2.jpg");
insert into product_details_page(p_no, pd_image) values(3, "인도 마이소르 너깃 엑스트라 볼드.jpg");
insert into product_details_page(p_no, pd_image) values(4, "과테말라 엘 소코로 옐로우 카투라.jpg");
insert into product_details_page(p_no, pd_image) values(5, "에티오피아 아리차 내추럴 G1 스페셜티	.jpg");
insert into product_details_page(p_no, pd_image) values(6, "에티오피아 예가체프 G2.jpg");
insert into product_details_page(p_no, pd_image) values(7, "콜롬비아 엑셀소 마운틴 워터 디카페인.jpg");
insert into product_details_page(p_no, pd_image) values(8, "브라질 마운틴 워터 디카페인.jpg");

-- 후기
insert into review(m_no, order_no, r_title, r_content, r_photo, r_thumbnail, r_star)
values(1, 1, "더미", "더미데이터", "none.png", "none.png", 5);

-- QnA
insert into qna(q_title, q_content, m_no, ic_no, manager_no, q_answer, q_answer_date)
values("문의 제목", "문의 내용", 1, 1, 1, "답변내용", "2021-12-29");