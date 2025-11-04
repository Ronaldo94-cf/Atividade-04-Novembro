-- ======================================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ======================================================
CREATE DATABASE IF NOT EXISTS loja_db;
USE loja_db;

-- ======================================================
-- Tabela FORNECEDOR
-- ======================================================
CREATE TABLE FORNECEDOR (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
) ENGINE=InnoDB;

-- ======================================================
-- Tabela PRODUTO
-- ======================================================
CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    id_fornecedor INT NOT NULL,
    CONSTRAINT fk_produto_fornecedor
        FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ======================================================
-- Tabela CLIENTE
-- ======================================================
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
) ENGINE=InnoDB;

-- ======================================================
-- Tabela VENDEDOR
-- ======================================================
CREATE TABLE VENDEDOR (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
) ENGINE=InnoDB;

-- ======================================================
-- Tabela VENDA
-- ======================================================
CREATE TABLE VENDA (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    CONSTRAINT fk_venda_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_venda_vendedor
        FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ======================================================
-- Tabela ITEM_VENDA
-- ======================================================
CREATE TABLE ITEM_VENDA (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
    CONSTRAINT fk_itemvenda_venda
        FOREIGN KEY (id_venda) REFERENCES VENDA(id_venda)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_itemvenda_produto
        FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ======================================================
-- INSERINDO DADOS DE EXEMPLO
-- ======================================================

-- Fornecedores
INSERT INTO FORNECEDOR (nome_fornecedor, cnpj, telefone, email, endereco) VALUES
('Tech Distribuidora', '12345678000199', '(11) 99999-1111', 'contato@techdist.com', 'Rua Alfa, 100 - São Paulo/SP'),
('Office Supply', '98765432000155', '(21) 98888-2222', 'vendas@office.com.br', 'Av. Beta, 200 - Rio de Janeiro/RJ');

-- Produtos
INSERT INTO PRODUTO (nome_produto, descricao, preco, estoque, id_fornecedor) VALUES
('Mouse Gamer', 'Mouse óptico RGB 16000 DPI', 150.00, 50, 1),
('Teclado Mecânico', 'Switch Blue - Iluminação RGB', 300.00, 30, 1),
('Cadeira Ergonômica', 'Cadeira com apoio lombar e regulagem de altura', 950.00, 10, 2),
('Monitor 24"', 'Full HD 144Hz', 1200.00, 20, 1);

-- Clientes
INSERT INTO CLIENTE (nome_cliente, cpf, telefone, email, endereco) VALUES
('Maria Souza', '12345678901', '(11) 91234-5678', 'maria@gmail.com', 'Rua das Flores, 50 - São Paulo/SP'),
('João Pereira', '98765432100', '(21) 98765-4321', 'joao@yahoo.com', 'Av. das Américas, 500 - Rio de Janeiro/RJ');

-- Vendedores
INSERT INTO VENDEDOR (nome_vendedor, cpf, telefone, email) VALUES
('Carlos Lima', '11122233344', '(11) 90000-0001', 'carlos@loja.com'),
('Fernanda Alves', '55566677788', '(21) 90000-0002', 'fernanda@loja.com');

-- Vendas
INSERT INTO VENDA (data_venda, valor_total, id_cliente, id_vendedor) VALUES
('2025-11-01 10:30:00', 0.00, 1, 1),
('2025-11-02 15:45:00', 0.00, 2, 2);

-- Itens de venda
INSERT INTO ITEM_VENDA (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 150.00),
(1, 2, 1, 300.00),
(2, 3, 1, 950.00),
(2, 4, 2, 1200.00);

-- ======================================================
-- Atualizando o valor total das vendas automaticamente
-- ======================================================
SET SQL_SAFE_UPDATES = 0;

UPDATE VENDA v
SET v.valor_total = (
    SELECT SUM(iv.subtotal)
    FROM ITEM_VENDA iv
    WHERE iv.id_venda = v.id_venda
);

SET SQL_SAFE_UPDATES = 1;

UPDATE VENDA 
SET valor_total = (
    SELECT SUM(subtotal)
    FROM ITEM_VENDA
    WHERE ITEM_VENDA.id_venda = VENDA.id_venda
)
WHERE id_venda IN (SELECT DISTINCT id_venda FROM ITEM_VENDA);
