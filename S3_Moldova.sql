CREATE TABLE plan ( denumire_plan VARCHAR2(50) PRIMARY KEY, pret NUMBER(6,2) CHECK (pret > 0) );
CREATE TABLE client ( id_client NUMBER PRIMARY KEY, nume VARCHAR2(50) NOT NULL, prenume VARCHAR2(50) NOT NULL, email VARCHAR2(100) NOT NULL UNIQUE CHECK (email LIKE '%@%.%'), telefon VARCHAR2(20) );
CREATE TABLE oras_3 ( id_oras NUMBER PRIMARY KEY, nume_oras VARCHAR2(100) NOT NULL, regiune VARCHAR2(50) CHECK (regiune = 'Moldova') );

CREATE TABLE adresa_3 (
    id_adresa NUMBER PRIMARY KEY,
    id_oras NUMBER NOT NULL,
    strada VARCHAR2(100) NOT NULL,
    numar VARCHAR2(20),
    CONSTRAINT fk_adresa_oras_3 FOREIGN KEY (id_oras) REFERENCES oras_3(id_oras)
);

CREATE TABLE sala_3 (
    id_sala NUMBER PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL,
    id_adresa NUMBER NOT NULL,
    email VARCHAR2(100) CHECK (email LIKE '%@%.%'),
    telefon VARCHAR2(20) NOT NULL,
    denumire_plan VARCHAR2(50),
    CONSTRAINT fk_sala_adresa_3 FOREIGN KEY (id_adresa) REFERENCES adresa_3(id_adresa),
    CONSTRAINT fk_sala_plan_3 FOREIGN KEY (denumire_plan) REFERENCES plan(denumire_plan)
);

CREATE TABLE departament_3 (
    id_departament NUMBER PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL,
    salariu_minim NUMBER(8,2) NOT NULL CHECK (salariu_minim > 0),
    salariu_maxim NUMBER(8,2) NOT NULL,
    id_sala NUMBER NOT NULL,
    CONSTRAINT fk_dep_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala),
    CONSTRAINT ck_sal_max_min_3 CHECK (salariu_maxim > salariu_minim)
);

CREATE TABLE angajat_v1_3 ( id_angajat NUMBER PRIMARY KEY, nume VARCHAR2(50) NOT NULL, prenume VARCHAR2(50) NOT NULL, email VARCHAR2(100) NOT NULL CHECK (email LIKE '%@%.%'), telefon VARCHAR2(20) );
CREATE TABLE angajat_v2_3 ( id_angajat NUMBER PRIMARY KEY, id_departament NUMBER NOT NULL, functie VARCHAR2(50) NOT NULL, salariu NUMBER(8,2) NOT NULL CHECK (salariu > 0), CONSTRAINT fk_ang2_ang1_3 FOREIGN KEY (id_angajat) REFERENCES angajat_v1_3(id_angajat), CONSTRAINT fk_ang_dep_3 FOREIGN KEY (id_departament) REFERENCES departament_3(id_departament) );

CREATE TABLE aparat_3 (
    id_aparat NUMBER PRIMARY KEY,
    marca VARCHAR2(50),
    denumire VARCHAR2(100) NOT NULL,
    data_productie DATE,
    grupa_musculara VARCHAR2(50),
    id_sala NUMBER NOT NULL,
    CONSTRAINT fk_aparat_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala)
);

CREATE OR REPLACE TRIGGER trg_check_data_prod_3
BEFORE INSERT OR UPDATE ON aparat_3
FOR EACH ROW
BEGIN
    IF :NEW.data_productie > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data de productie nu poate fi in viitor.');
    END IF;
END;
/

CREATE TABLE clase_3 ( id_clasa NUMBER PRIMARY KEY, denumire VARCHAR2(100) NOT NULL, categorie VARCHAR2(50), id_sala NUMBER NOT NULL, CONSTRAINT fk_clase_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala) );
CREATE TABLE eveniment_3 ( id_eveniment NUMBER PRIMARY KEY, id_sala NUMBER NOT NULL, nume VARCHAR2(100) NOT NULL, data DATE, numar_bilete NUMBER CHECK (numar_bilete > 0), CONSTRAINT fk_ev_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala) );
CREATE TABLE bilet_3 ( id_bilet NUMBER PRIMARY KEY, id_eveniment NUMBER NOT NULL, pret NUMBER(6,2) CHECK (pret > 0), id_client NUMBER NOT NULL, CONSTRAINT fk_bilet_ev_3 FOREIGN KEY (id_eveniment) REFERENCES eveniment_3(id_eveniment), CONSTRAINT fk_bilet_client_3 FOREIGN KEY (id_client) REFERENCES client(id_client) );
CREATE TABLE produs_3 ( id_produs NUMBER PRIMARY KEY, denumire VARCHAR2(100) NOT NULL, categorie VARCHAR2(50), pret NUMBER(6,2) CHECK (pret > 0), data_expirare DATE, id_sala NUMBER NOT NULL, id_client NUMBER, CONSTRAINT fk_prod_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala), CONSTRAINT fk_prod_client_3 FOREIGN KEY (id_client) REFERENCES client(id_client) );
CREATE TABLE vinde_3 ( id_sala NUMBER NOT NULL, id_abonament NUMBER NOT NULL, CONSTRAINT fk_vinde_sala_3 FOREIGN KEY (id_sala) REFERENCES sala_3(id_sala) );