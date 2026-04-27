SET DEFINE OFF; 

DELETE FROM vinde_3; DELETE FROM produs_3; DELETE FROM bilet_3; DELETE FROM eveniment_3;
DELETE FROM clase_3; DELETE FROM aparat_3; DELETE FROM angajat_v2_3; DELETE FROM angajat_v1_3;
DELETE FROM departament_3; DELETE FROM sala_3; DELETE FROM adresa_3; DELETE FROM oras_3;
DELETE FROM client; DELETE FROM plan;

INSERT INTO plan (denumire_plan, pret) VALUES ('BRONZE', 100);
INSERT INTO plan (denumire_plan, pret) VALUES ('SILVER', 150);
INSERT INTO plan (denumire_plan, pret) VALUES ('GOLD', 200);
INSERT INTO plan (denumire_plan, pret) VALUES ('PLATINUM', 300);

INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (10, 'Popescu', 'Ion', 'ion.popescu@email.com', '0711111111');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (11, 'Ionescu', 'Ana', 'ana.ionescu@email.com', '0722222222');
INSERT INTO client (id_client, nume, prenume, email, telefon) VALUES (15, 'Moldoveanu', 'Raluca', 'raluca.m@email.com', '0755999888');

INSERT INTO oras_3 (id_oras, nume_oras, regiune) VALUES (5, 'Iasi', 'Moldova');
INSERT INTO oras_3 (id_oras, nume_oras, regiune) VALUES (6, 'Suceava', 'Moldova');
INSERT INTO oras_3 (id_oras, nume_oras, regiune) VALUES (9, 'Bacau', 'Moldova');

INSERT INTO adresa_3 (id_adresa, id_oras, strada, numar) VALUES (103, 5, 'Str. Vinului', '7');
INSERT INTO adresa_3 (id_adresa, id_oras, strada, numar) VALUES (106, 6, 'Str. Albinelor', '12');

INSERT INTO sala_3 (id_sala, nume, id_adresa, email, telefon, denumire_plan) VALUES (3, 'MoldovaGym Iasi', 103, 'moldovagym.is@gym.ro', '0232-333333', 'BRONZE');
INSERT INTO sala_3 (id_sala, nume, id_adresa, email, telefon, denumire_plan) VALUES (6, 'MoldovaGym Suceava', 106, 'moldovagym.sv@gym.ro', '0230-666666', 'GOLD');

INSERT INTO departament_3 (id_departament, nume, salariu_minim, salariu_maxim, id_sala) VALUES (3, 'Sales & Training', 2500, 8500, 3);

INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (3, 'Radu', 'Mihai', 'm.radu@gym.ro', '0755000003');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (3, 3, 'Instructor', 3800);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (6, 'Lungu', 'Bogdan', 'b.lungu@gym.ro', '0755000006');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (6, 3, 'Instructor', 3900);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (9, 'Istrate', 'Alina', 'a.ist@gym.ro', '0755000009');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (9, 3, 'Sales Manager', 5000);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (12, 'Sandu', 'Vasile', 'v.sandu@gym.ro', '0755000012');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (12, 3, 'Instructor', 3700);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (15, 'Miron', 'Ioana', 'i.miron@gym.ro', '0755000015');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (15, 3, 'Instructor', 4000);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (18, 'Pavel', 'Dan', 'd.pavel@gym.ro', '0755000018');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (18, 3, 'Instructor', 4100);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (21, 'Rusu', 'Cristina', 'c.rusu@gym.ro', '0755000021');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (21, 3, 'Instructor', 4200);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (24, 'Nica', 'Andrei', 'a.nica@gym.ro', '0755000024');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (24, 3, 'Instructor', 4300);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (27, 'Rotaru', 'Stefan', 's.rot@gym.ro', '0755000027');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (27, 3, 'Instructor', 4400);
INSERT INTO angajat_v1_3 (id_angajat, nume, prenume, email, telefon) VALUES (30, 'Gabor', 'Monica', 'm.gabor@gym.ro', '0755000030');
INSERT INTO angajat_v2_3 (id_angajat, id_departament, functie, salariu) VALUES (30, 3, 'Instructor', 4500);

INSERT INTO eveniment_3 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (3, 3, 'Campionat Crossfit', SYSDATE - 5, 200);
INSERT INTO eveniment_3 (id_eveniment, id_sala, nume, data, numar_bilete) 
VALUES (6, 3, 'Gala Box Moldova', SYSDATE - 25, 150);

INSERT INTO bilet_3 (id_bilet, id_eveniment, pret, id_client) VALUES (3, 3, 75, 10);
INSERT INTO bilet_3 (id_bilet, id_eveniment, pret, id_client) VALUES (6, 6, 120, 15);

INSERT INTO aparat_3 (id_aparat, marca, denumire, data_productie, grupa_musculara, id_sala) 
VALUES (3, 'LifeFitness', 'Aparat Ramat', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Spate', 3);

INSERT INTO vinde_3 (id_sala, id_abonament) VALUES (3, 1005);

COMMIT;