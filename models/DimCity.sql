
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

SELECT c.CityId
    , c.CityName
    , sp.StateProvinceName
    , sp.SalesTerritory
    , co.CountryName
    , co.Subregion
    , co.Region
    , co.Continent
    , c.LatestRecordedPopulation
    , c.ValidFrom
    , c.ValidTo
FROM {{ source('wideworldimporters', 'bronze_applicationcities') }} c 
LEFT JOIN {{ source('wideworldimporters', 'bronze_applicationstateprovinces') }} sp ON c.StateProvinceID = sp.StateProvinceID
LEFT JOIN {{ source('wideworldimporters', 'bronze_applicationcountries') }} co ON sp.CountryID = co.CountryID
