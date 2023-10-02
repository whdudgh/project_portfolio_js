SELECT page, price, p_name, main_img, c_name
FROM (
    SELECT
        CEIL(ROWNUM / 4) AS page,
        price,
        p_name,
        main_img,
        c_name
    FROM product p
    JOIN category c ON p.category_key = c.category_key -- ī�װ� ���̺� ����
    WHERE p.category_key='AQ'
)
WHERE page = 1;