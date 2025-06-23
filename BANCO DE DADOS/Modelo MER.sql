-- ENTIDADES e ATRIBUTOS--

-- 1 - Jogador

id_jogador (PK)

nome

email

idade

plataforma_preferida

-- 2 - Jogo

id_jogo (PK)

nome_jogo

genero

data_lancamento

-- 3 - Sessao_Jogo (representa uma sessão de jogo de um jogador em um jogo específico)

id_sessao (PK)

id_jogador (FK)

id_jogo (FK)

data_inicio

data_fim

progresso_percentual (0-100)

concluiu (boolean)

--RELACIONAL:--

Jogador joga Jogo (1:N via Sessao_Jogo)

Um jogador pode ter várias sessões em vários jogos, cada sessão terá um progresso e uma conclusão.