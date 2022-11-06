Use Aula2Ex1
Go

--Consultar num_cadastro do cliente, nome do cliente, data_locacao (Formato dd/mm/aaaa), 
--Qtd_dias_alugado (total de dias que o filme ficou alugado),
 --titulo  do filme, ano do filme da locação do cliente cujo nome inicia com Matilde

Select num_cadastro, nome, Convert(Char(10), data_locacao, 103) As data_locacao, DateDiff(Day, data_locacao, data_devolucao) As qtd_dias_alugado, titulo, ano
From Cliente Left Outer Join Locacao
On Cliente.num_cadastro = Locacao.Clientenum_cadastro
Left Outer Join DVD
On DVD.num = Locacao.DVDnum
Left Outer Join Filme
On Filme.id = DVD.Filmeid
Where nome Like 'Matilde%'

--Consultar nome da estrela, nome_real da estrela, título do filme dos filmes cadastrados do ano de 2015
Select nome, nomereal, titulo
From Estrela Left Outer Join Filme_Estrela
On Estrela.id = Filme_Estrela.Estrelaid
Left Outer Join Filme
On Filme.id = Filme_Estrela.Filmeid
Where ano = 2015


--Consultar título do filme, data_fabricação do dvd (formato dd/mm/aaaa), 
--caso a diferença do ano do filme com o ano atual seja maior que 6, 
--deve aparecer a diferença do ano com o ano atual  concatenado com a palavra anos 
--(Exemplo: 7 anos), caso contrário só a diferença (Exemplo: 4).

Select Distinct titulo, Convert(Char(10), data_fabricacao, 103) As data_fabricacao, Convert(Char(10), ano) As ano, Case When DateAdd(Year, ano, getdate()) > 6
		Then  Convert(Char(5), (2022 - ano)) + 'anos'
		Else  Convert(Char(5), (2022 - ano))
		End As tempo_DVD
From Filme Inner Join DVD
On Filme.id = DVD.Filmeid



Select*From DVD
Select*From Locacao
Select*From Cliente
Select*From Estrela
Select*From Filme_Estrela
Select*From Filme
Select*From DVD