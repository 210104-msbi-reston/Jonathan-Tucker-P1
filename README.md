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

## Getting Started
* git clone "https://github.com/210104-msbi-reston/Jonathan-Tucker-P1.git
* Restore the database using the .bak filed provided.
* Alternavitvely, use the .sql file to restore the structure of the database and
  use SSIS to load the .csv files for Country, Continent, and ProductList into their respective
  tables. Then use the procedures to generate the entities along the distribution chain.

## Usage
Procedures to Generate Distribution Entities
* Generate Warehouses
  * exec proc_InitializeWarehouses
