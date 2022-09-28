/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/

{{ config(materialized='table') }} 

with source_data as (
    SELECT _airbyte_data -> 'Id' AS Id,
        _airbyte_data -> 'Code' AS Code,
         _airbyte_data -> 'Name' AS Name,
          _airbyte_data -> 'IsCash' AS IsCash,
           _airbyte_data -> 'Prefix' AS Prefix,
           _airbyte_data -> 'Inactive' AS Inactive,
            _airbyte_data -> 'Description' AS Description
    FROM _airbyte_raw_acc_account;
)

select "Id", "Name"
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
