-- task A: nome e preco de todos os produtos

SELECT ProductName, UnitPrice 
FROM Product
ORDER BY UnitPrice desc;

-- task b: produtos que custam mais que 50 reais 
-- e possuem mais de 20 unidades

SELECT ProductName, UnitPrice, UnitsInStock 
From Product
where UnitPrice > 50 and UnitsInStock > 20;

-- Agregação task c : valor total por produto, e média dos pedidos

SELECT ProductId, sum(UnitPrice * Quantity) as valor_total
FROM OrderDetail
GROUP BY ProductId
ORDER BY valor_total;

SELECT AVG(UnitPrice * Quantity) as valor_medio
FROM OrderDetail;

-- Joins task d: tabela products só traz o id da categoria e elas quer
-- visualizar os nomes das categorias

SELECT p.Id, p.ProductName, c.CategoryName  
FROM Product p 
INNER JOIN Category c
	ON p.CategoryId  = c.Id
ORDER BY c.CategoryName;

-- Union task e: quais as 3 categorias que geram mais receita

SELECT c.CategoryName, SUM(od.UnitPrice * od.Quantity) as valorTotal
FROM OrderDetail od
INNER JOIN Product p
	ON od.ProductId = p.Id
INNER JOIN Category c 
	ON p.CategoryId = c.Id
GROUP BY c.CategoryName
ORDER BY valorTotal desc
LIMIT 3;