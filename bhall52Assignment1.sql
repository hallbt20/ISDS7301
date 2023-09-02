/* Question 1 */
SELECT COUNT(*)
FROM dbo.DimStore

/* Question 2 */
SELECT COUNT(*) 
FROM dbo.DimStore
WHERE StoreType = 'Online'

/* Question 3 */
SELECT MIN(EmployeeCount)
FROM dbo.DimStore
WHERE ZipCode = 87001

/* Question 4 */
SELECT AVG(SellingAreaSize)
FROM dbo.DimStore
WHERE EmployeeCount > 90

/* Question 5 */
SELECT COUNT(*)
FROM dbo.DimStore
WHERE AddressLine1 LIKE '%ST%'

/* Question 6 */
SELECT COUNT(*)
FROM dbo.DimStore
WHERE AddressLine1 LIKE '%ST%'
AND StoreName LIKE '%a%a%'

/* Question 7 */
SELECT COUNT(*)
FROM dbo.DimStore
WHERE ZipCode IN (54001, 87001, 97001)

/* Question 8 */
SELECT COUNT(*)
FROM dbo.DimStore
WHERE ZipCode IN (54001, 87001, 97001)
AND GeographyKey < 800

/* Question 9 */
SELECT COUNT(*)
FROM dbo.DimStore
WHERE SellingAreaSize BETWEEN 500 AND 900

/* Question 10 */
SELECT SUM(EmployeeCount)
FROM dbo.DimStore
WHERE StoreManager = 215