WITH UI AS (SELECT USER_ID
            FROM USER_INFO
            WHERE YEAR(JOINED) = 2021)

SELECT YEAR(SALES_DATE) YEAR, MONTH(SALES_DATE) MONTH, COUNT(DISTINCT(USER_ID)) PURCHASED_USERS, 
       ROUND(COUNT(DISTINCT(USER_ID))/(SELECT COUNT(*) FROM UI), 1) PUCHASED_RATIO
FROM ONLINE_SALE
WHERE USER_ID IN (SELECT * FROM UI)
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH