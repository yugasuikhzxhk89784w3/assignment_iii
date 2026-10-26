# Pharmacy Database System – Assignment III

**Student Name:** Osman Sayed Anwer 
**Registration Number:** 202513193
**Course / Module:** SQL Databases

---

## 1. Business Idea & System Overview

### Overview
This project models a relational database management system designed for a pharmacy retail and distribution business. The core objective is to efficiently manage supplier relationships, pharmaceutical inventory levels, pricing structures, and daily sales transactions. The system ensures data integrity through relational constraints, supports dynamic inventory modifications, and provides analytical retrieval capabilities for operational reporting.

### Core Entities
* **Suppliers:** Manages details of pharmaceutical manufacturing and distribution companies providing medical stock to the pharmacy.
* **Medicines:** Stores individual product records, including category classification, unit pricing, current stock levels, and associated suppliers.
* **Sales:** Tracks customer sales transactions, recording quantities sold, transaction dates, and total calculated revenue per order.

---

## 2. Table Structures & Schema Rules

The database consists of three primary interconnected tables enforcing strict relational constraints:

* **`suppliers`**
  * `supplier_id` (SERIAL, Primary Key): Unique identifier for each supplier.
  * `supplier_name` (VARCHAR, Not Null): Official name of the supplying company.
  * `contact_number` (VARCHAR): Direct communication phone number.
  * `email` (VARCHAR): Supplier contact email address (added via structural modification).

* **`medicines`**
  * `medicine_id` (SERIAL, Primary Key): Unique identifier for each medicine item.
  * `medicine_name` (VARCHAR, Not Null): Brand or generic name of the pharmaceutical product.
  * `category` (VARCHAR, Not Null): Therapeutic classification (e.g., Analgesic, Antibiotic).
  * `price` (NUMERIC, Not Null): Cost per unit.
  * `units_in_stock` (INT, Not Null): Current available quantity in inventory.
  * `supplier_id` (INT, Foreign Key referencing `suppliers(supplier_id)`): Links the medicine to its designated supplier.

* **`sales`**
  * `sale_id` (SERIAL, Primary Key): Unique identifier for each sales transaction.
  * `medicine_id` (INT, Foreign Key referencing `medicines(medicine_id)`): Identifies the medicine sold.
  * `quantity_sold` (INT, Not Null): Number of units purchased in the transaction.
  * `sale_date` (DATE, Not Null): Date when the sale occurred.
  * `total_price` (NUMERIC, Not Null): Total calculated cost of the transaction.

---

## 3. Entity-Relationship Diagram (ERD)

The Entity-Relationship Diagram below illustrates the relational structure, primary-to-foreign key mappings, and cardinalities between the `suppliers`, `medicines`, and `sales` entities.

![Entity Relationship Diagram](erd.png)
<img width="559" height="386" alt="erd" src="https://github.com/user-attachments/assets/b35bafff-5777-4410-819d-7e5831c0f073" />


---

## 4. Database Setup & Initialization

To initialize and run this database system:

1. Open your PostgreSQL environment (**pgAdmin**).
2. Open the script file provided in this repository: **`assignment_iii.sql`**.
3. Execute the script from top to bottom to drop existing schema versions, construct tables, seed initial records, and run all 15 operational tasks.

---

## 5. SQL PRACTICAL TASKS
Subsection 5.1: SELECT Tasks (Q1.1 – Q1.3)
Task Q1.1: Basic Data Retrieval

Objective: Retrieve selected columns from the medicines table to display relevant product information.
Execution Result:
<img width="956" height="492" alt="q1 1" src="https://github.com/user-attachments/assets/7a2d5d6d-22c9-40f6-b786-fb099104a5f9" />
Explanation: Successfully retrieved core pricing and inventory details from a single table.


Task Q1.2: Conditional Data Retrieval

Objective: Retrieve records satisfying a specific therapeutic category condition.
Execution Result:
<img width="958" height="498" alt="q1 2" src="https://github.com/user-attachments/assets/0a9f8803-b3ed-41aa-ae59-ae8c4d93565a" />
Explanation: Filtered the dataset successfully to isolate specific medical classifications.


Task Q1.3: Sorted Data Retrieval

Objective: Retrieve and arrange medicine inventory records in descending order by price.
Execution Result:
<img width="959" height="501" alt="q1 3" src="https://github.com/user-attachments/assets/2aff972a-6f15-43aa-90e5-f94510b35997" />
Explanation: Arranged query results to easily identify high-value pharmaceutical items.

