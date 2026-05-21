DROP VIEW IF EXISTS
netflix_clean;

CREATE VIEW netflix_clean AS 

SELECT id_conteudo,
        UPPER(TRIM(titulo)) AS titulo,
       
    CASE
      WHEN tipo = 'Movie' THEN 'Filme'
      WHEN tipo = 'TV Show' THEN 'Série'
     END AS tipo_midia,
  
    CASE
      WHEN diretor IS NULL OR TRIM(diretor) = ''
      THEN 'Diretor Não Informado' 
      ELSE diretor 
     END AS diretor,

    CASE 
       WHEN elenco IS NULL OR TRIM(elenco) = ''
       THEN 'Elenco Não Informado' ELSE elenco
     END AS elenco,

    CASE 
       WHEN pais IS NULL OR TRIM(pais) = ''
       THEN 'Pais Não Informado' ELSE pais
     END AS pais,

    CASE
       WHEN data_adicao IS NULL OR TRIM(data_adicao) = '' THEN 'Não Informado' 
       ELSE data_adicao
      END AS data_adicao,

    ano_lancamento,
    CASE 
        WHEN CAST(ano_lancamento AS INT) < 2000 THEN 'Clássico'
        WHEN CAST(ano_lancamento AS INT) BETWEEN 2000 AND 2015 THEN 'Moderno'
        WHEN CAST(ano_lancamento AS INT) > 2015 THEN 'Lançamento'
        WHEN CAST(ano_lancamento AS INT) IS NULL OR CAST(TRIM(ano_lancamento) AS INT) = '' THEN 'Ano Não Informado'
        END AS geracao_conteudo,


    classificacao,
    CASE 
        WHEN classificacao IN ('TV-MA', 'R','NC-17') THEN 'Adulto'
        WHEN classificacao IN ('TV-14', 'PG-13', 'TV-PG', 'PG') THEN 'Adolescente'
        WHEN classificacao IN ('TV-Y', 'TV-Y7', 'TV-G', 'G') THEN 'Infantil'
            ELSE 'Não Informado'
        END AS publico_alvo,

   CAST(SUBSTR(duracao, 1, INSTR(duracao, ' ') -1) AS INTEGER) AS duracao_valor,
        SUBSTR(duracao, INSTR(duracao, ' ') +1) AS duracao_unidade

FROM netflix
WHERE titulo IS NOT NULL;


