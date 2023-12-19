INSERT INTO omopcdm_synthetic.death
(
	person_id
  , death_date
  , death_datetime
  , death_type_concept_id
  , cause_concept_id
  , cause_source_value
  , cause_source_concept_id
)
SELECT
	p.person_id AS person_id
  , MAKE_DATE(d.incjr, 1, 1) + vit_stat_int AS death_date
  , MAKE_DATE(d.incjr, 1, 1) + vit_stat_int AS death_datetime
  , NULL AS death_type_concept_id
  , NULL AS cause_concept_id
  , NULL AS cause_source_value
  , NULL AS cause_source_concept_id
  FROM omopcdm_synthetic.data AS d
  JOIN omopcdm_synthetic.person AS p
    ON p.person_source_value = d.key_nkr
  WHERE d.vit_stat = 1

