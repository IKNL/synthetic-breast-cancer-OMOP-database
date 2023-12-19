INSERT INTO omopcdm_synthetic.observation_period
(
  person_id
  , observation_period_start_date
  , observation_period_end_date
  , period_type_concept_id
)
SELECT
  p.person_id AS person_id
  , CASE 
      WHEN p.year_of_birth >= 1993
      THEN p.birth_datetime
	  ELSE MAKE_DATE(1993, 1, 1)
	END	AS observation_period_start_date
  , MAKE_DATE(d.incjr, 1, 1) + vit_stat_int AS observation_period_end_date
  , 32879 AS period_type_concept_id
  FROM omopcdm_synthetic.person p
  JOIN omopcdm_synthetic.data d 
    ON d.key_nkr = p.person_source_value