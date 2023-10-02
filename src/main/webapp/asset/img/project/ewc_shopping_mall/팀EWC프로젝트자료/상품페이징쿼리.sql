SELECT page, price, p_name, main_img, c_name
FROM (
    SELECT
        CEIL(ROWNUM / 4) AS page,
        price,
        p_name,
        main_img,
        c_name
    FROM product p
    JOIN category c ON p.category_key = c.category_key -- 카테고리 테이블 조인
    WHERE p.category_key='AQ'
)
WHERE page = 1;