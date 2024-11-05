SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
FROM MEMBER_PROFILE P JOIN REST_REVIEW R USING (MEMBER_ID)
WHERE MEMBER_ID IN (SELECT MEMBER_ID
                    FROM REST_REVIEW
                    GROUP BY MEMBER_ID
                    HAVING COUNT(MEMBER_ID) = (SELECT COUNT(MEMBER_ID)
                                               FROM REST_REVIEW
                                               GROUP BY MEMBER_ID
                                               ORDER BY 1 DESC
                                               LIMIT 1)
                   )
ORDER BY REVIEW_DATE, REVIEW_TEXT