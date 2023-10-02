--카테고리별 시계 리스트 쿼리
SELECT
    c.c_name   cname,
    p.p_name   pname,
    p.price    price,
    p.main_img img
FROM
         product p
    JOIN category c ON p.category_key = c.category_key
WHERE
    c.category_key = 'AQ';

SELECT
    p_name,
    main_img,
    price
FROM
    product
WHERE
    category_key = 'AQ';

SELECT
    c_name
FROM
    category
WHERE
    category_key = 'AQ';

--상품명으로 상품정보찾기()
SELECT
    p.p_key    pkey,
    p.p_name   pname,
    p.price    price,
    p.main_img mainimg,
    p.sub_img1 sub1,
    p.sub_img2 sub2,
    p.sub_img3 sub3,
    p.sub_img4 sub4,
    c.c_name   cname
FROM
         product p
    JOIN category c ON p.category_key = c.category_key
WHERE
    p_name = '다 빈치 오토매틱';

--장바구니 구현을 위해 장바구니와 장바구니 항목테이블 추가생성
CREATE TABLE cart (
    cart_key NUMBER(4, 0),
    cust_key NUMBER(4, 0) NOT NULL
);

CREATE TABLE cart_item (
    cart_item_key NUMBER(4, 0),
    cart_key      NUMBER(4, 0) NOT NULL,
    p_key         VARCHAR2(20) NOT NULL,
    p_cnt         NUMBER(4, 0) DEFAULT 1 NOT NULL,
    contain_date  DATE DEFAULT sysdate NOT NULL
);

--pk제약
ALTER TABLE cart ADD (
    CONSTRAINT cart_key_pk PRIMARY KEY ( cart_key )
);

ALTER TABLE cart_item ADD (
    CONSTRAINT cart_item_key_pk PRIMARY KEY ( cart_item_key )
);
    
--fk제약
ALTER TABLE cart ADD (
    CONSTRAINT cart_cust_key_fk FOREIGN KEY ( cust_key )
        REFERENCES customer ( cust_key )
);

ALTER TABLE cart_item ADD (
    CONSTRAINT cart_item_cart_key_id_fk FOREIGN KEY ( cart_key )
        REFERENCES cart ( cart_key ),
    CONSTRAINT cart_item_p_key_fk FOREIGN KEY ( p_key )
        REFERENCES product ( p_key )
);

CREATE SEQUENCE cart_key_seq START WITH 500 INCREMENT BY 1;

CREATE SEQUENCE cart_item_key_seq START WITH 1 INCREMENT BY 1;

INSERT INTO cart (
    cart_key,
    cust_key
) VALUES (
    cart_key_seq.NEXTVAL,
    1
);

INSERT INTO cart (
    cart_key,
    cust_key
) VALUES (
    cart_key_seq.NEXTVAL,
    2
);

INSERT INTO cart (
    cart_key,
    cust_key
) VALUES (
    cart_key_seq.NEXTVAL,
    3
);

INSERT INTO cart (
    cart_key,
    cust_key
) VALUES (
    cart_key_seq.NEXTVAL,
    4
);

COMMIT;

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key
) VALUES (
    cart_item_key_seq.NEXTVAL,
    500,
    'IW376804'
);

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key
) VALUES (
    cart_item_key_seq.NEXTVAL,
    500,
    'IW392103'
);

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key
) VALUES (
    cart_item_key_seq.NEXTVAL,
    500,
    'IW328904'
);

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key
) VALUES (
    cart_item_key_seq.NEXTVAL,
    500,
    'IW657601'
);

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key,
    p_cnt
) VALUES (
    cart_item_key_seq.NEXTVAL,
    501,
    'IW657601',
    3
);

INSERT INTO cart_item (
    cart_item_key,
    cart_key,
    p_key,
    p_cnt
) VALUES (
    cart_item_key_seq.NEXTVAL,
    501,
    'IW657601',
    2
);

--cart_item의 상품갯수 조절
UPDATE cart_item
SET
    p_cnt = 2
WHERE
        cart_key = 500
    AND p_key = 'IW392103';

COMMIT;

--SELECT p_name, p_cnt, contain_date
--FROM cart c JOIN cart_item ci ON c;

SELECT
    page,
    price,
    p_name,
    main_img,
    c_name
FROM
    (
        SELECT
            ceil(ROWNUM / 4) AS page,
            price,
            p_name,
            main_img,
            c_name
        FROM
                 product p
            JOIN category c ON p.category_key = c.category_key
        WHERE
            p.category_key = 'AQ'
    )
WHERE
    page = 1;

--특정카트의 회원코드 1인 사람의 장바구니 상품정보 불러오기.
SELECT
    p.p_name        pname,
    p.price         price,
    p.main_img      img,
    ci.p_cnt        count,
    ci.contain_date containday,
     cat.c_name cname,
    (
    SELECT SUM(SUM(p.price * ci.p_cnt))
    FROM  cart_item ci
    JOIN product p ON ci.p_key = p.p_key
    JOIN cart    c ON ci.cart_key = c.cart_key
    WHERE  c.cust_key = 1
    GROUP BY
    p.p_name,
    p.price,
    p.main_img,
    ci.p_cnt,
    ci.contain_date
    ) totalPrice
FROM
         cart_item ci
    JOIN product p ON ci.p_key = p.p_key
    JOIN cart    c ON ci.cart_key = c.cart_key
    JOIN category cat ON p.category_key = cat.category_key
WHERE
    c.cust_key = 1;

SELECT
 p.p_name pname,
 p.price price,
 p.main_img img,
 ci.p_cnt count,
 ci.contain_date containday,
 ci.c_name cname,
 (
  SELECT SUM(SUM(p.price * ci.p_cnt))
   FROM  cart_item ci
   JOIN product p ON ci.p_key = p.p_key
   JOIN cart c ON ci.cart_key = c.cart_key
   WHERE c.cust_key = 1
   GROUP BY
   p.p_name,
   p.price,
   p.main_img,
   ci.p_cnt,
   ci.contain_date
   ) totalPrice
   FROM
    cart_item ci
    JOIN product p ON ci.p_key = p.p_key
         JOIN cart c ON ci.cart_key = c.cart_key
    JOIN category cat ON p.category_key = cat.category_key
   WHERE
   c.cust_key = 1;
   
   
   
   
SELECT
    p.p_name        pname,
    p.price         price,
    p.main_img      img,
    ci.p_cnt        count,
    ci.contain_date containday,
    cat.c_name      cname
FROM
         cart_item ci
    JOIN product  p ON ci.p_key = p.p_key
    JOIN cart     c ON ci.cart_key = c.cart_key
    JOIN category cat ON p.category_key = cat.category_key
WHERE
    c.cust_key = 1;

INSERT INTO cart (
    cart_key,
    cust_key
) VALUES (
    cart_ket_seq.NEXTVAL,
    6
);