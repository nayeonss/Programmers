SELECT PRODUCT_ID, PRODUCT_NAME, SUM(AMOUNT * PRICE) TOTAL_SALES
FROM FOOD_PRODUCT P JOIN FOOD_ORDER O USING (PRODUCT_ID)
WHERE PRODUCE_DATE LIKE '2022-05%'
GROUP BY PRODUCT_ID
ORDER BY TOTAL_SALES DESC, PRODUCT_ID