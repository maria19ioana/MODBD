SET DEFINE OFF;

DELETE FROM vinde_1; DELETE FROM produs_1; DELETE FROM bilet_1; DELETE FROM eveniment_1;
DELETE FROM clase_1; DELETE FROM aparat_1; DELETE FROM angajat_v2_1; DELETE FROM angajat_v1_1;
DELETE FROM departament_1; DELETE FROM sala_1; DELETE FROM adresa_1; DELETE FROM oras_1;
DELETE FROM client; DELETE FROM plan;

INSERT INTO plan (denumire_plan, pret) VALUES ('BRONZE', 100);
INSERT INTO plan (denumire_plan, pret) VALUES ('SILVER', 150);
INSERT INTO plan (denumire_plan, pret) VALUES ('GOLD', 200);
INSERT INTO plan (denumire_plan, pret) VALUES ('PLATINUM', 300);

INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (10, 'Popescu', 'Ion', 'ion.popescu@email.com', '0711111111');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (11, 'Ionescu', 'Ana', 'ana.ionescu@email.com', '0722222222');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (12, 'Ardeleanu', 'Mihai', 'mihai.a@email.com', '0733111222');

INSERT INTO oras_1 (id_oras, nume_oras, regiune) VALUES (1, 'Cluj-Napoca', 'Transilvania');
INSERT INTO oras_1 (id_oras, nume_oras, regiune) VALUES (2, 'Brasov', 'Transilvania');
INSERT INTO oras_1 (id_oras, nume_oras, regiune) VALUES (7, 'Sibiu', 'Transilvania');

INSERT INTO adresa_1 (id_adresa, id_oras, strada, numar) VALUES (101, 1, 'Str. Dorneasca', '15');
INSERT INTO sala_1 (id_sala, nume, id_adresa, email, telefon, denumire_plan) VALUES (1, 'NoGym Cluj', 101, 'nogym.cj@gym.ro', '0264-111111', 'GOLD');

INSERT INTO departament_1 (id_departament, nume, salariu_minim, salariu_maxim, id_sala) VALUES (1, 'Management & Training', 3000, 9000, 1);

INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (1, 'Vasile', 'Dan', 'd.vasile@gym.ro', '0733000001');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (1, 1, 'Manager', 6000);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (4, 'Munteanu', 'Elena', 'e.munt@gym.ro', '0733000004');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (4, 1, 'Instructor', 4500);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (7, 'Popa', 'Anca', 'a.popa@gym.ro', '0733000007');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (7, 1, 'Instructor', 4200);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (10, 'Dan', 'Radu', 'r.dan@gym.ro', '0733000010');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (10, 1, 'Instructor', 4100);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (13, 'Lupu', 'Andrei', 'a.lupu@gym.ro', '0733000013');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (13, 1, 'Instructor', 4300);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (16, 'Matei', 'Cosmin', 'c.matei@gym.ro', '0733000016');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (16, 1, 'Instructor', 4400);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (19, 'Nistor', 'Laura', 'l.nist@gym.ro', '0733000019');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (19, 1, 'Instructor', 4600);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (22, 'Sandu', 'Mihai', 'm.sandu@gym.ro', '0733000022');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (22, 1, 'Instructor', 4700);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (25, 'Stoica', 'Alina', 'a.stoic@gym.ro', '0733000025');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (25, 1, 'Instructor', 4800);
INSERT INTO angajat_v1_1 (id_angajat, nume, prenume, email, telefon) VALUES (28, 'Enache', 'Vlad', 'v.enache@gym.ro', '0733000028');
INSERT INTO angajat_v2_1 (id_angajat, id_departament, functie, salariu) VALUES (28, 1, 'Instructor', 5000);

INSERT INTO eveniment_1 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (1, 1, 'Maraton Cycling', SYSDATE - 15, 50);
INSERT INTO eveniment_1 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (4, 1, 'Workshop Nutritie', SYSDATE - 45, 30);

INSERT INTO bilet_1 (id_bilet, id_eveniment, pret, id_client) VALUES (1, 1, 60, 10);
INSERT INTO bilet_1 (id_bilet, id_eveniment, pret, id_client) VALUES (4, 4, 40, 11);

INSERT INTO vinde_1 (id_sala, id_abonament) VALUES (1, 1001);

COMMIT;

SELECT * FROM oras_1;