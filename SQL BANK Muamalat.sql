select * From [dataset_task 5(orders)]
select * From [dataset_task 5(product category)]
select * From [dataset_task 5(dataset_task 5)]
select * From [dataset_task 5(customers)]

ALTER TABLE [dbo].[dataset_task 5(orders)] ALTER COLUMN OrderID INT NOT NULL;
ALTER TABLE [dbo].[dataset_task 5(orders)] ADD CONSTRAINT PK_Orders PRIMARY KEY (OrderID);

ALTER TABLE [dbo].[dataset_task 5(dataset_task 5)] ALTER COLUMN [ProdNumber] NVARCHAR(50) NOT NULL;
ALTER TABLE [dbo].[dataset_task 5(dataset_task 5)] ADD CONSTRAINT PK_ProductList PRIMARY KEY ([ProdNumber]);

SELECT 
    ord.[Date] AS order_date,
    cat.[CategoryName] AS category_name,
    prod.[ProdName] AS product_name,
    prod.[Price] AS product_price,
    ord.[Quantity] AS order_qty,
    (ord.[Quantity] * prod.[Price]) AS total_sales, -- Menghitung total sales [cite: 42]
    cust.[CustomerEmail] AS cust_email,
    cust.[CustomerCity] AS cust_city
FROM [dbo].[dataset_task 5(orders)] AS ord
LEFT JOIN [dbo].[dataset_task 5(customers)] AS cust 
    ON ord.[CustomerID] = cust.[CustomerID]
LEFT JOIN [dbo].[dataset_task 5(dataset_task 5)] AS prod 
    ON ord.[ProdNumber] = prod.[ProdNumber]
LEFT JOIN [dbo].[dataset_task 5(product category)] AS cat 
    ON prod.[Category] = CAST(cat.[CategoryID] AS NVARCHAR(255))
ORDER BY ord.[Date] ASC; -- Urutkan paling awal ke akhir [cite: 43]

SELECT 
    ord.[Date] AS order_date,
    cat.[CategoryName] AS category_name,
    prod.[ProdName] AS product_name,
    prod.[Price] AS product_price,
    ord.[Quantity] AS order_qty,
    (ord.[Quantity] * prod.[Price]) AS total_sales, -- Menghitung total sales [cite: 42]
    cust.[CustomerEmail] AS cust_email,
    cust.[CustomerCity] AS cust_city
FROM [dbo].[dataset_task 5(orders)] AS ord
LEFT JOIN [dbo].[dataset_task 5(customers)] AS cust 
    ON ord.[CustomerID] = cust.[CustomerID]
LEFT JOIN [dbo].[dataset_task 5(dataset_task 5)] AS prod 
    ON ord.[ProdNumber] = prod.[ProdNumber]
LEFT JOIN [dbo].[dataset_task 5(product category)] AS cat 
    ON prod.[Category] = CAST(cat.[CategoryID] AS NVARCHAR(255))
ORDER BY ord.[Date] ASC; -- Urutkan berdasarkan tanggal paling awal