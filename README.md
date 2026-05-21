# 🎬 Netflix Data Analytics - SQL & Power BI

Este projeto foi desenvolvido com o objetivo de tratar, estruturar e analisar os dados do catálogo da Netflix. A solução passa por todo o pipeline de dados: desde o tratamento de dados brutos utilizando banco de dados SQL até a criação de um dashboard visual e interativo no Power BI.

## 📸 O Dashboard

Aqui está o resultado visual do relatório desenvolvido no Power BI:

![Visualização do Dashboard](img/dashboard.png)

## 🛠️ Tecnologias e Ferramentas Utilizadas

* *SQL (SQLite):* Para a exploração inicial, limpeza de dados e criação de Views.
* *Power BI:* Para modelagem dos dados, criação de medidas em DAX e desenvolvimento dos visuais.
* *Git & GitHub:* Para controle de versão e documentação do projeto.

## 🗃️ Estrutura do Projeto

* /sql: Contém os scripts das queries utilizadas e a View de limpeza.
* /relatorios: Contém o projeto estruturado do Power BI (.pbip).
* /img: Imagens utilizadas na documentação.

## 🧼 Processo de Limpeza de Dados (SQL)

Para garantir a qualidade das análises no Power BI, criei uma *View de limpeza* no SQL para tratar problemas comuns na base bruta da Netflix, tais como:
* Tratamento de valores nulos (nulls) e vazios de todas as colunas.
* Categorização dos títulos por ano de lançamento e do público alvo de cada título.
* Limpeza na coluna de duração, separando duração valor da duração unidade em duas colunas.

## 📈 Princpais Insights Extraídos

* A maior parte dos titulos do catálogo da Netflix são de filmes.
* A média de duração dos filmes é de 59 min, já a de séries são de duas temporadas.
* O catálogo da Netflix possuí mais títulos destinados para o público adulto.
* Os Estados Unidos está em primeiro lugar na produção de filmes e séries no catálogo da Netflix.

Exemplo de como a View foi estruturada para consumo no Power BI:

```sql

CREATE VIEW netflix_clean AS 

SELECT id_conteudo,
        UPPER(TRIM(titulo)) AS titulo,
       
    CASE
      WHEN tipo = 'Movie' THEN 'Filme'
      WHEN tipo = 'TV Show' THEN 'Série'
     END AS tipo_midia,
    -- outras transformações...
FROM netflix_titles;