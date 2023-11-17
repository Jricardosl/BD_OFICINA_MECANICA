/*--------------------------------------------------------------------------------------------*/
/*--------------------------------------- COMANDOS DQL----------------------------------------*/
/*--------------------------------------------------------------------------------------------*/ 

/*----------------------------------Relatório 1-----------------------------------------------*/ 
/*Lista de Clientes que moram em Recife, trazendo as colunas (Nome do Cliente, Telefone do Cliente, Cidade do Cliente, 
sendo ordenado pelo nome do cliente*/

select c.nome "Nome do Cliente",
	   c.telefone "telefone",
       e.cidade "Cidade"
			from cliente c
			inner join endereco e on e.idendereco = c.endereco_idendereco
            where e.cidade like "%ecife"
				order by c.nome;
                
select * from endereco;

/*----------------------------------Relatório 2-----------------------------------------------*/ 
/*Lista de Clientes que com a placa e marca do veiculo, trazendo as colunas (Nome do Cliente, Telefone do Cliente, 
Cidade do Cliente, placa do veiculo e marca, sendo ordenado pela cidade onde o cliente mora*/

select c.nome "Nome do Cliente",
	   c.telefone "telefone",
       e.cidade "Cidade",
       v.placa "Placa",
       v.marca "Marca veiculo"
			from cliente c
			inner join endereco e on e.idendereco = c.endereco_idendereco
            inner join veiculo v on v.cliente_cpf = c.cpf
            	order by e.cidade;
                

/*----------------------------------Relatório 3-----------------------------------------------*/ 
/*Lista de Mecânicos trazendo as colunas (Cpf do mecanico, Nome do Mecanico, salario, sexo, cidade e bairro, 
sendo ordenado pela cidade*/

select m.cpf "CPF",
	   m.nome "Nome do mecânico",
       m.salario "Salário",
       m.sexo "Sexo",
       e.cidade "cidade",
       e.bairro
			from mecanico m
			inner join endereco e on e.idendereco = m.endereco_idendereco
            	order by e.cidade;
                
	/*----------------------------------Relatório 4-----------------------------------------------*/ 
/*Lista de Serviços realizados em cada veiculos mostrando o total do serviços realizados trazendo as colunas
 (Placa do veiculo, Marca, Serviço realizado, valor total do serviço, sendo ordenado pela placa*/
 
 select v.placa "Placa",
	    v.marca "Marca do veículo",
        s.nome "Servico realizado",
        concat("R$ ",s.valor) "Valor do serviço"
			from os o  
			inner join veiculo v on v.placa = o.veiculo_placa
            inner join servico_os sos on sos.servico_idservico = o.idos
            inner join servico s on s.idservico = sos.servico_idservico
            	order by v.placa;
                
		/*----------------------------------Relatório 5-----------------------------------------------*/ 
/*Lista de Serviços realizados em cada veiculos e qual o mecânico fez o serviço mostrando o valor total do serviço realizados trazendo as colunas
 (Placa do veiculo, Marca, Serviço realizado, valor total do serviço, nome do mecânico e a especialidade, 
 sendo ordenado pelo nome do mecânico*/
 
 select v.placa "Placa",
	    v.marca "Marca do veículo",
        s.nome "Servico realizado",
        concat("R$ ",s.valor) "Valor do serviço",
        m.nome "Mecânico",
        m.especialidade "Especialidade"
			from mecanico_os mos
            inner join mecanico m on m.cpf = mos.mecanico_cpf            
            inner join veiculo v on v.mecanico_cpf = m.cpf
            inner join os o on o.veiculo_placa = v.placa
            inner join servico_os sos on sos.servico_idservico = o.idos
            inner join servico s on s.idservico = sos.servico_idservico
					order by m.nome;
            
	/*----------------------------------Relatório 6-----------------------------------------------*/ 
/*Selecionar cliente, veículo e ordem de serviço cuja data prevista seja o mês de
junho trazendo as colunas(Nome Cliente, placa Veículo, Ordem de serviço, valor total da OS)*/

