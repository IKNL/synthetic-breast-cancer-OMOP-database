WITH CTE_EOCIDstep2 AS
(
  SELECT
    d.key_nkr AS key_nkr
	, CONCAT(d.morf,'/',d.gedrag,'-',d.topo,'.',SUBSTRING(d.topo_sublok,4,1)) AS ConceptCode
    , MAKE_DATE(d.incjr, 1, 1) AS StartDate
	, MAKE_DATE(d.incjr, 1, 1) + vit_stat_int AS EndDate
    FROM omopcdm_synthetic.data AS d
),
CTE_Concepts AS
(
  SELECT
    c.concept_code AS source_concept_code
    , CR.concept_id_2 AS concept_id
	FROM  omopcdm_synthetic.concept AS c
    JOIN omopcdm_synthetic.concept_relationship AS CR
      ON CR.concept_id_1 = c.concept_id
	WHERE c.vocabulary_id IN ('ICDO3', 'eH Client') AND CR.relationship_id = 'Maps to'
),
CTE_EOCIDstep3 AS
(
  SELECT
    CTE_E2.key_nkr AS key_nkr
	, CASE
        WHEN CTE_C.concept_id IS NULL THEN 0
        ELSE CTE_C.concept_id
      END AS ConceptID
	, CTE_E2.ConceptCode AS ConceptCode
    , CTE_E2.StartDate AS StartDate
    , CTE_E2.EndDate AS EndDate
    FROM CTE_EOCIDstep2 AS CTE_E2
	LEFT JOIN CTE_Concepts AS CTE_C
	  ON CTE_C.source_concept_code = CTE_E2.ConceptCode
)

INSERT INTO omopcdm_synthetic.episode
(
  person_id
  , episode_concept_id
  , episode_start_date
  , episode_start_datetime
  , episode_end_date
  , episode_end_datetime
  , episode_parent_id
  , episode_number
  , episode_object_concept_id
  , episode_type_concept_id
  , episode_source_value
  , episode_source_concept_id
  , episode_source_iknl
)
SELECT 
  p.person_id AS person_id
  , 32533 AS episode_concept_id
  , CTE_E3.StartDate AS episode_start_date
  , CTE_E3.StartDate AS episode_start_datetime
  , CTE_E3.EndDate AS episode_end_date
  , CTE_E3.EndDate AS episode_end_datetime
  , NULL AS episode_parent_id
  , NULL AS episode_number
  , CTE_E3.ConceptID AS episode_object_concept_id
  , 32879 AS episode_type_concept_id
  , CTE_E3.ConceptCode AS episode_source_value
  , NULL AS episode_source_concept_id
  , NULL AS episode_source_iknl
  FROM CTE_EOCIDstep3 AS CTE_E3
  JOIN omopcdm_synthetic.person p
  ON p.person_source_value = CTE_E3.key_nkr