
-- 1. DATABASE CREATION
CREATE DATABASE osman_202513193_pharmacy_system;
-- \c osman_202513193_pharmacy_system; (Run in psql to connect)

-- 2. TABLE CREATION AND CONSTRAINTS
-- Create parent table first: suppliers
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    address VARCHAR(150) NOT NULL
);

-- Create child/parent table: medicines
CREATE TABLE medicines (
    medicine_id SERIAL PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    supplier_id INT NOT NULL,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE
);

-- Create child table: sales
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    medicine_id INT NOT NULL,
    quantity_sold INT NOT NULL CHECK (quantity_sold > 0),
    total_price NUMERIC(10, 2) NOT NULL,
    sale_date DATE NOT NULL,
    CONSTRAINT fk_medicine FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id) ON DELETE CASCADE
);

-- 3. INITIAL DATA INSERTION (At least 5 records per table)
INSERT INTO suppliers (supplier_name, contact_number, address) VALUES
('HealthCorp Pharma', '0781112233', 'Kigali'),
('MediSupply Ltd', '0722223344', 'Butare'),
('Global Drugs Inc', '0733334455', 'Gisenyi'),
('Prime Pharma Rwanda', '0794445566', 'Musanze'),
('BioHealth Distributors', '0785556677', 'Kigali');

INSERT INTO medicines (medicine_name, category, price, stock_quantity, supplier_id) VALUES
('Paracetamol', 'Analgesic', 5.00, 120, 1),
('Amoxicillin', 'Antibiotic', 15.50, 45, 2),
('Ibuprofen', 'Analgesic', 8.00, 80, 1),
('Omeprazole', 'Antacid', 12.00, 30, 3),
('Cetirizine', 'Antihistamine', 6.50, 95, 4);

INSERT INTO sales (medicine_id, quantity_sold, total_price, sale_date) VALUES
(1, 4, 20.00, '2026-10-20'),
(2, 2, 31.00, '2026-10-21'),
(3, 5, 40.00, '2026-10-22'),
(4, 1, 12.00, '2026-10-23'),
(5, 3, 19.50, '2026-10-24');

-- 4. SELECT TASKS
-- Q1.1: Basic Data Retrieval
SELECT medicine_name, price FROM medicines;

-- Q1.2: Conditional Data Retrieval
SELECT * FROM medicines WHERE stock_quantity < 50;

-- Q1.3: Sorted Data Retrieval
SELECT * FROM medicines ORDER BY price DESC;

-- 5. JOIN TASKS
-- Q2.1: INNER JOIN
SELECT m.medicine_name, s.supplier_name 
FROM medicines m 
INNER JOIN suppliers s ON m.supplier_id = s.supplier_id;

-- Q2.2: LEFT JOIN
SELECT s.supplier_name, m.medicine_name 
FROM suppliers s 
LEFT JOIN medicines m ON s.supplier_id = m.supplier_id;

-- Q2.3: Multi-Table JOIN
SELECT sl.sale_id, m.medicine_name, sl.quantity_sold, sl.total_price, s.supplier_name 
FROM sales sl 
INNER JOIN medicines m ON sl.medicine_id = m.medicine_id 
INNER JOIN suppliers s ON m.supplier_id = s.supplier_id;

-- 6. UPDATE TASKS AND VERIFICATION
-- Q3.1: Update One Record
UPDATE medicines SET price = 5.50 WHERE medicine_id = 1;
SELECT * FROM medicines WHERE medicine_id = 1;

-- Q3.2: Update Multiple Records
UPDATE medicines SET stock_quantity = stock_quantity + 10 WHERE category = 'Analgesic';
SELECT medicine_name, category, stock_quantity FROM medicines WHERE category = 'Analgesic';

-- Q3.3: Conditional Update
UPDATE medicines SET price = price * 0.90 WHERE stock_quantity > 80;
SELECT medicine_name, price, stock_quantity FROM medicines;

-- 7. ALTER TABLE TASKS AND VERIFICATION
-- Q4.1: Rename a Column
ALTER TABLE medicines RENAME COLUMN stock_quantity TO units_in_stock;
SELECT * FROM medicines LIMIT 1;
-- Verification for Q4.1
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'medicines' AND column_name = 'units_in_stock';

-- Q4.2: Change a Column's Data Type
ALTER TABLE medicines ALTER COLUMN price TYPE NUMERIC(12, 2);

-- Verification for Q4.2
SELECT column_name, data_type, numeric_precision, numeric_scale 
FROM information_schema.columns 
WHERE table_name = 'medicines' AND column_name = 'price';

-- Q4.3: Add or Remove a Column
ALTER TABLE suppliers ADD COLUMN email VARCHAR(100);

-- Verification for Q4.3
SELECT column_name, data_type, character_maximum_length 
FROM information_schema.columns 
WHERE table_name = 'suppliers' AND column_name = 'email';

-- 8. ADDITIONAL INSERT TASKS AND VERIFICATION
-- Q5.1: Insert a Single Record
INSERT INTO suppliers (supplier_name, contact_number, address, email) 
VALUES ('Nova Meds', '0789998877', 'Rubavu', 'info@novameds.rw');
SELECT * FROM suppliers WHERE supplier_name = 'Nova Meds';

-- Q5.2: Insert Multiple Records
INSERT INTO suppliers (supplier_name, contact_number, address, email) VALUES 
('Apex Pharma', '0721113322', 'Huye', 'contact@apexpharma.rw'),
('City Drugs', '0732224433', 'Muhanga', 'sales@citydrugs.rw');
SELECT * FROM suppliers;

-- Q5.3: Insert a Related Record
INSERT INTO medicines (medicine_name, category, price, units_in_stock, supplier_id) 
VALUES ('Aspirin', 'Analgesic', 4.00, 150, 6);
SELECT * FROM medicines WHERE medicine_name = 'Aspirin';