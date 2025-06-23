CREATE TABLE Jogador (
    id_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    idade INT,
    plataforma_preferida VARCHAR(50)
);

CREATE TABLE Jogo (
    id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    data_lancamento DATE
);

CREATE TABLE Sessao_Jogo (
    id_sessao INT PRIMARY KEY AUTO_INCREMENT,
    id_jogador INT NOT NULL,
    id_jogo INT NOT NULL,
    data_inicio DATETIME,
    data_fim DATETIME,
    progresso_percentual DECIMAL(5,2) 
        CHECK (progresso_percentual BETWEEN 0 AND 100),
    concluiu BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_jogador) REFERENCES Jogador(id_jogador)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Para saber a porcentagem de jogadores que concluíram um jogo específico

SELECT
J.nome_jogo,
COUNT(CASE WHEN S.concluiu = TRUE THEN 1 END) * 100.0 / COUNT(*) AS porcentagem_conclusao
FROM Sessao_Jogo S
JOIN Jogo J ON S.id_jogo = J.id_jogo
WHERE J.id_jogo = ?  -- Aqui será substituido pelo id do jogo escolhido.
GROUP BY J.nome_jogo;
