/* Query 1 */
SELECT e.emp_no, e.emp_lname
FROM bookexercises.dbo.employee e
INNER JOIN bookexercises.dbo.works_on w ON e.emp_no = w.emp_no
WHERE w.job = 'clerk'

/* Query 2 */
SELECT e.emp_fname, e.emp_lname
FROM bookexercises.dbo.employee e
INNER JOIN bookexercises.dbo.works_on w ON e.emp_no = w.emp_no
WHERE project_no = 'p2' and e.emp_no < 20000

/* Query 3 */
SELECT emp_fname, emp_lname, dept_name
FROM bookexercises.dbo.employee e
JOIN bookexercises.dbo.works_on w ON e.emp_no = w.emp_no
JOIN bookexercises.dbo.department d ON e.dept_no = d.dept_no
WHERE project_no = 'p2' and e.emp_no < 20000

/* Query 4 */
SELECT emp_fname, emp_lname, dept_name, project_name
FROM bookexercises.dbo.employee e, bookexercises.dbo.department d, bookexercises.dbo.project p, bookexercises.dbo.works_on w
WHERE e.dept_no = d.dept_no
AND e.emp_no = w.emp_no
AND p.project_no = w.project_no
AND job IN ('Analyst', 'Manager')
AND w.project_no = 'p1'

/* Query 5 */
SELECT emp_fname, emp_lname, dept_name
FROM bookexercises.dbo.employee e, bookexercises.dbo.department d
WHERE e.dept_no = d.dept_no

/* Query 6 */ 
SELECT emp_fname, emp_lname, dept_name
FROM bookexercises.dbo.employee e, bookexercises.dbo.department d
WHERE e.dept_no = d.dept_no
AND emp_fname LIKE 'J%'

/* Query 7 */
SELECT emp_fname, emp_lname, dept_name
FROM bookexercises.dbo.employee e, bookexercises.dbo.department d
WHERE e.dept_no = d.dept_no

/* Query 8 */
SELECT emp_fname, emp_lname
FROM bookexercises.dbo.employee
WHERE emp_no IN
(SELECT emp_no
FROM bookexercises.dbo.works_on
WHERE enter_date = '02/15/2007'
)

/* Query 9 */
SELECT AVG(UnitPrice)
FROM NORTHWND.dbo.Products P
INNER JOIN NORTHWND.dbo.Categories C ON P.CategoryID = C.CategoryID
WHERE CategoryName = 'Seafood'

/* Query 10 */
SELECT CompanyName
FROM NORTHWND.dbo.Customers C
INNER JOIN NORTHWND.dbo.Orders O ON C.CustomerID = O.CustomerID
INNER JOIN NORTHWND.dbo.[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY CompanyName
HAVING SUM(UnitPrice * Quantity) BETWEEN 50000 AND 100000