select c.nome "Cliente",
	   v.placa "Placa Veículo", 
	   s.idos "Codigo OS", 
       concat("R$ ",s.valorTotal) "Valor Total OS"
			from veiculo v
				inner join cliente c on c.cpf = v.cliente_cpf
				inner join os s on s.veiculo_placa = v.placa
					where substring(s.dataPrevista, 6,2) = '06';
 
            
	/*----------------------------------Relatório 7-----------------------------------------------*/ 
/*Lista de Serviços realizados em cada veiculos mostrando qual o serviço e a peça mostrando o valor total do serviço e da peça  
trazendo as colunas (Placa do veiculo, Marca, Serviço realizado, valor total do serviço, valor da peça sendo ordenado pela placa*/
  
 select v.placa "Placa",
	    v.marca "Marca do veículo",
        s.nome "Servico realizado",
        concat("R$ ",s.valor) "Valor do serviço",
        p.nome "Peça",
        concat("R$ ",p.valor) "valor da peça",
        concat("R$ ",sum(s.valor + p.valor)) "Valor total Serviço e peças"
        	from os o 
            inner join veiculo v on v.placa = o.veiculo_placa
            inner join peca p on p.idpeca = o.idos
            inner join servico_os sos on sos.servico_idservico = o.idos
            inner join servico s on s.idservico = sos.servico_idservico
					group by o.valorTotal
               		order by v.placa;
                    

/*----------------------------------Relatório 8-----------------------------------------------*/ 
/*Lista de veiculos que realizaram algum servico e/ou apenas peças trazendo as colunas 
(Placa do veiculo, Marca, Serviço realizado, Peça*/

select v.placa "Placa",
	    v.marca "Marca do veículo",
        s.nome "Servico realizado",
        p.nome "Peça"
			from os o 
				left join veiculo v on v.placa = o.veiculo_placa
				left join peca p on p.idpeca = o.idos
				left join servico_os sos on sos.servico_idservico = o.idos
				left join servico s on s.idservico = sos.servico_idservico
						order by v.placa;

/*----------------------------------Relatório 9-----------------------------------------------*/ 
/*Lista de peças informando o fornecedor e a cidade do fornecedor trazendo as colunas 
(Nome o CNPJ do fornecedor, Nome do fornecedor, telefone do fornecedor, cidade do fornecedor, 
nome da peça, quantidade e valar unitário*/

select f.cnpj "CNPJ",
	   f.nome "Fornecedor",
       f.telefone "Telefone",
       e.cidade, "Cidade",
       p.nome "Peça",
       p.quantidade "Quantidade",
       concat("R$ ",p.valor) "Valor Unitário"
			from fornecedor f
				inner join peca p on p.fornecedor_cnpj = f.cnpj
                inner join endereco e on e.idendereco = f.endereco_idendereco;
       

/*----------------------------------Relatório 10-----------------------------------------------*/ 
/*Lista do valor total do estoque por peça trazendo as colunas 
(nome da peça, marca da peça, quantidade e valar unitário, e valor total por peça*/select * from peca;

select nome "Peça",
	   marca "Marca",
       quantidade "Quantidade",
       concat("R$ ",valor) "Valor Unitário",
       concat("R$ ",quantidade * valor) "Valor total por peça"
			from peca;

select avg(quantidade * valor) from peca;
			
/*----------------------------------Relatório 11-----------------------------------------------*/ 
/*
Selecionar cliente, veículo e ordem de serviço cuja data prevista seja o mês de
fevereiro, trazendo as colunas(Nome Cliente, placa Veículo, Ordem de serviço, valor total da OS)
*/

select c.nome "Cliente",
	   v.placa "Placa Veículo", 
       s.idos "Codigo OS", 
       concat("R$ " ,s.valorTotal) "Valor Total OS"
from veiculo v
inner join cliente c on c.cpf = v.cliente_cpf
inner join os s on s.veiculo_placa = v.placa
where substring(s.dataPrevista, 6,2) = '02';


