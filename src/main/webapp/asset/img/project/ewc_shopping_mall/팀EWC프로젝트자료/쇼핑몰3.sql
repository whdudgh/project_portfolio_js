CREATE TABLE customer (
	cust_key	NUMBER(4,0),
	email	VARCHAR2(50)	NOT NULL,
	u_name	VARCHAR2(15)	NOT NULL,
	u_pwd	VARCHAR2(150) NOT NULL,
	u_birth	DATE	NOT NULL,
	phone_num	VARCHAR2(15)	NOT NULL,
	signout	VARCHAR2(1)	 DEFAULT 'N'
);

CREATE TABLE category (
	category_key	VARCHAR2(5)	NOT NULL,
	c_name	VARCHAR2(30)	NOT NULL
);


CREATE TABLE board (
	board_key	NUMBER(2,0),
	cust_key	NUMBER(4,0)	NOT NULL,
	p_key	VARCHAR2(20)	NOT NULL,
	title	VARCHAR2(100)	 NOT NULL,
	b_rdate	DATE	DEFAULT SYSDATE,
	content	VARCHAR2(2000)	NOT NULL,
	rate	NUMBER(2,0)
);


CREATE TABLE memo (
	board_key	NUMBER(2,0)	NOT NULL,
	content	VARCHAR2(2000)	NOT NULL,
	c_rdate DATE DEFAULT SYSDATE
);

CREATE TABLE product( 
	p_key	VARCHAR2(20),
	category_key	VARCHAR2(5) NOT NULL,
	p_name	VARCHAR2(150)	 NOT NULL,
	main_img	VARCHAR2(600)	 NOT NULL,
	sub_img1	VARCHAR2(600)	,
	sub_img2	VARCHAR2(600)	,
	sub_img3	VARCHAR2(600)	,
	sub_img4	VARCHAR2(600)	,
    price NUMBER(12,0) DEFAULT 0 NOT NULL,
	p_rdate DATE	DEFAULT SYSDATE,
	p_cnt NUMBER(4,0) DEFAULT 0 NOT NULL,
    detail_comment	VARCHAR2(4000)	NOT NULL
);

CREATE TABLE cart (
	cust_key	NUMBER(4,0)	NOT NULL,
	p_key	VARCHAR2(20)	NOT NULL,
	cart_cnt	NUMBER(4,0)	DEFAULT 1
);

CREATE TABLE total_order (
    order_key VARCHAR2(30) NOT NULL,
    cust_key NUMBER(4,0) NOT NULL,
    o_rdate DATE DEFAULT SYSDATE,
    pay_method VARCHAR2(20) NOT NULL,
    item_cnt NUMBER(3,0) DEFAULT 0 NOT NULL,
    price NUMBER(12,0) DEFAULT 0 NOT NULL
);

CREATE TABLE order_detail (
	order_det_key	NUMBER(4,0),
	p_key	VARCHAR2(20)	NOT NULL,
	order_key	VARCHAR2(30)	NOT NULL
);


ALTER TABLE address ADD CONSTRAINT pk_address PRIMARY KEY (addr_key);

ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY (cust_key);

ALTER TABLE category ADD CONSTRAINT pk_category PRIMARY KEY (category_key);

ALTER TABLE board ADD CONSTRAINT pk_board PRIMARY KEY (board_key);

ALTER TABLE comments ADD CONSTRAINT pk_memo PRIMARY KEY (board_key);

ALTER TABLE product ADD CONSTRAINT pk_product PRIMARY KEY (p_key);

ALTER TABLE cart ADD CONSTRAINT pk_cart PRIMARY KEY (cart_key);

ALTER TABLE total_order ADD CONSTRAINT pk_total_order PRIMARY KEY (order_key);

ALTER TABLE order_detail ADD CONSTRAINT pk_order_detail PRIMARY KEY (order_det_key);

ALTER TABLE memo ADD CONSTRAINT fk_memo_to_board FOREIGN KEY (board_key)
REFERENCES board(board_key);

ALTER TABLE total_order ADD CONSTRAINT fk_customer_to_total_order FOREIGN KEY (cust_key)
REFERENCES customer(cust_key);

ALTER TABLE order_detail ADD CONSTRAINT fk_total_order_to_order_detail FOREIGN KEY (order_key)
REFERENCES total_order(order_key);

ALTER TABLE order_detail ADD CONSTRAINT fk_product_to_order_detail FOREIGN KEY (p_key)
REFERENCES product(p_key);

ALTER TABLE board ADD CONSTRAINT fk_customer_to_board FOREIGN KEY (cust_key)
REFERENCES customer(cust_key);

ALTER TABLE board ADD CONSTRAINT fk_product_to_board FOREIGN KEY (p_key)
REFERENCES product(p_key);

ALTER TABLE cart ADD CONSTRAINT fk_product_to_cart FOREIGN KEY (p_key)
REFERENCES product(p_key);

ALTER TABLE cart ADD CONSTRAINT fk_customer_to_cart FOREIGN KEY (cust_key)
REFERENCES customer(cust_key);

ALTER TABLE product ADD CONSTRAINT fk_category_to_product FOREIGN KEY (category_key)
REFERENCES category(category_key);


CREATE SEQUENCE cust_key_seq
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE order_key_seq
INCREMENT BY 1
START WITH 100001;

CREATE SEQUENCE order_det_key_seq
INCREMENT BY  1
START WITH 11111;

CREATE SEQUENCE item_key_seq
INCREMENT BY 1
START WITH 1000;

CREATE SEQUENCE board_key_seq
INCREMENT BY 1
START WITH 10;

INSERT INTO order_detail(order_det_key,p_key)
VALUES(ORDER_DET_KEY_SEQ.NEXTVAL,'IW371617',100013);

INSERT INTO order_detail(order_det_key,p_key,order_key)
VALUES(ORDER_DET_KEY_SEQ.NEXTVAL,'IW458611',100014);

INSERT INTO order_detail(order_det_key,p_key,order_key)
VALUES(ORDER_DET_KEY_SEQ.NEXTVAL,'IW657601',100015);

INSERT INTO order_detail(order_det_key,p_key,order_key)
VALUES(ORDER_DET_KEY_SEQ.NEXTVAL,'IW458307',100016);

INSERT INTO order_detail(order_det_key,p_key,order_key)
VALUES(ORDER_DET_KEY_SEQ.NEXTVAL,'IW371610',100017);
