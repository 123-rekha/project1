USE B055;
CREATE TABLE numbers(n INT);
INSERT INTO numbers VALUES(1),(2),(3),(4);
SELECT * FROM numbers;

-- NUMBER GRID PATTERN
-- CROSS JOIN
SELECT a.n as c1, b.n as c2 FROM numbers a
CROSS JOIN numbers b ORDER BY c1;

-- SELF JOIN
SELECT a.n as c1, b.n as c2 FROM numbers a
INNER JOIN numbers b ORDER BY c1;

-- ARITHMATIC OPERATIONS(*,/,+,-)
SELECT a.n, b.n, a.n*b.n, a.n+b.n FROM numbers a
CROSS JOIN numbers b ORDER BY a.n;

-- UNIQUE PAIRS(Condition using self join)
SELECT a.n A, b.n B FROM numbers a JOIN numbers b 
ON a.n < b.n ORDER BY a.n; # (first number less than second number)


SELECT a.n A, b.n B FROM numbers a JOIN numbers b 
ON a.n  <> b.n  ORDER BY a.n; # to get uncommon rows

-- only common records
SELECT a.n A, b.n B FROM numbers A CROSS JOIN numbers B 
ON a.n = b.n ORDER BY A;