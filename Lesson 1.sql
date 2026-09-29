SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--Where c.city IN ('london', 'Paris', 'Rome', 'Berlin')
--where c.LastName not like '%r'
--ORDER BY c.CustomerId DESC
ORDER BY c.Company;

SELECT   TOP 5 c.country,
               COUNT(*) AS [Number Of Customers]
FROM     Customer AS c
GROUP BY c.Country
ORDER BY [Number Of Customers] DESC;

-- Looking at invoices
SELECT   i.CustomerId,
         SUM(i.total) AS "Invoice Total"
FROM     Invoice AS i
GROUP BY i.CustomerId
ORDER BY i.CustomerId;