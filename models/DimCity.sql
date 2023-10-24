{{ config(materialized='table') }}

SELECT c.CityID
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
