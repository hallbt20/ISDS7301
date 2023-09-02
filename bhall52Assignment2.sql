/* Question 1 */
SELECT ROUND(SUM(SalesAmount), 0)
FROM ContosoRetailDW.dbo.FactSales F, ContosoRetailDW.dbo.DimDate D
WHERE F.DateKey = D.Datekey
AND CalendarYear = 2009
AND CalendarMonthLabel = 'January'
-- Returns 269770345

/* Question 2 */
SELECT ROUND(SUM(SalesAmount - TotalCost), 0) AS totalProfit
FROM ContosoRetailDW.dbo.FactSales F, ContosoRetailDW.dbo.DimDate D
WHERE F.DateKey = D.Datekey
AND CalendarYear = 2008
AND CalendarQuarterLabel = 'Q3'
-- Returns 626638256

/* Question 3 */
SELECT D.CalendarMonthLabel AS Month, SUM(SalesAmount - TotalCost) As totalProfit
FROM ContosoRetailDW.dbo.FactSales F, ContosoRetailDW.dbo.DimDate D
WHERE F.DateKey = D.Datekey
AND CalendarYear = 2008
GROUP BY D.CalendarMonthLabel
ORDER BY 2
-- Returns, in ascending order, the profit per month in 2008

/* Question 4 */ 
SELECT ROUND(AVG(SalesAmount - TotalCost), 0) AS avgProfit
FROM ContosoRetailDW.dbo.FactSales F, ContosoRetailDW.dbo.DimDate D
WHERE F.DateKey = D.DateKey 
AND CalendarYear = 2008
AND IsWorkDay = 'WorkDay'
-- This returns 2220

/* Question 5 */
SELECT ROUND(SUM(ReturnAmount), 0)
FROM ContosoRetailDW.dbo.FactSales F
JOIN ContosoRetailDW.dbo.DimProduct D ON F.ProductKey = D.ProductKey
JOIN ContosoRetailDW.dbo.DimProductSubcategory S ON D.ProductSubcategoryKey = S.ProductSubcategoryKey
JOIN ContosoRetailDW.dbo.DimProductCategory C ON S.ProductCategoryKey = C.ProductCategoryKey
WHERE C.ProductCategoryKey = 1
-- Returns 1838723

/* Question 6 */
SELECT StoreName
FROM ContosoRetailDW.dbo.FactSales F, ContosoRetailDW.dbo.DimStore S
WHERE F.StoreKey = S.StoreKey
GROUP BY StoreName
HAVING SUM(SalesAmount) BETWEEN 500000000 AND 560000000
-- Returns 'Contoso Europe Reseller'

/* Question 7 */
SELECT ROUND(AVG(SalesAmount), 0)
FROM ContosoRetailDW.dbo.FactSales F
JOIN ContosoRetailDW.dbo.DimStore S ON F.StoreKey = S.StoreKey
JOIN ContosoRetailDW.dbo.DimDate D ON F.DateKey = D.Datekey
WHERE ZipCode = '70001'
AND CalendarYear = 2009
-- Returns 3917

/* Question 8 */
SELECT COUNT(DISTINCT(StoreKey))
FROM ContosoRetailDW.dbo.FactSales
WHERE YEAR(DateKey) = 2008
-- Returns 301

/* Question 9 */
SELECT ROUND(AVG(P.UnitCost), 0)
FROM ContosoRetailDW.dbo.DimProduct P
JOIN ContosoRetailDW.dbo.FactSales F ON P.ProductKey = F.ProductKey
JOIN ContosoRetailDW.dbo.DimDate D ON D.Datekey = F.DateKey
WHERE ProductName LIKE '%MP3%'
AND CalendarYear = 2007
-- Returns 39

/* Question 10 */
SELECT ROUND(MIN(DiscountAmount), 2)
FROM FactSales F
JOIN DimStore S ON F.StoreKey = S.StoreKey
JOIN DimDate D ON D.DateKey = F.DateKey
WHERE StoreName = 'Contoso Bellevue Store'
AND CalendarYear = 2008
AND DiscountAmount > 0
-- Returns 0.25