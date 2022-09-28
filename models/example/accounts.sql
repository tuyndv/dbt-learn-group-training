/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/

{{ config(materialized='table') }} 

with source_data as (
     SELECT _airbyte_data ->> 'Id' AS id,
        _airbyte_data ->> 'Code' AS code,
         _airbyte_data ->> 'Name' AS name,
          _airbyte_data ->> 'IsCash' AS iscash,
           _airbyte_data ->> 'Prefix' AS prefix,
           _airbyte_data ->> 'Inactive' AS inactive,
            _airbyte_data ->> 'Description' AS description
FROM _airbyte_raw_acc_account
)

select id, code, name
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
