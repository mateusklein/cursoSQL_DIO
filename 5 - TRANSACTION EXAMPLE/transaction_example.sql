-- tabela utilizada no exemplo de transações
-- DROP database transactionExample;
CREATE DATABASE transactionExample;

USE transactionExample;
-- DROP TABLE orders;

CREATE TABLE orders(
	orderNumbers INT auto_increment,
    orderDate date,
    requiredDate date,
    shippedDate date,
    orderStatus ENUM('DESPACHADO','EM PROGRESSO','ENTREGUE'),
    customerNumber int,
    CONSTRAINT pk_orders PRIMARY KEY (orderNumbers) 
);

DESC orders;

CREATE TABLE ordersDetails(
	orderNumbers int auto_increment,
    productCode varchar(255),
    quantityOrder int,
    price varchar(255),
	constraint fk_orderdetails foreign key (orderNumbers) references orders(orderNumbers),
    constraint pk_orderdatails primary key (orderNumbers, productCode)
);

DESC ordersDetails;

INSERT INTO orders (orderDate, requiredDate, shippedDate, orderStatus, customerNumber)
VALUES
('2024-02-01', '2024-02-05', '2024-02-03', 'DESPACHADO', 101),
('2024-02-02', '2024-02-06', '2024-02-04', 'ENTREGUE', 102),
('2024-02-03', '2024-02-07', '2024-02-05', 'DESPACHADO', 103),
('2024-02-04', '2024-02-08', '2024-02-06', 'EM PROGRESSO', 104),
('2024-02-05', '2024-02-09', '2024-02-07', 'ENTREGUE', 105);

INSERT INTO ordersDetails (orderNumbers, productCode, quantityOrder, price)
VALUES
(1, 'P001', 2, '100.00'),
(1, 'P002', 1, '50.00'),
(2, 'P003', 3, '75.00'),
(3, 'P001', 1, '100.00'),
(4, 'P004', 2, '200.00');

SELECT * FROM ordersDetails;
SELECT * FROM orders;

select * from orders join ordersDetails using(orderNumbers);