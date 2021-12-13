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
values(1, "브라질 옐로우 버번", 8000, "원두팜", 4, "브라질.jpg", "t_브라질.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(1, "브라질 세하도 파인컵 NY2", 5300, "원두팜", 4, "브라질.jpg", "t_브라질.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(1, "인도 마이소르 너깃 엑스트라 볼드", 8000, "원두팜", 5, "인도.jpg", "t_인도.jpg");

-- 제품(산미)
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "과테말라 엘 소코로 옐로우 카투라", 13000, "원두팜", 2, "과테말라.jpg", "t_과테말라.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "에티오피아 아리차 내추럴 G1 스페셜티", 12000, "원두팜", 1, "에티오피아.jpg", "t_에티오피아.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(2, "에티오피아 예가체프 G2", 8500, "원두팜", 1, "에티오피아.jpg", "t_에티오피아.jpg");

-- 제품(디카페인)
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(3, "콜롬비아 엑셀소 마운틴 워터 디카페인", 13000, "원두팜", 7, "콜롬비아디카페인.jpg", "t_콜롬비아디카페인.jpg");
insert into product(category_no, p_name, p_price, p_manufacturer, origin_no, p_image, p_thumbnail)
values(3, "브라질 마운틴 워터 디카페인", 14000, "원두팜", 4, "브라질디카페인.jpg", "t_브라질디카페인.jpg");

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

-- 공지사항
insert into notice (notice_title, notice_content, manager_no, notice_fix)
values ("Beans Farm 프리미엄 신상입고!!", "프리미엄 원두 12종이 입고 되었습니다. \r\n\r\n스페셜티 싱글, 블렌드, 디카페인 라인 총 12종이 출시되었습니다. \r\n\r\n많은 관심 부탁드리겠습니다.", 1, "y");

insert into notice (notice_title, notice_content, manager_no, notice_fix)
values ("Beans Farm 교환 및 반품 안내", "커피를 반품하실 경우 상품 수령일 기준으로 7일 이내에 가능합니다. \r\n\r\n개인 기호(맟&향) 분쇄 옵션 등 선택을 잘못하였을 경우 교환 및 반품이 불가합니다. \r\n\r\n오배송 또는 제품하자가 있는 경우 고객센터로 연락주시기 바랍니다. \r\n\r\n항상 신선함을 유지하는 Beans Farm이 되겠습니다.", 1, "y");

insert into notice (notice_title, notice_content, manager_no, notice_fix)
values ("Beans Farm 배송시간 안내", "저희 Beans Farm에서는 당일 오후 3시까지 주문된 사항은 당일 날 익일 배송이 가능합니다. \r\n\r\n주문 결제시 참고 부탁드리겠습니다. \r\n\r\n항상 신선함을 유지하는 Beans Farm이 되겠습니다.", 1, "y");

insert into notice (notice_title, notice_content, manager_no)
values ("택배 파업으로인한 배송지연안내", "안녕하세요! BeansFarm입니다. \r\n\r\n2021년 6월 8일 (화) 14시 50분 기준 택배사 파업으로 인하여 배송이 지연 될 수 있는 점 안내드립니다 \r\n\r\n배송기간에 여유를 두고 주문 해주시면 감사하겠습니다. \r\n\r\n불편을 드려 죄송합니다.", 1);

insert into notice (notice_title, notice_content, manager_no)
values ("8월 임시공휴일 배송안내", "안녕하세요! BeansFarm입니다. \r\n\r\n8월 임시공휴일로 인한 배송에 관하여 알려드리겠습니다. 8월 9일, 10일 까지는 주문시 도서 산간지역을 제외한 지역은 금주에 수령하실 수 있으니 그점 유의하여 주문해주십시오 \r\n\r\n10일 오후 3시 이후 주문은 16일 순차 출고 됩니다. \r\n\r\n항상 신선함을 유지하는 Beans Farm이 되겠습니다. \r\n항상 BeansFarm을 이용해주셔서 감사합니다.", 1);

insert into notice (notice_title, notice_content, manager_no)
values ("추석연휴 배송안내", "안녕하세요! BeansFarm입니다. \r\n\r\n9월 15일(수) 오전 9시 이전 주문 및 결제 완료건은 정상 출고되며, \r\n이후 주문 및 결제건은 9월 24일(목)부터 순차적으로 발송됩니다. \r\n\r\n추석 연휴 전 택배사의 물량 증가로 인해 배송이 원활하지 않을 수 있는점 양해부탁드립니다. \r\n\r\n마음까지 넉넉해지는 한가위 건강하고 풍요로운 명절 보내시기 바랍니다.", 1);

insert into notice (notice_title, notice_content, manager_no)
values ("10월 대체공휴일 휴무안내 및 배송지연 안내", "안녕하세요! BeansFarm입니다. \r\n\r\n개천절, 한글날 대체휴무일 안내입니다. \r\n대체공휴일 기간 택배사 물량증가로 배송이 원활하지 않을 수 있는점 양해부탁드립니다. \r\n\r\n10월 8일(금) 오전 9시 이전 주문 당일 배송건은 \r\n10월 9일(토) 한글날 휴무로 인하여 택배배송이 없으므로 \r\n10월 12일(화) 부터 순차배송 될 예정입니다. \r\n항상 BeansFarm을 이용해주셔서 감사합니다.", 1);

insert into notice (notice_title, notice_content, manager_no)
values ("11월 빼빼로데이 이벤트!! (종료)", "빼뺴로데이 SPECIAL EVENT!! \r\n원두 10,000원 이상 구매시 빼빼로 1개 증정! \r\n원두 30,000원 이상 주문시 빼빼로 2개 증정! \r\n\r\n이벤트 기간 : 11.05(금) 오전 9시 이후 주문건 ~ 11.12(금) 오전 9시 이전 주문건 \r\n항상 BeansFarm을 이용해주셔서 감사합니다.", 1);

insert into notice (notice_title, notice_content, manager_no, notice_fix)
values ("이벤트!! 원두 구매 시 더치 증정!!", "원두 200g 4봉 또는 500g 2봉을 구매시 더치를 드립니다.!! \r\n\r\n많은 이용 부탁드리겠습니다.", 1, "y");

insert into notice (notice_title, notice_content, manager_no, notice_fix)
values ("이벤트!! 한정 랜덤박스 출시!!", "매일 20개 한정 판매!! \r\n\r\n최대 3만원 상당의 구성을 단돈 9,900원에 득템가능한 기회!! \r\n\r\n놓치지 말고 참여해주세요.", 1, "y");

insert into notice (notice_title, notice_content, manager_no)
values ("크리스마스 배송일정", "안녕하세요 Beans Farm입니다. \r\n\r\n크리스마스 배송 안내 공지 드립니다. \r\n\r\n12월 23일 오후3시 이전 주문시 당일 로스팅/ 당일 배송이 가능하며 이후 주문은 12월27일에 일괄 배송될 예정입니다. \r\n\r\n항상 신선함을 유지하는 BeansFarm이 되겠습니다.", 1);


-- faq
insert into faq(ic_no, faq_title, faq_content)
values (1, "분쇄커피 색상이 왜 균일하지 않죠? 밝은 노란색이 섞여있습니다.", "커피를 분쇄할 경우 노란 색상이 섞여 있는건
원두 가운데 있는 노란띠인 '센터컷'이 분쇄된 것입니다.
맛에는 아무런 영향이 없습니다.
신선한 뉴크롭을 사용하여 무조건 많이 볶는 것을 지양하고
산지 특성을 최대한 살려 로스팅을 하기에 로스팅 포인트가 원두별로 각기 다릅니다.
센터컷의 노란 색상은 약볶음일 때 더 잘 보이며, 볶음도에 따라 밝기 차이가 있습니다.
밝은 노란색이 섞인 커피는 약볶음으로 개성을 살린 커피입니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(1, "원두에 오일이 많아요. 오래된 것 아닌가요?", "원두 표면에 생겨나는 오일은 자연스러운 현상입니다.
원두 내에 많은 양 함유되어 있어,
볶은 후 일정량씩 계속 배출이 됩니다.

CITY 이상의 볶음도에서는 원두 오일이 배출되는 시간이 빠릅니다.
beansFarm의 홀릭 다크와 홀릭 에스프레소,
싱글오리진원두 중 콜롬비아 수프리모, 과테말라 등
강배전된 원두들은 오일이 빨리 생겨나서
배송받으실 때 쯤 오일이 배어있지만
맛과 향을 느껴보시면 당일로스팅의 신선함을 느끼실 수 있습니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(1, "봉투 뒷면에 체크된 알파벳은 무엇인가요?", "같은 산지의 커피일 경우,

봉투 뒷면에 있는 나라명에 체크 후 알파벳 약자로 구분하여 기입해드리고 있습니다.

<브라질>

MY - 브라질 MY

C - 브라질 세하도

E - 브라질 유로

<에티오피아>

S2 - 에티오피아 시다모 G2

S4 - 에티오피아 시다모 G4

Y2 - 에티오피아 예가체프 G2

Y4 - 에티오피아 예가체프 G4

GE - 에티오피아 게마드로 G4

<콜롬비아>

H - 콜롬비아 수프리모 후일라

M - 콜롬비아 메델린

B - beansFarm의 콜롬비아 블렌드 ");

insert into faq(ic_no, faq_title, faq_content)
values(1, "블렌딩커피를 구입했는데 콩 모양과 색깔이 달라요.", "블렌딩 커피란?
커피의 품종, 로스팅 정도, 가공 방법 등이 다른 두가지 이상의 커피를
혼합하는 과정으로 단조로움을 탈피하고 커피의 새로운 맛과 향을 만들어 내는 것을 말합니다.
블렌딩을 통하여 커피의 좋은 점은 서로 조화 시키고 부족한 점은 보완함으로써
보다 풍부하고 새로운 향미의 커피가 창조 되는 것입니다.

블렌딩 커피는 여러커피를 혼합하여 만들기 때문에
콩의 색깔과 모양이 다양해집니다.

같은 온도의 열을 받아도 다양한 콩이 모여 볶이다보니
원두의 색이 다르게 나타나는 것일뿐 로스팅이 고르게 되지 않은 것이 아닙니다.

두가지 이상의 커피콩이 모여
새로운 맛과 향을 창조합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values (2, "무통장 입금할 때 입금자명을 주문자명과 다르게 입금했어요.", "결제수단 중 무통장 입금 선택하여 결제 시
입금자명이 다를 경우에는 확인이 되지 않아, 처리 및 발송이 지연됩니다.
1:1 문의나 고객센터로 연락 후 말씀해주셔야 빠른 처리가 가능합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(2, "현금결제와 카드결제로 나누어서 결제하고 싶어요.", "beansFarm의 결제수단은 무통장입금, 카드결제로 이루어져 있습니다.
1가지 수단으로만 결제가 가능하며, 나누어서 결제하실 수는 없습니다.
적립금과는 함께 사용이 가능합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(2, "결제 영수증이 필요합니다.", "홈페이지 상단에 있는 마이페이지 내 주문목록/배송조회에서 주문번호를 누르시면
하단에 결제 정보를 확인하실 수 있습니다.
(마이페이지 - 쇼핑정보 카페고리 - 주문목록/배송조회 - 주문번호 클릭 - 결제정보)
");

insert into faq(ic_no, faq_title, faq_content)
values (3, "배송지를 변경하고 싶어요.", "택배 발송 전에
beansFarm 고객센터(1:1문의)문의 연락주시면
배송지를 변경하여 드립니다.

택배 출고 후 주소지 변경은 택배 교환 접수로 인하여 배송비가 추가로 부담되며,
배송 기한이 더 소요될 수 있으니 유의바랍니다.
");

insert into faq(ic_no, faq_title, faq_content)
values (3, "배송은 얼마나 걸리나요?", "당일 3시(오후) 이전 입금 확인건까지 당일 발송을 원칙으로 하고 있습니다.
주문 후 로스팅이 들어가기 때문에,
당일 주문 마감 시간 15시까지 주문 들어온 물량만큼 당일 출고해드리고 있습니다.

만약 기타 이유로 발송이 지연되면 저희 콩볶는 사람들에서 사전 연락을 드리며,
이점 고려하셔서 시간적 여유를 가지고 주문하시기 바랍니다.

(토요일 및 공휴일은 로스팅을 쉽니다.)

당일 출고시에
택배는 빠르면 익일 수령이 가능하시며,
택배사 사정과 집배지역 물량사정에 따라 1~3일 정도 후에 받아보실 수 있습니다.

beansFarm은 한진택배를 지정 택배사로 이용하고 있으며,
도서산간 지역의 경우 추가 택배비와 추가 시간이 소요될 수 있으니 유의 바랍니다.

기본 배송비는 2,500원이며 3만원 이상 주문시 무료배송 됩니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "회원으로 가입하면 어떤 혜택이 있나요?", " 신규 회원 가입시

1. 신규가입 쿠폰이 지급됩니다.
2. 회원으로 주문 시 총 결제 금액의 10%가 적립됩니다.
(비회원의 경우 적립되지 않습니다.)
3. 쇼핑몰 단독 이벤트 및 쿠폰발급 이벤트 참여가 가능합니다.

감사합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "상품을 구입하려면 꼭 회원 가입을 해야 하나요?", " 회원만 구입이 가능합니다.
비회원 상품 조회를 하실 수 있습니다.
beansFarm의 회원의 경우,
적립금 혜택, 각종 이벤트 참여기회 등 많은 혜택이 있으니
회원가입 후 상품을 구입하는 것이 좋습니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "개인정보를 변경하고 싶어요.", " 개인정보 변경은
홈페이지 상단의 마이페이지 메뉴를 클릭하시면 변경이 가능합니다.
거주지나 연락처가 변경되신 경우 수정해주시기 바랍니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "회원 탈퇴는 어떻게 하나요?", " 홈페이지 상단 마이페이지 버튼을 클릭하셔서
왼쪽 메뉴탭의 1:1문의게시판을 들어가시면
회원탈퇴 버튼이 있습니다

탈퇴 즉시 모든 개인정보와 포인트가 삭제되오니 이점 유념하시기 바랍니다.
삭제된 포인트는 재가입하셔도 복구가 되지 않습니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "비밀번호가 기억이 나지 않아요.", " ID나 비밀번호가 기억이 나지 않으실 때에는
로그인 페이지의 ID찾기/비밀번호찾기 메뉴를 이용해주세요.

가입당시 입력하셨던 성함과 이메일주소 등 간단한 정보 확인 후
회원가입시 등록하셨던 E-MAIL 주소로 임시번호를 발급해드리고 있습니다.
임시번호로 로그인한 뒤에는 반드시 비밀번호를 변경하여 주세요.

이메일주소가 기억이 나지 않으시다면
고객센터로 문의주시면 정보확인 후
안내해드리도록 하겠습니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "임시비밀번호 발급받는 이메일/휴대폰 번호를 분실했어요", " 임시 비밀번호를 발급은 기존에 등록하셨던 이메일주소 혹은 휴대전화번호로 발송이 됩니다.
회원정보에 등록된 이메일주소와 휴대폰 번호가 변경되어 회원정보 수정을 원하시는 경우
beansFarm 고객센터(1:1문의)로 문의하여 주세요
감사합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "적립마일리지(적립금)은 얼마 이상 사용 가능한가요?", " 적립마일리지(적립금)은 3,000원 이상이면 언제든지 사용 가능합니다.

감사합니다.
");

insert into faq(ic_no, faq_title, faq_content)
values(4, "적립금이 적립 안됐어요.", " 적립금은 구매확정 후 자동으로 적립됩니다.
전산상으로 완료처리가 될 때까지
다소 시간이 소요될 수 있습니다.
안심하시고 기다려주시기 바랍니다^^
");