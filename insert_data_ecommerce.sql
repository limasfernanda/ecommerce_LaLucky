# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construindo seu Primeiro Projeto Lógico de Banco de Dados

# Adicionando dados para o modelo E-commerce, perfumaria LaLucky


USE ecommerce;

desc clients;
-- idClient Fname Mname Lname CPF Address Bdate
INSERT INTO clients (Fname, Mname, Lname, CPF, Address, Bdate) VALUES
	('Moime','C','Lynch', 333445555, 'Rua Paracatu, Parque Imperial São Paulo-SP','1987-12-08'),
	('Rupa','D','Gaines', 789123456, 'Rua Cristiano Olsen, Jardim Sumaré Araçatuba-SP','1949-06-10'),
	('Goyla','F','Dacon', 45678913,'Avenida Desembargador Moreira, Aldeota Fortaleza-CE','1985-11-03'),
	('Amon','S','Garosor', 12346789, 'Avenida Rio Branco, Centro Rio de Janeiro-RJ','1962-12-31'),
	('Taiel','G','Cuwa', 98745631,'Avenida Tocantins Vila, Jardim Rio Claro Jataí-GO','1999-07-23'),
	('Rega','M','Fry', 654789123, 'Avenida Afonso Pena, Boa Viagem Belo Horizonte-MG','1985-09-02');

desc product;
-- idProduct Pname category volume price reviews
INSERT INTO product (Pname, category, volume, price, reviews) VALUES
	('Coco Mademoseile','Ambar',100,1160,'5'),
    ('Miracle','Floral',100,598,'4'),
    ('Ligth Blue','Floral',100,480,'4'),
    ('Avon Segno','Cítrico',50,90,'5'),
    ('Black Opium','Ambar',90,819,'5'),
    ('Cuba red','Amadeirado',100,88,'3'),
    ('212 VIP','Ambar',100,389,'4'),
    ('Natura Essencial','Cítrico',100,139,'3'),
    ('Caliber 12','Amadeirado',100,150,'3');

desc orders;
-- idOrder, idOrderClient, orderstatus, orderdescription, shipping, paymentCash
INSERT INTO orders (idOrderClient, orderstatus, orderdescription, shipping, paymentCash) VALUES 
	(5, 'Entregue','Dinheiro',20,1),
    (1, 'Entregue','Cartão',NULL,0),
    (4, 'Entregue','Dinheiro',NULL,1),
    (4, 'Em processamento','Dinheiro',NULL,1),
	(2, 'Em processamento','Cartão',NULL,0),
    (3, 'Cancelado','Não pagou no limite de tempo estabelecido',NULL,NULL),
    (5, 'Enviado','Cartão',30,0),
    (2, 'Em processamento','Dinheiro',NULL,1),
    (3, 'Cancelado','Não pagou no limite de tempo estabelecido',NULL,NULL),
    (6, 'Cancelado','Não pagou no limite de tempo estabelecido',NULL,NULL),
	(1, 'Cancelado','Cliente desistiu de comprar para o namorado',NULL,NULL),
    (1, 'Enviado','Cartão',NULL,0),    
    (3,DEFAULT,NULL,0,DEFAULT),
    (5,'Pagamento confirmado',NULL,NULL,DEFAULT),
    (6,DEFAULT,NULL,30,DEFAULT);

desc productOrder;

-- idPoOrder, idPoProduct, poQuantity, poStatus
INSERT INTO productOrder (idPoOrder, idPoProduct, poQuantity, poStatus) VALUES
	(1,8,2,NULL),
    (2,7,1,NULL),
    (3,1,1,NULL),
	(4,2,2,NULL),
    (5,3,1,NULL),
    (6,8,2,NULL),
	(7,3,2,NULL),
    (8,8,3,NULL),
    (9,2,1,NULL),
	(10,8,2,NULL),
    (11,5,1,NULL),
    (12,7,1,NULL),
	(13,9,2,NULL),
    (14,7,1,NULL),
    (15,9,5,NULL);

desc storages;
-- idstorage storageLocation quantity
INSERT INTO storages (storageLocation,quantity) VALUES 
	('CE',40),
    ('DF',80);

desc storageLocation;
-- dSlStorage , idSlProduct, i location
INSERT INTO storageLocation ( idSlStorage, idSlProduct, location) VALUES
    (1,3,'Fortaleza'),
	(1,9,'Fortaleza'),
	(1,5,'Fortaleza'),
    (1,4,'Juazeiro do Norte '),
    (2,1,'Brasília'),
	(2,2,'Brasília'),
    (2,7,'Brasília'),
	(2,8,'Brasília'),
    (2,6,'Samambaia');

desc supplier;
-- idSupplier, corporateName, CNPJ, contact
INSERT INTO supplier (corporateName, CNPJ, contact) VALUES 
	('Lourdinha SA', 123456789123456,'55912123434'),
    ('Dorinha SA ',987654321123456,'55956567878');

desc productSupplier;
-- idPsSupplier, idPsProduct, psQuantity 
INSERT INTO productSupplier (idPsSupplier, idPsProduct, psQuantity) VALUES
	(1,9,20),
    (1,1,10),
    (2,2,10),
    (2,8,20),
    (1,3,10),
    (1,4,10),
    (2,5,10),
    (1,6,10),
    (2,7,10),
    (1,8,10);
desc seller;

-- idSeller, corporateName, commercialName, CNPJ, CPF, location, contact
INSERT INTO seller (corporateName, fantasyName, CNPJ, CPF, location, contact) VALUES 
	('Francisca Peque', NULL, 123456789456321, NULL, 'Rio de Janeiro', 55912345678),
	('Adriana Belos',NULL,123456789123456,123456789,'Brasília', 55987654321);


-- idPsSeller, idPsProduct, quantity
INSERT INTO productSeller (idPsSeller, idPsProduct, quantity) VALUES 
	(1,6,20),
    (2,7,30),
    (1,8,30),
    (2,5,10),
    (1,1,5),
    (2,2,10),
    (1,3,10),
    (2,4,10),
    (1,9,30),
    (2,9,30);
    
desc payments;
-- idPayment idOrder idClient paymentType
INSERT INTO payments (idOrder, idClient, paymentType) VALUES 
	(1,5,'Dinheiro'),
    (2,1,'Cartão'),
    (3,4,'Dinheiro'),
    (4,4,'Dinheiro'),
	(5,2,'Cartão'),
    (6,3,NULL),
    (7,5,'Cartão'),
    (8,2,'Dinheiro'),
    (9,3,NULL),
	(10,6,NULL),
    (11,1,NULL),
    (12,1,'Cartão'),
    (13,3,NULL),
	(14,5,NULL),
    (15,6,NULL);





