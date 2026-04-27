CREATE OR REPLACE TRIGGER trg_verificare_abonament
BEFORE INSERT OR UPDATE ON abonament_global
FOR EACH ROW
DECLARE
    v_suprapuneri NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_suprapuneri
    FROM abonament_global
    WHERE id_client = :NEW.id_client
      AND (
           (:NEW.data_start BETWEEN data_start AND data_sfarsit) OR
           (:NEW.data_sfarsit BETWEEN data_start AND data_sfarsit) OR
           (data_start BETWEEN :NEW.data_start AND :NEW.data_sfarsit)
          );

    IF v_suprapuneri > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Eroare: Clientul are deja un abonament activ care se suprapune cu aceasta perioada!');
    END IF;
END;
/

