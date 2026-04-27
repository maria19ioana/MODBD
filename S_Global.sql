CREATE DATABASE LINK link_s1 
CONNECT TO s1_transilvania IDENTIFIED BY parola123 
USING 'localhost:1521/orcl.local';

CREATE DATABASE LINK link_s2 
CONNECT TO s2_muntenia IDENTIFIED BY parola123 
USING 'localhost:1521/orcl.local';

CREATE DATABASE LINK link_s3 
CONNECT TO s3_moldova IDENTIFIED BY parola123 
USING 'localhost:1521/orcl.local';

CREATE OR REPLACE VIEW oras_global AS
SELECT * FROM oras_1@link_s1
UNION ALL
SELECT * FROM oras_2@link_s2
UNION ALL
SELECT * FROM oras_3@link_s3;

CREATE OR REPLACE VIEW sala_global AS
SELECT * FROM sala_1@link_s1
UNION ALL
SELECT * FROM sala_2@link_s2
UNION ALL
SELECT * FROM sala_3@link_s3;

CREATE OR REPLACE VIEW eveniment_global AS
SELECT * FROM eveniment_1@link_s1
UNION ALL
SELECT * FROM eveniment_2@link_s2
UNION ALL
SELECT * FROM eveniment_3@link_s3;

CREATE OR REPLACE VIEW angajat_global AS
SELECT v1.id_angajat, v1.nume, v1.prenume, v1.email, v1.telefon, v2.functie, v2.salariu, v2.id_departament
FROM angajat_v1_1@link_s1 v1 JOIN angajat_v2_1@link_s1 v2 ON v1.id_angajat = v2.id_angajat
UNION ALL
SELECT v1.id_angajat, v1.nume, v1.prenume, v1.email, v1.telefon, v2.functie, v2.salariu, v2.id_departament
FROM angajat_v1_2@link_s2 v1 JOIN angajat_v2_2@link_s2 v2 ON v1.id_angajat = v2.id_angajat
UNION ALL
SELECT v1.id_angajat, v1.nume, v1.prenume, v1.email, v1.telefon, v2.functie, v2.salariu, v2.id_departament
FROM angajat_v1_3@link_s3 v1 JOIN angajat_v2_3@link_s3 v2 ON v1.id_angajat = v2.id_angajat;

CREATE TABLE abonament_global (
    id_abonament NUMBER PRIMARY KEY,
    id_client NUMBER NOT NULL,
    denumire_plan VARCHAR2(50) NOT NULL,
    data_start DATE DEFAULT SYSDATE,
    data_sfarsit DATE,
    CONSTRAINT ck_data_abonament CHECK (data_sfarsit > data_start)
);

INSERT INTO abonament_global VALUES (1001, 10, 'GOLD', SYSDATE-30, SYSDATE+30);
INSERT INTO abonament_global VALUES (1002, 11, 'BRONZE', SYSDATE-10, SYSDATE+20);
COMMIT;



SELECT * FROM angajat_global;