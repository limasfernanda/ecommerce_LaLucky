# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construindo seu Primeiro Projeto Lógico de Banco de Dados

# Fazendo perguntas e recuperando dados a partir das queries

-- Qual o pedido de cada cliente?
use ecommerce;

select concat(Fname,' ',Lname) as Clients, idPoProduct as Num_Pedido, Pname as Nome_Pedido, orderStatus as Status
 from clients c, orders o, productOrder, product where c.idClient = idOrderClient and idPoOrder=idOrder and idPoProduct=idProduct;
 
-- Qual perfume os vendedores têm e sua quantidade por região?

select corporateName as Seller, sp.location as Location,Pname as Name_Product , quantity as Quantity
from seller s, productSeller ps, storagelocation sp, product 
	where idSeller=idPsSeller and idPsProduct=idSLProduct and idSLProduct=idProduct
	order by Seller, Location;

-- Qual o produto menos vendido?
-- USANDO EXCEPT E DISTINCT

select distinct Pname as Nome_Pedido, volume, category, reviews, price
 from product, productOrder where idProduct NOT IN (select idPoProduct from productOrder);

-- Qual categoria é a mais pedida?
-- USANDO GROUP BY E COUNT

select category as Category_Product, count(*) as Quantidade_Pedidos
 from productOrder, product where idPoProduct=idProduct 
 group by category;
 
 
-- Quantidade de produtos por cliente em status diferentes de 'Cancelado' e preços por Perfume
-- foi necessário o sum poQuantity, pois Moime fez dois pedidos com status diferentes, em diferentes ordens, um já foi enviado e outro já entregue do mesmo produto
-- UTILIZANDO INNER JOIN, GROUP BY, ORDER BY
select concat(Fname,' ',Lname) as Clients, sum(po.poQuantity) as Quantidade_Product, p.Pname, sum(Price)as Price_Product from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder po on po.idPoOrder = o.idOrder
                inner join product p on idPoProduct= idProduct
                where orderstatus <> 'Cancelado'
				group by idClient, poQuantity, Pname
                Order by idClient; 
                
			
-- Recuperar quantos pedidos foram realizados pelos clientes. Considerando mesmo os que foram cancelados
select concat(Fname,' ',Lname) as Clients, count(*) as Number_of_orders from clients c 
		inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 

-- Clientes que fizeram 3 pedidos podem ganhar presentes
-- USANDO HAVING

select concat(Fname,' ',Lname) as Clients, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
				group by idClient
				having count(*)=3;
                
                
-- Aniversariantes do mês de dezembro podem ganhar desconto para presentes de natal
-- USANDO LIKE

select * from clients
	where Bdate like '____-12-__';









