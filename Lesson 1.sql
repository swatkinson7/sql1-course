SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
--         c.firstname + ' ' + c.LastName As CustomerName,
         CONCAT(c.firstname, ' ', c.LastName) As CustomerName2,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--Where c.city IN ('london', 'Paris', 'Rome', 'Berlin')
--where c.LastName not like '%r'
--ORDER BY c.CustomerId DESC
ORDER BY c.Company ASC

SELECT   TOP 5 c.country,
               COUNT(*) AS [Number Of Customers]
FROM     Customer AS c
GROUP BY c.Country
ORDER BY [Number Of Customers] DESC;

-- Looking at invoices

SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total,
       i.*
FROM   Invoice AS i
order by i.CustomerId;

SELECT   i.CustomerId,
         c.FirstName,
         c.LastName,
         CONCAT(c.firstname, ' ', c.LastName) AS CustomerName,
         SUM(i.total) AS InvoiceTotal,
         COUNT(*) AS NumberofInvoices
FROM     Invoice AS i
         INNER JOIN
         customer AS c
         ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName, CONCAT(c.firstname, ' ', c.LastName)
ORDER BY i.CustomerId;

-- alternative way 
SELECT ibc.CustomerId,
       CONCAT(c.firstname, ' ', c.LastName) AS CustomerName,
       concat(e.FirstName, ' ', e.LastName) AS EmployeeName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS ibc
       INNER JOIN
       Customer AS c
       ON ibc.CustomerId = c.CustomerId join Employee AS e
       ON e.EmployeeId = c.SupportRepId

--Link Customer and Employees
SELECT e.EmployeeId,
--       e.FirstName,
--       e.LastName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       concat(c.FirstName, ' ', c.LastName) AS CustomerName
       FROM   Employee AS e join Customer AS c
       ON e.EmployeeId = c.SupportRepId
