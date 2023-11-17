/*--------------------------------------------------------------------------------------------*/
/*--------------------------------------- COMANDOS DML----------------------------------------*/
/*--------------------------------------------------------------------------------------------*/

select * from endereco;

insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)
	value ("PE", "Recife", "Boa Vista", "Rua Dom Bosco", 1542, "Ap 1502", "50050-070");
    
insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)
	values ("PE", "Recife", "Boa Viagem", "Rua Segredo", 51, "Ap 1803", "51020-170"),
		("PE", "Recife", "Boa Viagem", "Rua Passarinho", 1345, "Ap 357", "51111-000"),
		("PE", "Recife", "Prado", "Rua Capitão Zuera", 453, "Ap 56", "38888-058"),
		("PE", "Recife", "Madalena", "Rua Ricardo Salazar", 45, "Ap 501-A", "50720-123"),
        ("PE", "Recife", "Campo Grande", "Rua Faz Chover", 1000, "Casa 02", "50887-170"),
		("PE", "Jaboatao", "Cha Grande", "Rua Desce e Sobe", 1, "Primeiro Andar", "51227-170"),
		("PE", "Olinda", "Bairro Novo", "Rua Faz Chover", 40, "Apto 15", "50087-170"),
		("PE", "Recife", "Hipódromo", 'Rua Fulano de Tal', 100, "casa", "51041-500"),
		("PE", "São Lourenço da mata", "Centro", "Rua Holanda", 08, "Quadra E", "54735-110"),
        ("PE", "Olinda", "Jardim Atlantico", "Rua Rutilo", 8, " ", "53060-360"),
        ("PE", "Recife", "Campo Grande", "Rua N S da Glória", 164, "casa", "52031-050"),
        ("PE", "Recife", "iputinga", "Rua João do caminhão", 102, "Ap 200", "55309-083");
        
insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)
	value ("PE", "Abreu e Lma", "Caetés 3", "Rua quarenta e seis", 116, "casa", "53500-090");
    
insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)
	values ("PE", "Petrolina", "João de Deus", "Rua esperança do norte", 236, "casa", "52350-130"),
		  ("PE", "Petrolina", "Loteamento Recife", "Rua quarenta e oito", 1116, "casa", "89303-230"),
          ("PE", "Petrolina", "Pedra Linda", "Rua quarenta e um", 176, "casa", "51223-010"),
          ("PE", "Petrolina", "Jardim São Paulo", "Rua quarenta e dois", 346, "casa", "52340-120"),
          ("PE", "Petrolina", "Uruas", "Rua Oitenta e seis", 563, "casa", "52340-120"),
          ("PE", "Petrolina", "Alto da Boa Vista", "Rua novente e cinco", 156, "casa", "53420-190"),
          ("PE", "Petrolina", "João de Deus", "Rua norte sul", 236, "casa", "56330-440"),
          ("PE", "Caruaru", "João Mota", "Rua nova", 453, "casa", "52334-122"),
          ("PE", "Caruaru", "Rosanopolis", "Rua artur maia", 346, "casa", "53345-233"),
          ("PE", "Caruaru", "Salgado", "Rua antonio carlos", 563, "casa", "53442-123"),
          ("PE", "Caruaru", "Jua", "Av azul escuro", 531, "casa", "52344-012"),
          ("PE", "Caruaru", "Centanerio", "Rua vinte e seis", 346, "casa", "53122-120"),
          ("PE", "Caruaru", "Zona Rural", "Av alegria", 096, "casa", "53450-440");

insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)        
	values ("PE", "Olinda", "Rio Doce", "Av do sol", 234, "casa", "54301-000"),
		   ("PE", "Olinda", "Ouro preto", "Rua lesta",1236, "casa", "51230-120"),
           ("PE", "Olinda", "Jatobá", "Rua dez", 996, "casa", "53342-111"),
           ("PE", "Recife", "Boa Viagem", "Av Boa Viagem", 126, "casa", "53340-120"),
           ("PE", "Recife", "Casa Forte", "Av rio claro", 126, "casa", "53112-423");

