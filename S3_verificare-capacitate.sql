CREATE OR REPLACE TRIGGER trg_capacitate_bilet_3
BEFORE INSERT ON bilet_3
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION; 
    v_capacitate_maxima NUMBER;
    v_bilete_vandute NUMBER;
BEGIN
    SELECT numar_bilete INTO v_capacitate_maxima 
    FROM eveniment_3 
    WHERE id_eveniment = :NEW.id_eveniment;

    SELECT COUNT(*) INTO v_bilete_vandute 
    FROM bilet_3 
    WHERE id_eveniment = :NEW.id_eveniment;

    IF v_bilete_vandute >= v_capacitate_maxima THEN
        RAISE_APPLICATION_ERROR(-20002, 'Eroare: Ne pare rau, dar evenimentul este SOLD OUT!');
    END IF;
    
    COMMIT; 
END;
/