/*----------------------------------Relatório 12-----------------------------------------------*/ 
/*
Listar as OS onde a forma de pagamento seja Pix e a quantidade de peças maior que duas,
trazendo as colunas(Código OS, data de conclusão, forma de pagamento, valor total da OS, quantidade de peças)
*/

select s.idos "Código OS", 
	   s.dataConclusao "Data de Conclusão", 
       f.tipo "Forma de Pagamento",
       concat("R$ ", s.valorTotal) "Valor Total OS", 
       p.quantidade "Quantidade de Peças"
			from os s
				inner join formaPagamento f on s.formaPagamento_idformaPagamento = f.idformaPagamento
				inner join peca p on p.os_idos = s.idos
					where f.tipo like "Pix" and p.quantidade > 2;


/*----------------------------------Relatório 13-----------------------------------------------*/ 
/*
Listar os clientes com seu respectivo veículo e o mecânico responsável pela manutenção,
onde a data de conclusão seja igual a data prevista, trazendo as colunas(Nome Do Cliente,
Placa Do Veículo, Nome do mecânico, especialidade do mecânico) ordenando pelo nome do cliente.
*/

select s.idos "Número Da OS", 
	   c.nome "Nome Do Cliente", 
       v.placa "Placa Do Veículo", 
       m.nome "Nome Do Mecânico",
	   m.especialidade "Especialidade Do Mecânico", concat("R$ ", s.valorTotal) "Valor Da OS", f.tipo "Forma De Pagamento"
			from cliente c
			inner join veiculo v on v.cliente_cpf = c.cpf
			inner join os s on s.veiculo_placa = v.placa
			inner join mecanico m on m.cpf = v.mecanico_cpf
			inner join formaPagamento f on f.idformaPagamento = s.formaPagamento_idformaPagamento
				order by c.nome;


/*----------------------------------Relatório 14-----------------------------------------------*/ 
/*
Listar os clientes que mais realizaram consertos/manutensão nos veiculos no ano 2021,
trazendo as colunas(Nome Do Cliente, Telefone do Cliente, Bairro do Cliente, Rua do cliente,
veículo do Cliente, quantidade de Reparos)
*/

select c.nome "Nome Do Cliente",
	   c.telefone "Telefone Do Cliente", 
       e.bairro "Bairro Do Clinte",
	   e.rua "Rua Do Cliente", v.placa "Placa Do Veículo", v.marca "Marca Do Veículo", count(s.idos) "Total de Atendimentos"
			from veiculo v
				inner join cliente c on v.cliente_cpf = c.cpf
				inner join endereco e on e.idendereco = c.endereco_idendereco
				inner join os s on s.veiculo_placa = v.placa
				where substring(s.dataConclusao,1,4) = '2022'
					group by 1,2,3,4,5,6
						order by 7 desc;

/*----------------------------------Relatório 15-----------------------------------------------*/ 
/*Lista do valor total do estoque por peça menor que média do valor tota do estoque trazendo as colunas 
(nome da peça, marca da peça, quantidade e valar unitário, e valor total por peça. Ordenado por decrescente do 
valor total do estoque*/

select nome "Peça",
	   marca "Marca",
       quantidade "Quantidade",
       concat("R$ ",valor) "Valor Unitário",
       concat("R$ ",quantidade * valor) "Valor total por peça"
			from peca
				where quantidade * valor <= (select avg(quantidade * valor) from peca)
					order by quantidade * valor desc;

/*----------------------------------Relatório 16-----------------------------------------------*/ 
/*Listar as OS com seus respectivos serviços onde a forma de pagamento seja PIX ou Débito
trazendo as colunas(Código da OS, Data de conclusão, Nome Do Serviço,Tipo Do Serviço, Valor do serviço,
Valor Total OS)
*/

