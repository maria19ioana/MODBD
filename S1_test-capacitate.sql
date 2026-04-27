INSERT INTO eveniment_1 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (999, 1, 'Test Sold Out', SYSDATE + 10, 1);
COMMIT;

INSERT INTO bilet_1 (id_bilet, id_eveniment, pret, id_client) 
VALUES (9991, 999, 50, 10);
COMMIT;

INSERT INTO bilet_1 (id_bilet, id_eveniment, pret, id_client) 
VALUES (9992, 999, 50, 11);