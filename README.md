# Resumo [DIO DATABASE EXPERIENCE](https://web.dio.me/track/database-experience) - O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados

## O que são banco de dados relacionais (**SQL**)?
Tipo de banco que possuem relações entre suas tabelas (entidades), geralmente com um esquema de dados rígidos (pouco mutável), buscando garantir ao máximo a integridade.

## O que é banco de dados não relacional (**NoSQL**)?
Alternativa aos bancos relacionais, com capacidades a mais (complementando), como, por exemplo: escalabilidade não vertical e armazenamento de informações não rígido (não estruturado). Os bancos NoSQLs não vão substituir os SQLs, apenas resolver problemas e dificuldades dos SQLs.

### Consultas em bancos NoSQL
Mesmo possuindo estruturas que podem variar ao decorrer do tempo, ao modelar e implementar o banco, deve-se considerar como serão feitas as consultas (suas chaves) para que se encontrem as informações. Além disso, a aplicação também deve saber lidar com a variabilidade das informações.

### Conhecer um banco de cada tipo?
Não dá para conhecer todas as ferramentas! Mas os seus contextos e objetivos, sim. Ou seja, é importante entender o conceito de cada tipo, assim se necessário pode-se usá-lo, avançar e aprender a fundo. 

### Comparando a flexibilidade do NoSQL e SQL
Bancos SQL são pensados para garantir o ACID (atomicity, consistency, isolation, durability), onde, apenas recetemente, alguns bancos NoSQL estão possuindo essas garantias.

### LTE
Extract Transform Load, são ferramentas de software cuja função é a extração de dados de diversos sistemas, transformação dos dados conforme regras de negócios e o carregamento dos dados, ou seja, manipulação. 

### Tipo do banco de dados e a complexidade
A escolha do banco para determinado contexto pode influenciar na complexidade, outro fator é a arquitetura do banco, podendo facilitar/dificultas futuras consultas e integrações.

### Engenheiro e Cientista de Dados
São perfis complementares, geralmente o engenheiro está voltado a preparação do dado, para o futuro uso do cientista de dados, este que no que lhe concerne pode utilizar de diversas ferramentas para aplicar algum processamento sobre as informações e gerar algum resultado.

### Deficiências de estatística
Estatística é uma base. As bibliotecas fornecem uma abstração, mas ainda assim é importante o conhecimento sobre o tema.