SELECT c.CustomerID
     , c.CustomerName
     , cc.CustomerCategoryName
     , c.AccountOpenedDate
     , c.StandardDiscountPercentage
     , c.DeliveryAddressLine1
     , c.DeliveryAddressLine2
     , c.DeliveryPostalCode
     , c.DeliveryCityID
     , c.PostalAddressLine1
     , c.PostalAddressLine2
     , c.PostalPostalCode
     , c.PostalCityID
     , c.ValidFrom
     , c.ValidTo
FROM {{ source('wideworldimporters', 'bronze_salescustomers') }} c
LEFT JOIN {{ source('wideworldimporters', 'bronze_salescustomercategories') }} cc ON c.CustomerCategoryID = cc.CustomerCategoryID