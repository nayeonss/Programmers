SELECT A.YEAR, (B.MS - A.SIZE_OF_COLONY) YEAR_DEV, A.ID
FROM (SELECT ID, PARENT_ID, SIZE_OF_COLONY, YEAR(DIFFERENTIATION_DATE) YEAR
      FROM ECOLI_DATA) A
JOIN (SELECT YEAR(DIFFERENTIATION_DATE) YEAR, MAX(SIZE_OF_COLONY) MS
      FROM ECOLI_DATA 
      GROUP BY YEAR(DIFFERENTIATION_DATE)) B
ON A.YEAR = B.YEAR
ORDER BY YEAR ASC, YEAR_DEV ASC