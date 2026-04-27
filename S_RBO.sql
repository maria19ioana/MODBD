WITH LocalStats AS (
    SELECT /*+ RULE */ 'Transilvania' AS regiune, s.nume AS nume_sala, o.nume_oras,
           COUNT(DISTINCT e.id_eveniment) AS nr_evenimente,
           COUNT(b.id_bilet) AS total_bilete,
           SUM(b.pret) AS venit_total,
           (SELECT COUNT(a.id_angajat) 
            FROM departament_1@link_s1 d 
            JOIN angajat_v2_1@link_s1 a ON d.id_departament = a.id_departament 
            WHERE d.id_sala = s.id_sala) AS total_angajati
    FROM oras_1@link_s1 o
    JOIN adresa_1@link_s1 ad ON o.id_oras = ad.id_oras
    JOIN sala_1@link_s1 s ON ad.id_adresa = s.id_adresa
    JOIN eveniment_1@link_s1 e ON s.id_sala = e.id_sala
    JOIN bilet_1@link_s1 b ON e.id_eveniment = b.id_eveniment
    WHERE e.data >= SYSDATE - 90
    GROUP BY s.id_sala, s.nume, o.nume_oras

    UNION ALL

    SELECT /*+ RULE */ 'Muntenia' AS regiune, s.nume AS nume_sala, o.nume_oras,
           COUNT(DISTINCT e.id_eveniment) AS nr_evenimente,
           COUNT(b.id_bilet) AS total_bilete,
           SUM(b.pret) AS venit_total,
           (SELECT COUNT(a.id_angajat) 
            FROM departament_2@link_s2 d 
            JOIN angajat_v2_2@link_s2 a ON d.id_departament = a.id_departament 
            WHERE d.id_sala = s.id_sala) AS total_angajati
    FROM oras_2@link_s2 o
    JOIN adresa_2@link_s2 ad ON o.id_oras = ad.id_oras
    JOIN sala_2@link_s2 s ON ad.id_adresa = s.id_adresa
    JOIN eveniment_2@link_s2 e ON s.id_sala = e.id_sala
    JOIN bilet_2@link_s2 b ON e.id_eveniment = b.id_eveniment
    WHERE e.data >= SYSDATE - 90
    GROUP BY s.id_sala, s.nume, o.nume_oras

    UNION ALL

    SELECT /*+ RULE */ 'Moldova' AS regiune, s.nume AS nume_sala, o.nume_oras,
           COUNT(DISTINCT e.id_eveniment) AS nr_evenimente,
           COUNT(b.id_bilet) AS total_bilete,
           SUM(b.pret) AS venit_total,
           (SELECT COUNT(a.id_angajat) 
            FROM departament_3@link_s3 d 
            JOIN angajat_v2_3@link_s3 a ON d.id_departament = a.id_departament 
            WHERE d.id_sala = s.id_sala) AS total_angajati
    FROM oras_3@link_s3 o
    JOIN adresa_3@link_s3 ad ON o.id_oras = ad.id_oras
    JOIN sala_3@link_s3 s ON ad.id_adresa = s.id_adresa
    JOIN eveniment_3@link_s3 e ON s.id_sala = e.id_sala
    JOIN bilet_3@link_s3 b ON e.id_eveniment = b.id_eveniment
    WHERE e.data >= SYSDATE - 90
    GROUP BY s.id_sala, s.nume, o.nume_oras
),
FilteredStats AS (
    SELECT ls.*, ROW_NUMBER() OVER(PARTITION BY regiune ORDER BY venit_total DESC) as rnk
    FROM LocalStats ls
    WHERE nr_evenimente >= 2 AND total_angajati >= 10
)
SELECT regiune, nume_sala, nume_oras, nr_evenimente, total_bilete, venit_total, total_angajati
FROM FilteredStats
WHERE rnk = 1;