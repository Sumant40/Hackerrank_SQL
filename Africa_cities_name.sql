SELECT ci.name as city_names
FROM CITY as ci 
JOIN COUNTRY as co
 on ci.COUNTRYCODE=co.CODE
WHERE co.CONTINENT = 'Africa';
