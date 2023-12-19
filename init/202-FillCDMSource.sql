INSERT INTO omopcdm_synthetic.cdm_source
(
      cdm_source_name
    , cdm_source_abbreviation
    , cdm_holder
    , source_description
    , source_documentation_reference
    , cdm_etl_reference
    , source_release_date
    , cdm_release_date
    , cdm_version
	, cdm_version_concept_id
    , vocabulary_version
)
SELECT 
    'Synthetic Data Set from Netherlands Cancer Registry' AS cdm_source_name
    , 'NCR_synthetic' AS cdm_source_abbreviation
    , 'IKNL' AS cdm_holder
    , NULL AS source_description
    , NULL AS source_documentation_reference
    , NULL AS cdm_etl_reference
    , MAKE_DATE(2023, 3, 10) AS source_release_date
    , CURRENT_DATE AS cdm_release_date
    , '5.4.0' AS cdm_version
	, 756265 AS cdm_version_concept_id
    , 'v5.0' AS vocabulary_version