insert into endereco (uf, cidade, bairro, rua, numero, complemento, cep)        
	values ("PE", "Paulista", "Pau Amarelo", "Av lodrina", 123, "casa", "52341-210"),
		   ("PE", "Paulista", "Janga", "Av Herculano", 234, "Apto B", "53421-230"),
           ("PE", "Paulista", "Nobre", "Rua do Nobre", 4530, "casa", "53432-550");
           
select * from formapagamento;
desc formapagamento;

insert into formapagamento (tipo)
	values ("Pix"),
		   ("Crédito rotativo"),
           ("Crédito parcelado"),
           ("Débito");


select * FROM servico;
desc servico;

insert into servico (nome, tipo, valor, descricao)
	values ("troca de óleo", "mecânica", 100.00 , "troca de óleo e filtro"),
		   ("alinhamento", "mecânica", 120.00 , "alinhamento das quatro rodas"),
           ("limpeza do ar condicionado", "mecânica", 200.00 , "limpeza e higienização do ar condicionado"),
           ("serviços de funilaria", "funilaria", 1200.00 , "repado de lataria e pintura"),
           ("reforma nos bancos e estofamentos", "mecânica", 850.00 , "troca de estofado"),
           ("consertos dos botões e do painel", "elétrica", 300.00 , "conserto de botão de alerta"),
           ("substituição calotas, volante e tapetes", "acessórios", 280.00 , "troca de acessórios"),
           ("embreagem", "mecânica", 400.00 , "embreagem patinando"),
           ("freio", "mecânica", 420.00 , "troca de pastilhas e fluídos"),
           ("arrefecimento", "mecânica", 220.00 , "Checagem do nível e troca de água no radiador");
           
           
select * from endereco;

select * from cliente;

insert into CLIENTE (CPF, NOME, TELEFONE, endereco_idendereco) 
	value ("024.177.274-55", "José Ricardo da Silva Lima", "81987894100",1);
    
insert into CLIENTE (CPF, NOME, TELEFONE, endereco_idendereco) 
values ("070.154.874-57", "Hugo Diniz", "81988234599",2),
	   ("112.345.678-90", "Juliana Ramalho", "81998134598",3),
       ("765.387.876-34", "Diego Coutinho", "81998136585",4), 
       ("014.128.358-00", "Ben Hur Queiroz", "81988753455",5),
       ("055.432.798-57", "Fellipe Diniz", "81978227653",6), 
       ("077.188.387-02", "Godofredo Souza", "81966884433",7), 
       ("098.765.432-11", "César Pinho", "81988898500",8), 
       ("102.406.954-01", "Mácio Júnior", "81918000010",9),
       ("120.380.134-18", "Joao Victor", "81935000034",10),
       ("124.749.910-88", "Luiz Andre", "81912220040",11),
       ("100.300.650-76", "Thiago Rodrigues", "81916803400",12), 
       ("112.088.387-02", "Godolores Castro", "81920525622",13),
       ("045.256.484-06","Érica Feijó de Souza Lima", "81984225464",14);


select * from endereco;

insert into mecanico (cpf, nome, sexo, especialidade, salario, endereco_idendereco)
	values ("803.156.989-98", "Daniel Farias", "M", "elétrica e eletrônica",2200.00,15),
		("123.456.529-34", "Maria José", "F", "estética automotiva",2300.50, 16),
        ("025.236.786-45", "Igor José", "M", "sistemas de transmissão",1990.00, 17),
        ("167.026.389-56", "Aline Lima", "F", "amortecedores e suspensões",2209.00,18),
        ("102.357.589-67", "Pedro Costa", "M", "freios",3000.00,19),
        ("233.456.789-78", "José Farias", "M", "manutenção",1980.00,20),
        ("093.982.709-89", "Bento Soares", "M", "Reparador de sistemas",2050.00,21),
        ("092.123.389-10", "Elisa Farias", "F", "elétrica e eletrônica",3290.00,22),
        ("303.256.245-20", "Diogo Silva", "M", "pintura",2590.00, 23),
        ("111.112.489-30", "Dayane Silva", "F", "Alinhamento e balanceamento",2090.00,24),
        ("293.556.679-40", "Diego Costa", "M", "Troca de óleo.",3100.10,25);

