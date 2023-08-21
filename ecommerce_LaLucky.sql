# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construindo seu Primeiro Projeto Lógico de Banco de Dados

# E-commerce

# Mapeamento do esquema ER para Relacional
# Definição do script SQL para criação do esquema de banco de dados
# Persistência de dados para testes
# Recuperação de informações com queries SQL

-- Criação do banco de dados para o cenário de E-Commerce - Perfumaria LaLucky
CREATE DATABASE ecommerce;
USE ecommerce;

-- drop database ecommerce;

-- Criação da tabela Cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
	Fname VARCHAR(10) NOT NULL,
	Mname VARCHAR(3),
	Lname VARCHAR(20),
	CPF CHAR(11) NOT NULL,
	Address VARCHAR(255),
    Bdate DATE NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
    );
ALTER TABLE clients AUTO_INCREMENT=1;
--                                                                                     testado e enviado até aqui


-- Categorias, volume ml, preço
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45) NOT NULL,
	category ENUM('Floral', 'Amadeirado', 'Cítrico', 'Ambar') NOT NULL,
	volume INT,
    price DECIMAL (10,2),
	reviews FLOAT DEFAULT 0
    );
ALTER TABLE product AUTO_INCREMENT=1;

-- PEDIDOS
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderstatus ENUM('Cancelado', 'Em processamento', 'Enviado', 'Entregue', 'Pagamento confirmado') DEFAULT 'Em processamento',
    orderdescription VARCHAR(255),
    shipping FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_order_client FOREIGN KEY(idOrderClient) REFERENCES clients(idClient)
		ON UPDATE CASCADE
        ON DELETE SET NULL
    );
ALTER TABLE orders AUTO_INCREMENT=1;
    
-- Estoque Produto
CREATE TABLE storages(
	idstorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255) NOT NULL,
    quantity INT DEFAULT 0
);
ALTER TABLE storages AUTO_INCREMENT=1;

-- Fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    corporateName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT=1;

-- Vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    corporateName VARCHAR(255) NOT NULL,
    fantasyName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR (9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE(CPF),
    CONSTRAINT unique_corporatename_seller UNIQUE(corporateName)
    );
ALTER TABLE seller AUTO_INCREMENT=1;

-- Produto/Vendedor
CREATE TABLE productSeller(
	idPsSeller INT,
    idPsProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idPsSeller, idPsProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY(idPsSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY(idPsProduct) REFERENCES product(idProduct)    
);

-- Produto/Pedido
CREATE TABLE productOrder(
	idPoOrder INT,
    idPoProduct INT,
    poQuantity INT DEFAULT 1,
	poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPoOrder, idPoProduct),
    CONSTRAINT fk_product_order_order FOREIGN KEY (idPoOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_product_order_product FOREIGN KEY (idPoProduct) REFERENCES product(idProduct)    
);

-- Localização do Estoque
CREATE TABLE storageLocation(
	idSlStorage INT,
    idSlProduct INT,
    location VARCHAR (255) NOT NULL,
    PRIMARY KEY (idSlStorage, idSlProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idSlStorage) REFERENCES storages(idstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idSlProduct) REFERENCES product(idProduct)    
);

-- Produto/Vendedor
CREATE TABLE productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    psQuantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)    
);

CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT,
    idOrder INT,
    idClient INT,
    paymentType ENUM('Dinheiro', 'Cartão'),
    PRIMARY KEY(idPayment, idOrder, idClient),
    CONSTRAINT fk_payments_order FOREIGN KEY(idOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_payments_client FOREIGN KEY(idClient) REFERENCES clients(idClient)
);

show tables;







