--- 1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano 
FROM dbo.Filmes;

--- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes 
ORDER BY Ano ASC;

--- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes 
WHERE Nome = 'De Volta para o Futuro';

--- 4 - Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes 
WHERE Ano = 1997;

--- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes 
WHERE Ano > 2000;

--- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes 
WHERE Duracao > 100 AND Duracao < 150 
ORDER BY Duracao ASC;

--- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) AS QuantidadeFilmes 
FROM dbo.Filmes 
GROUP BY Ano 
ORDER BY MAX(Duracao) DESC;

--- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT 
    a.PrimeiroNome,
    a.UltimoNome,
	a.Genero
FROM 
    dbo.Atores a
WHERE 
    a.Genero = 'M'  
ORDER BY 
    a.PrimeiroNome;

--- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT 
    PrimeiroNome,
    UltimoNome,
	Genero
FROM 
    dbo.Atores
WHERE 
    Genero = 'F'  
ORDER BY 
    PrimeiroNome;

--- 10 - Buscar o nome do filme e o gênero
SELECT 
    f.Nome AS NomeDoFilme,
    g.Genero AS Genero
FROM 
    dbo.Filmes f
JOIN 
    dbo.FilmesGenero fg ON f.Id = fg.IdFilme
JOIN 
    dbo.Generos g ON fg.IdGenero = g.Id; 

--- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT 
    f.Nome AS NomeDoFilme,
    g.Genero AS Genero
FROM 
    dbo.Filmes f
JOIN 
    dbo.FilmesGenero fg ON f.Id = fg.IdFilme
JOIN 
    dbo.Generos g ON fg.IdGenero = g.Id
WHERE 
    g.Genero = 'Mistério';

--- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
    f.Nome AS NomeDoFilme,
    a.PrimeiroNome,
    a.UltimoNome,
    fa.Papel  -- Supondo que a tabela ElencoFilme tem uma coluna Papel
FROM 
    dbo.Filmes f
JOIN 
    dbo.ElencoFilme fa ON f.Id = fa.IdFilme
JOIN 
    dbo.Atores a ON fa.IdAtor = a.Id;