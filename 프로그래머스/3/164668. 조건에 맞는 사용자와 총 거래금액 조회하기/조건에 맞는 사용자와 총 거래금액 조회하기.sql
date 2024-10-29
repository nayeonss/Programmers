SELECT USER_ID, NICKNAME, SUM(PRICE) TOTAL_SALES
FROM USED_GOODS_BOARD B JOIN USED_GOODS_USER U
ON B.WRITER_ID = U.USER_ID
WHERE STATUS = 'DONE'
GROUP BY WRITER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC