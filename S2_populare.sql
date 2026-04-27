SET DEFINE OFF;

DELETE FROM vinde_2; DELETE FROM produs_2; DELETE FROM bilet_2; DELETE FROM eveniment_2;
DELETE FROM clase_2; DELETE FROM aparat_2; DELETE FROM angajat_v2_2; DELETE FROM angajat_v1_2;
DELETE FROM departament_2; DELETE FROM sala_2; DELETE FROM adresa_2; DELETE FROM oras_2;
DELETE FROM client; DELETE FROM plan;

INSERT INTO plan (denumire_plan, pret) VALUES ('BRONZE', 100);
INSERT INTO plan (denumire_plan, pret) VALUES ('SILVER', 150);
INSERT INTO plan (denumire_plan, pret) VALUES ('GOLD', 200);
INSERT INTO plan (denumire_plan, pret) VALUES ('PLATINUM', 300);

INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (10, 'Popescu', 'Ion', 'ion.popescu@email.com', '0711111111');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (11, 'Ionescu', 'Ana', 'ana.ionescu@email.com', '0722222222');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (14, 'Bucuresteanu', 'George', 'george.b@email.com', '0744111333');

INSERT INTO oras_2 (id_oras, nume_oras, regiune) VALUES (3, 'Bucuresti', 'Muntenia');
INSERT INTO oras_2 (id_oras, nume_oras, regiune) VALUES (4, 'Ploiesti', 'Muntenia');
INSERT INTO oras_2 (id_oras, nume_oras, regiune) VALUES (8, 'Craiova', 'Muntenia');

INSERT INTO adresa_2 (id_adresa, id_oras, strada, numar) VALUES (102, 3, 'Bd. Unirii', '25');
INSERT INTO adresa_2 (id_adresa, id_oras, strada, numar) VALUES (105, 4, 'Str. Democratiei', '3');

INSERT INTO sala_2 (id_sala, nume, id_adresa, email, telefon, denumire_plan) VALUES (2, 'SpartanGym Bucuresti', 102, 'spartangym.buc@gym.ro', '021-222222', 'PLATINUM');
INSERT INTO sala_2 (id_sala, nume, id_adresa, email, telefon, denumire_plan) VALUES (5, 'SpartanGym Ploiesti', 105, 'spartangym.pl@gym.ro', '0244-555555', 'SILVER');

INSERT INTO departament_2 (id_departament, nume, salariu_minim, salariu_maxim, id_sala) VALUES (2, 'Fitness & Training', 3000, 10000, 2);

INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (2, 'Pop', 'Andrei', 'a.pop@gym.ro', '0722000002');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (2, 2, 'Instructor', 4000);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (5, 'Marin', 'Ionut', 'i.marin@gym.ro', '0722000005');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (5, 2, 'Instructor', 4200);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (8, 'Constantin', 'Dan', 'd.const@gym.ro', '0722000008');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (8, 2, 'Instructor', 4500);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (11, 'Radu', 'Mihai', 'm.radu@gym.ro', '0722000011');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (11, 2, 'Instructor', 4100);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (14, 'Stoica', 'Elena', 'e.stoica@gym.ro', '0722000014');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (14, 2, 'Instructor', 4300);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (17, 'Nistor', 'Claudiu', 'c.nist@gym.ro', '0722000017');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (17, 2, 'Instructor', 4400);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (20, 'Dima', 'Sonia', 's.dima@gym.ro', '0722000020');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (20, 2, 'Instructor', 4600);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (23, 'Lupu', 'Victor', 'v.lupu@gym.ro', '0722000023');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (23, 2, 'Instructor', 4700);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (26, 'Matei', 'Laura', 'l.matei@gym.ro', '0722000026');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (26, 2, 'Instructor', 4800);
INSERT INTO angajat_v1_2 (id_angajat, nume, prenume, email, telefon) VALUES (29, 'Enache', 'Paul', 'p.enache@gym.ro', '0722000029');
INSERT INTO angajat_v2_2 (id_angajat, id_departament, functie, salariu) VALUES (29, 2, 'Instructor', 5000);

INSERT INTO eveniment_2 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (2, 2, 'Cupa Powerlifting', SYSDATE - 10, 100);
INSERT INTO eveniment_2 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (5, 2, 'Seminar Nutritie', SYSDATE - 30, 50);

INSERT INTO bilet_2 (id_bilet, id_eveniment, pret, id_client) VALUES (2, 2, 100, 14);
INSERT INTO bilet_2 (id_bilet, id_eveniment, pret, id_client) VALUES (5, 5, 50, 11);

INSERT INTO aparat_2 (id_aparat, marca, denumire, data_productie, grupa_musculara, id_sala) 
VALUES (2, 'Matrix', 'Presa Picioare', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'Picioare', 2);

INSERT INTO produs_2 (id_produs, denumire, categorie, pret, data_expirare, id_sala, id_client) 
VALUES (2, 'Creatina', 'Suplimente', 110, TO_DATE('2026-06-01', 'YYYY-MM-DD'), 2, 14);

INSERT INTO vinde_2 (id_sala, id_abonament) VALUES (2, 1003);

COMMIT;