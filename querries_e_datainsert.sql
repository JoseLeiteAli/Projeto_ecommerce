-- dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address) 
	   values('Maria','M','Silva', 12346799, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 997654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678713,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789129456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745831,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654788123,'rua alemeda das flores 28, Centro - Cidade das flores');
             
select * from clients;

-- idProduct, Pname, classification_kids, category('Eletrônico','Moda','Brinquedos','Alimentos','Esporte','Papelaria','Livros','Ferramentas','Cozinha','Pet Shop','Móveis'), , avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
							  ('Fone de ouvido',false, 'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Moda','5',null),
                              ('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
                              ('Sofá retrátil',false,'Móveis','3','3x60x90'),
                              ('Farinha de arroz',false,'Alimentos','2',null),
                              ('Fire Stick Amazon',false,'Eletrônico','3',null);

select * from product;

-- idPaymentClient, idPayment, CardNumber, CardAgency, CardValDate, CardName
insert into payments (idPaymentClient, CardNumber, CardAgency, CardValDate, CardName) values
							(1, '1234567891234567', '123456789', '112023', 'Maria M Silva'),
                            (3, '2165020654620225', '159528512', '022024', 'Ricardo F Silva'),
                            (3, '6519851202551625', '519651220', '052026', 'Ricardo F Silva'),
                            (5, '1891022909512094', '015189065', '072023', 'Roberta G Assis');
                            
select * from payments;

-- idOrderClient, orderStatus, orderDescription, sendValue, paymentcash
-- delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentcash) values 
							 (1,default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

select * from orders;

-- idPOproduct, idPOorder, POQuantity, POStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,5,2,null),
                         (2,5,1,null),
                         (3,6,1,null);

select * from productOrder;


insert into productStorage (storageLocation, quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
                            
select * from stock;

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');



-- idSupplier, SocialName, CNPJ, Contact
insert into supplier (SocialName, CNPJ, Contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
                            

insert into productSupplier (idPsSuplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbsName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas', null, null,123456783,'Rio de Janeiro', 219567895),
						('Kids World', null, 456789123654485,  null,'São Paulo', 1198657484);

select * from seller;

-- idPSseller, idPSproduct, PSQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

-- exemplos


select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select concat(Fname,' ',Lname) CompleteName, idOrder, OrderStatus from clients c, orders o where c.idClient = idOrderClient;

select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentcash) values
							 (2,default,'Enviado','compra via aplicativo',null,1);

                             
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- recuperando quantidade de pedidos dos clientes    
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 
        
        
                      



-- Relação 
select * from seller;
select * from product;
select * from supplier;
select * from storageLocation;
select * from productStorage;
select * from productSupplier;