select * from endereco;

insert into fornecedor (CNPJ, NOME, TELEFONE, endereco_idendereco)
	values ("12.009.444/0001-80", "OFICINA FORD", "8198229881",26),
           ("23.309.988/0001-70", "FERREIRA AUTO SERVIC", "8100999932",27),
           ("98.887.776/0001-01", "INJETCAR", "8199099871",28),
           ("00.998.877/0001-10", "PANTERA CAR", "8199888877",29),
           ("00.998.887/0001-10", "LOJA SERVIÇO", "8198838887",30),
           ("23.309.988/0001-99", "VEICULO NOVO", "81988737709",31),
           ("12.988.388/0001-01", "MARTELINHO DE OURO", "8198667700",32),
           ("16.239.988/0001-00", "QUEBRA TUDO", "8199833002",33),
           ("23.399.888/0001-44", "RENOVO CAR", "8199033401",34),
           ("04.067.221/0001-98", "AUTO VIP CAR", "8121239087",35);

select * from fornecedor;

	    
insert into VEICULO (PLACA, MARCA, RENAVAM, MECANICO_CPF, CLIENTE_CPF)
	values ("ZPG1D02", "ONIX", "23090988883", "025.236.786-45", "014.128.358-00"),
           ("DAG2E34", "GOL", "01998728767", "092.123.389-10",  "024.177.274-55"),
           ("GRE1F00", "HB20", "33980198870", "093.982.709-89", "045.256.484-06"),
           ("EFO4A33", "COROLLA", "45533000090", "102.357.589-67", "055.432.798-57"),
           ("FRG3K45", "ECOSPORT", "12399099887", "111.112.489-30", "070.154.874-57"),
           ("GHE4H31", "KA", "09939883388", "123.456.529-34","077.188.387-02"),
           ("FGO5T11", "CIVIC", "99098882221", "167.026.389-56",  "098.765.432-11"),
           ("RGH6J22", "FOX", "77787733201", "233.456.789-78", "100.300.650-76"),
           ("KJI1I55", "UN0", "88977744001", "293.556.679-40",  "102.406.954-01"),
           ("OOK2R40", "FIT", "66988870012", "303.256.245-20", "112.088.387-02"),
           ("KIK3H39", "STRADA", "44500999828", "803.156.989-98",  "112.345.678-90"),
           ("LOL2P45", "DUSTER", "99909888123", "025.236.786-45", "120.380.134-18"),
           ("RZG1C92", "SANDERO", "01282389294", "303.256.245-20", "124.749.910-88"),
          ("KKK1K00", "SAVEIRO", "00092988882", "093.982.709-89", "765.387.876-34");
           
select * from veiculo;

select * from mecanico;           

select * from cliente;

select * from os;

desc os;

insert into os (dataemissao, dataconclusao, dataprevista, valortotal, formapagamento_idformapagamento,veiculo_placa)
	value ('2022-06-04 13:30:00', '2022-06-05 09:00:00','2022-06-06 13:30:00', 1200.00, 3,"ZPG1D02");

