SELECT FLAVOR
FROM FIRST_HALF F JOIN JULY J USING (FLAVOR)
GROUP BY FLAVOR
ORDER BY SUM(F.TOTAL_ORDER + J.TOTAL_ORDER) DESC
LIMIT 3