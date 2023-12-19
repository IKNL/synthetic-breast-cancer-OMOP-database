INSERT INTO omopcdm_synthetic.person
(
	gender_concept_id
  , year_of_birth
  , month_of_birth
  , day_of_birth
  , birth_datetime
  , race_concept_id
  , ethnicity_concept_id
  , location_id
  , provider_id
  , care_site_id
  , person_source_value
  , gender_source_value
  , gender_source_concept_id
  , race_source_value
  , race_source_concept_id
  , ethnicity_source_value
  , ethnicity_source_concept_id
)
SELECT
  CASE
    WHEN d.gesl = 1 then 8507
	ELSE 8532
  END AS gender_concept_id
  , d.incjr-leeft AS year_of_birth
  , NULL AS month_of_birth
  , NULL AS day_of_birth
  , MAKE_DATE(d.incjr-leeft, 6, 15) AS birth_datetime
  , 0 AS race_concept_id
  , 0 AS ethnicity_concept_id
  , NULL AS location_id
  , NULL AS provider_id
  , NULL AS care_site_id
  , d.key_nkr AS person_source_value
  , d.gesl  AS gender_source_value
  , NULL AS gender_source_concept_id
  , NULL AS race_source_value
  , NULL AS race_source_concept_id
  , NULL AS ethnicity_source_value
  , NULL AS ethnicity_source_concept_id
  FROM omopcdm_synthetic.data d