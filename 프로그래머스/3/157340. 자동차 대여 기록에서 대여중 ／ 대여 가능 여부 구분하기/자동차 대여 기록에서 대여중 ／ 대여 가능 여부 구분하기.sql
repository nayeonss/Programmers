WITH C AS (SELECT CAR_ID
           FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
           WHERE '2022-10-16' BETWEEN START_DATE AND END_DATE) 

SELECT R.CAR_ID , IF(C.CAR_ID IS NULL, '대여 가능', '대여중') NULLAVAILABILITY
FROM (SELECT DISTINCT(CAR_ID) 
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) R LEFT JOIN C USING(CAR_ID)
ORDER BY CAR_ID DESC