select c.nome "Nome Do Cliente", c.telefone "Telefone Do Cliente", e.bairro "Bairro Do Clinte",
e.rua "Rua Do Cliente", v.placa "Placa Do Veículo", v.marca "Marca Do Veículo", count(s.idos) "Total de Atendimentos"
from veiculo v
inner join cliente c on v.cliente_cpf = c.cpf
inner join endereco e on e.idendereco = c.endereco_idendereco
inner join os s on s.veiculo_placa = v.placa
where substring(s.dataConclusao,1,4) = '2022'
group by 1,2,3,4,5,6
order by 7 desc;


/*----------------------------------Relatório 17-----------------------------------------------*/ 
/*****************************************************************************************************
Listar os fornecedores com seus respectivos endereços que entregam para a oficina
PNEU, trazendo as colunas(Código do Fornecedor, Nome Do Fornecedor, Telefone Do Fornecedor
Bairro do fornecedor, Peça Fornecida), ordenando pelo nome do fornecedor.
******************************************************************************************************/

select f.cnpj "CNPJ Do Fornecedor", f.nome "Nome Do Fornecedor", f.telefone "Telefone Do Fornecedor",
e.cidade "Cidade Do Fornecedor", p.nome "Peça Fornecida"
from fornecedor f
inner join endereco e on e.idendereco = f.endereco_idendereco
inner join peca p on p.fornecedor_cnpj = f.cnpj
where p.nome like "PNEU"
order by f.nome;

/*----------------------------------Relatório 18-----------------------------------------------*/ 
/*Listar os clientes com seus respectivos endereços cuja forma de pagamento seja crédito
parcelado e o valor total da OS maior que R$ 1200,00, trazendo as colunas(CPF do Cliente,
Nome Do Cliente, Telefone Do Cliente, Cidade Do Cliente, Bairro Do Cliente, Forma De Pagamento,
Código Da OS, Valor Total OS), ordenando pelo valor Total OS.
*/

select c.cpf "CPF Do Fornecedor", c.nome "Nome Do Cliente", c.telefone "Telefone Do Cliente",
e.cidade "Cidade Do Cliente", e.bairro "Bairro Do Cliente", p.tipo "Forma De Pagamento",
o.idos "Código OS", o.valorTotal "Valor Total OS"
from veiculo v
inner join cliente c on c.cpf = v.cliente_cpf
inner join endereco e on e.idendereco = c.endereco_idendereco
inner join os o on o.veiculo_placa = v.placa
inner join formaPagamento p on p.idformaPagamento = o.formaPagamento_idformaPagamento 
where o.valorTotal >= 1200
order by o.valorTotal desc;

/*----------------------------------Relatório 19-----------------------------------------------*/ 
/*Listar as OS que necessitaram de peças, indicando o fornecedor e o veículo que passou
pela manutenção, trazendo as colunas(Código Da OS, Data De Conclusão, Data Prevista,
Placa Do Veículo, Marca Do Veículo, Nome Da Peça, Quantidade De Peça, Valor Da Peça, Nome do Fornecedor),
ordenando pela quantidade de peças.
*/

select s.idos "Código Da Os", s.dataPrevista "Data Prevista", s.dataConclusao "Data Conclusão",
v.placa "Placa", v.marca "Marca", p.nome "Nome Da Peça", p.quantidade "Quantidade De Peça",
p.valor "Valor Da Peça", f.nome "Nome Do Fornecedor"
from os s
inner join veiculo v on v.placa = s.veiculo_placa
inner join peca p on p.os_idos = s.idos
inner join fornecedor f on f.cnpj = p.fornecedor_cnpj
order by p.quantidade;

/*----------------------------------Relatório 20-----------------------------------------------*/ 
/*Listar os Mecânicos que realizaram o maior número de OS, trazendo as colunas
(CPF Do Mecânico, Nome Do Mecânico, Quantidade De OS),
ordenando pela quantidade de OS.
*/

select m.cpf "CPF Do Mecânico", m.nome "Nome Do Mecânico", count(o.idos) "Quantidade De OS"
from mecanico_os mo
inner join mecanico m on m.cpf = mo.mecanico_cpf
inner join os o on o.idos = mo.os_idos
inner join servico_os so on so.os_idos = o.idos
group by 1,2
order by count(o.idos) desc;