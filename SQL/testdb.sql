CREATE TABLE PLAYER(
    playerid int,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    sport VARCHAR(255)  
);

INSERT INTO PLAYER(playerid,firstname,lastname, sport) VALUES (1, 'ROHIT', 'NEOGI', 'CRICKET');
INSERT INTO PLAYER(playerid,firstname,lastname, sport) VALUES (2, 'SHIVAM', 'DAS', 'CRICKET');

SELECT * FROM PLAYER

DROP TABLE PLAYER;