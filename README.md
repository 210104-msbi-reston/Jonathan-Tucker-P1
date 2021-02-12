# Device Manufacturer Database
## Project Description
The goal of this project was to design a SQL database that emulates the distribution chain of a major device manufacturer, such as Apple Inc. 

## Technologies
* Microsft SQL Server 2019
* Microsoft Visual Studio (SSDT) 2017
* Microsoft Excel 365

## Features
* Create a single product of a specific item ID.
* Create multiple products of a specific item ID.
* Create a specific quantity of every product.
* Create multiple products of a specific category or type.
* Create multiple products of a specific type and category.
* Logs every producted created in a ProductionLog.
* Each level along the distribution chain logs its own transactions.
* Use a view to check the history of every product and where along the chain it currently is.

TO-DO List:
* Refactor the procedures for moving products down the supply chain.
* Add the remaining procedures/views to the queries table.
* Scale up the amount of customers/product in the system.
* Merge the multiple procedures for item creation and distribution into fewer procedures.
* Remove hard-coded values for entity generation.

## Getting Started
* git clone "https://github.com/210104-msbi-reston/Jonathan-Tucker-P1.git
* Restore the database using the .bak filed provided.
* Alternavitvely, use the .sql file to restore the structure of the database and
  use SSIS to load the .csv files for Country, Continent, ProductionHouse, and ProductList into their respective
  tables. Then use the procedures to generate the entities along the distribution chain.

## Usage
Procedures to Generate Distribution Entities
* Generate Warehouses
  * exec proc_InitializeWarehouses
* Generate General Distributors
  * exec proc_GenerateGeneralDistributors
* Generate Sub Distributors
  * exec proc_GenerateSubDistributors
* Generate Channel Partners
  * exec proc_GenerateChannelPartners
* Generate Zones
  * exec proc_GenerateZones
* Generate Stores
  * exec proc_GenerateStores
* Generate a Customer
  * exec proc_GenerateCustomer @name nvarchar(50), @country int=null
Procedures to Generate Products
* Generate One Product of a Specific Type
  * exec proc_GenerateOneProduct @productToProduce int
* Generate Multiple Products of a Specific Product
  * exec proc_GenerateOneProductFromQuantity @productNum int, @quantity int
* Generate Products of a Specific Category
  * exec proc_GenerateProductsFromCategory @quantity int, @category nvarchar(20)
* Generate Products of a Specific Type
  * exec proc_GenerateOneProductFromQuantity @productNum int, @quantity int
* Generate Products of a Specific Category and Type
  * exec proc_GenerateProductsFromTypeCategory @quantity int, @type int, @category nvarchar(20)
* Generate Multiple Products of Every Available Product
  * exec proc_GenerateProductsFromQuantity @quantity int
## Licenses
* [SQL Server Management Studio](https://docs.microsoft.com/en-us/legal/sql/sql-server-management-studio-license-terms)
* [Microsoft SSDT](https://docs.microsoft.com/en-us/legal/sql/sql-server-data-tools-license-terms)
* [Microsoft 365](https://www.microsoft.com/en-us/Useterms/Retail/OfficeinMicrosoft365/Personal/Useterms_Retail_OfficeinMicrosoft365_Personal_English.htm)
