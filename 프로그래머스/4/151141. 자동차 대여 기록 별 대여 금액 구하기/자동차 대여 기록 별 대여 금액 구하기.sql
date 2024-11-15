WITH D AS (SELECT CAR_TYPE, REGEXP_REPLACE(DURATION_TYPE, '[^0-9]', '') DURATION_TYPE, 
           REGEXP_REPLACE(DISCOUNT_RATE, '[^0-9]', '') DISCOUNT_RATE
           FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
           WHERE CAR_TYPE = '트럭'),

     H AS (SELECT HISTORY_ID, DAILY_FEE, DATEDIFF(END_DATE, START_DATE) + 1 DURATION
           FROM CAR_RENTAL_COMPANY_CAR C JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H USING (CAR_ID)
           WHERE CAR_TYPE = '트럭')
          
SELECT DISTINCT(HISTORY_ID), 
       MIN(CASE WHEN DURATION >= DURATION_TYPE THEN (DAILY_FEE * DURATION * (1 - DISCOUNT_RATE / 100))
           ELSE DAILY_FEE * DURATION END) OVER(PARTITION BY HISTORY_ID) FEE
FROM H JOIN D
ORDER BY FEE DESC, HISTORY_ID DESC          