insert into os (dataemissao, dataconclusao, dataprevista, valortotal, formapagamento_idformapagamento,veiculo_placa)
	values ('2022-06-04 13:30:00', '2022-06-05 09:00:00','2022-06-06 13:30:00', 1200.00, 3,"ZPG1D02"),
		   ('2022-06-04 09:30:00', '2022-06-04 10:00:00','2022-06-06 11:40:00', 400.00, 1,"DAG2E34"),
           ('2022-04-14 08:20:00', '2022-04-25 08:00:00','2022-04-26 12:20:00', 850.00, 2,"EFO4A33"),
           ('2022-02-14 15:00:00', '2022-02-15 11:00:00','2022-02-16 12:30:00', 455.00, 1,"FGO5T11"),
           ('2022-02-12 08:30:00', '2022-02-05 09:00:00','2022-02-06 17:00:00', 700.00, 3,"FRG3K45"),
           ('2022-01-24 08:10:00', '2022-01-24 12:00:00','2022-01-25 09:20:00', 1540.50, 3,"GHE4H31"),
           ('2022-01-04 12:30:00', '2022-01-05 08:00:00','2022-01-16 08:30:00', 2800.00, 3,"GRE1F00"),
           ('2022-03-01 08:30:00', '2022-03-05 09:00:00','2022-02-06 13:30:00', 3400.00, 3,"KIK3H39"),
           ('2022-02-11 08:30:00', '2022-02-12 08:10:00','2022-02-14 17:30:00', 1343.20, 3,"KJI1I55");
           
insert into servico_os (servico_idservico, os_idos)
	value (1,2);
           
insert into servico_os (servico_idservico, os_idos)
	values (2,1),
		   (3,4),
           (4,5),
           (5,6),
           (7,1),
           (8,1),
           (9,1),
           (10,7);
           
insert into peca (nome,quantidade,valor,modelo,ano,marca,os_idos,fornecedor_cnpj)
	value ("PNEU",2,489.00,"ARO 15 HH301 195/55R15 85V",'2022',"SPEEDMAX",1,"00.998.877/0001-10");
    
insert into peca (nome,quantidade,valor,modelo,ano,marca,os_idos,fornecedor_cnpj)
	values ("PNEU",8,450.90,"185/60R14 82h ",'2022',"Citytech II",3,"04.067.221/0001-98"),
			("PNEU",4,689.00,"205/60R16 92h Contipowercontact",'2022',"Continental",2,"00.998.887/0001-10"),
            ("Aditivo Radiador",20,17.25," 1 Litro",'2021',"Paraflu Rosa",4,"12.009.444/0001-80"),
            ("Óleo Câmbio Automático",15,58.90,"DEXRON VI ATF 1 Litro ",'2022',"Mobil",5,"00.998.877/0001-10"),
            ("Pastilha Freio Traseiro",6,339.08,"BMW X1 2009 a 2015 2392701",'2022',"Textar",6,"16.239.988/0001-00"),
            ("Pastilha Freio Dianteiro",8,186.00,"Pulse 2022 a 2023",'2022',"HQF2499C",7,"23.309.988/0001-70"),
            ("Kit Embreagem ",3,1104.60,"Civic 1.7 16V 2001 a 2005 621303900",'2005',"Luk",8,"23.309.988/0001-99"),
            ("Jogo Pistão ",4,386.55,"Motor Monza Kadett 1.8 87 a 91",'2019',"PS4638050",9,"23.399.888/0001-44"),
            ("Bomba Água ",3,387.00,"Land Rover Freelander 2.2 2010 a 2015 65926",'2015',"Freelande",10,"98.887.776/0001-01"),
            ("Junta Homocinética",5,162.00,"Prisma 2013 a 2019  NJH050583",'2022',"Nakata",1,"23.399.888/0001-44"),
            ("Filtro Ar Condicionado ",10,54.35,"Polo 1.0 1.4 1.6 2018 a 2021",'2021',"Wega",2,"12.009.444/0001-80");
    
select * from fornecedor;

select * from mecanico;

select * from os;

select * from mecanico_os;

insert into mecanico_os (os_idos,mecanico_cpf)
	values(1,"025.236.786-45"),
          (2,"092.123.389-10"),
          (3,"093.982.709-89"),
          (4,"102.357.589-67"),
          (5,"111.112.489-30"),
          (6,"123.456.529-34"),
          (8,"233.456.789-78"),
          (9,"293.556.679-40"),
          (10,"303.256.245-20");
          
insert into mecanico_os (os_idos,mecanico_cpf)
	value (7,"803.156.989-98");