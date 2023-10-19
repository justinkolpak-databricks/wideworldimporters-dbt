{{ config(materialized='table') }}


SELECT il.InvoiceLineId
    , i.InvoiceID
    , i.InvoiceDate
    , o.OrderID
    , o.OrderDate
    , o.CustomerID
    , si.StockItemID
    , si.StockItemName
    , il.Quantity
    , il.UnitPrice
    , il.TaxRate
    , il.TaxAmount
    , il.LineProfit
    , il.ExtendedPrice
FROM {{ source('wideworldimporters', 'bronze_salesinvoicelines') }} il
LEFT JOIN {{ source('wideworldimporters', 'bronze_salesinvoices') }} i ON il.InvoiceID = i.InvoiceID
LEFT JOIN {{ source('wideworldimporters', 'bronze_salesorders') }} o ON i.OrderID = o.OrderID
LEFT JOIN {{ source('wideworldimporters', 'bronze_warehousestockitems') }}  si ON il.StockItemID = si.StockItemID
