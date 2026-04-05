--https://hackerrank-challenge-pdfs.s3.amazonaws.com/8343-african-cities-English?response-content-disposition=inline%3B%20filename%3Dafrican-cities-English.pdf&response-content-type=application%2Fpdf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAR6O7GJNX2PJLRWX4%2F20260405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260405T110043Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=95925f93213c8d8703cc8ce5ca39e53448e740b6b46cdb672f26fee914555716
SELECT ci.name as city_names
FROM CITY as ci 
JOIN COUNTRY as co
 on ci.COUNTRYCODE=co.CODE
WHERE co.CONTINENT = 'Africa';
