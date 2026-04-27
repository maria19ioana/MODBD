CREATE OR REPLACE VIEW client_global AS
SELECT * FROM client@link_s1;

CREATE OR REPLACE TRIGGER trg_sincronizare_client
INSTEAD OF INSERT ON client_global
FOR EACH ROW
BEGIN
    INSERT INTO client@link_s1 (id_client, nume, prenume, email, telefon)
    VALUES (:NEW.id_client, :NEW.nume, :NEW.prenume, :NEW.email, :NEW.telefon);

    INSERT INTO client@link_s2 (id_client, nume, prenume, email, telefon)
    VALUES (:NEW.id_client, :NEW.nume, :NEW.prenume, :NEW.email, :NEW.telefon);

    INSERT INTO client@link_s3 (id_client, nume, prenume, email, telefon)
    VALUES (:NEW.id_client, :NEW.nume, :NEW.prenume, :NEW.email, :NEW.telefon);
END;
/

INSERT INTO client_global (id_client, nume, prenume, email, telefon)
VALUES (50, 'Distributit', 'Test', 'test.distribuit@gym.ro', '0700000000');
COMMIT;

