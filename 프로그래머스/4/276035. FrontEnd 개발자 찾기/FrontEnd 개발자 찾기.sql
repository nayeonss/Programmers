SELECT DISTINCT(ID), EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS D JOIN SKILLCODES S
WHERE D.SKILL_CODE & S.CODE = S.CODE 
      AND S.CATEGORY = 'Front End'
ORDER BY ID