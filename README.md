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


JOIN Tasks (Q2.1 – Q2.3)
Task Q2.1: INNER JOIN

Objective: Retrieve records with matching relationships between suppliers and medicines.
Execution Result:
<img width="958" height="502" alt="q2 1" src="https://github.com/user-attachments/assets/31720853-c3aa-41d7-aa4a-0e43f0b18b07" />
Explanation: Linked related records where matching foreign keys exist in both tables.


Task Q2.2: LEFT JOIN

Objective: Retrieve all supplier records including matching information from the medicines table.
Execution Result:
<img width="958" height="500" alt="q2 2" src="https://github.com/user-attachments/assets/3df56709-b9ed-4b0e-a9a1-b7464dc1467b" />
Explanation: Ensured all parent supplier records remained visible even if product matches were absent.


Task Q2.3: Multi-Table JOIN

Objective: Combine suppliers, medicines, and sales tables to produce a comprehensive business report.
Execution Result:
<img width="958" height="503" alt="q2 3" src="https://github.com/user-attachments/assets/c36fcb9e-c9b8-4b82-a250-7bd20bf6702e" />
Explanation: Integrated all three entities to analyze operational activities across the database.


UPDATE Tasks & Verification (Q3.1 – Q3.3)
Task Q3.1: Update One Record

Objective: Modify the price of a single existing medicine record using its primary key.
Execution Result:
<img width="958" height="502" alt="q3 1" src="https://github.com/user-attachments/assets/4ddbdd96-2b5e-41df-a405-3ddf9e8fc543" />
Explanation: Targeted a specific record safely and confirmed the modification using a retrieval query.


Task Q3.2: Update Multiple Records

Objective: Modify pricing attributes for a group of records satisfying a defined condition.
Execution Result:
<img width="958" height="502" alt="q3 2" src="https://github.com/user-attachments/assets/2daa5bc7-3ad4-461e-bd3b-fa16dfef5727" />
Explanation: Applied bulk adjustments carefully using structured conditions to prevent unintended updates.


Task Q3.3: Conditional Update

Objective: Modify an attribute according to a specific business rule regarding inventory stock levels.
Execution Result:
<img width="958" height="501" alt="q3 3" src="https://github.com/user-attachments/assets/56db24cf-98fb-421e-bc35-2c4c67bf8f7a" />
Explanation: Satisfied business logic requirements and verified success through secondary data retrieval.


ALTER TABLE Tasks & Verification (Q4.1 – Q4.3)
Task Q4.1: Rename a Column

Objective: Rename the stock quantity column in the medicines table to standard naming conventions.
Execution Result:
<img width="958" height="503" alt="q4 1" src="https://github.com/user-attachments/assets/e66b6102-671d-4558-b86b-081e212e1ad7" />
Explanation: Successfully modified structural catalog metadata without compromising stored records.


Task Q4.2: Change a Column's Data Type

Objective: Alter the data type precision of the price column.
Execution Result:
<img width="959" height="503" alt="q4 2" src="https://github.com/user-attachments/assets/6cbe3432-9ff4-4e78-8165-cba5d5b165c9" />
Explanation: Updated structural precision while ensuring existing numeric values converted safely.


Task Q4.3: Add or Remove a Column

Objective: Add an email column to the suppliers table to enhance entity tracking.
Execution Result:
<img width="959" height="503" alt="q4 3" src="https://github.com/user-attachments/assets/b64c7ad4-bb39-4cad-a8d1-00778bde1162" />
Explanation: Expanded table structure to support additional operational requirements.


INSERT Tasks & Verification (Q5.1 – Q5.3)
Task Q5.1: Insert a Single Record

Objective: Insert one new, valid record into the suppliers table.
Execution Result:
<img width="959" height="503" alt="q5 1" src="https://github.com/user-attachments/assets/6ed2e764-f3fc-41bd-ab68-7f2a71bd95c5" />
Explanation: Successfully added a single entry while fully respecting table constraints.


Task Q5.2: Insert Multiple Records

Objective: Insert several new medicine catalog records simultaneously.
Execution Result:
<img width="958" height="498" alt="q5 2" src="https://github.com/user-attachments/assets/f6245aa2-8081-41a8-823e-1fe6252e2400" />
Explanation: Populated multiple records efficiently while maintaining data consistency.


Task Q5.3: Insert a Related Record

Objective: Insert a new transaction record into the sales child table using a valid foreign key.
Execution Result:
<img width="958" height="502" alt="q5 3" src="https://github.com/user-attachments/assets/cdd76936-dbce-437e-91a7-599571399fd2" />
Explanation: Maintained referential integrity by ensuring the foreign key referenced an active parent entity.



6: CONCLUSION
Completing this assignment provided a comprehensive understanding of relational database design and management. I gained practical experience in structuring related tables, establishing auto-incrementing primary keys, and enforcing strict foreign key constraints to maintain data integrity. Furthermore, executing initial data seeding, data retrieval, multi-table JOIN operations, conditional updates, structural alterations, and record insertions demonstrated how SQL commands work together to support dynamic business operations, inventory tracking, and reliable data reporting.






