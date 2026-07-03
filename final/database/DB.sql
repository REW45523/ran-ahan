-- ==========================================
-- Section 2.1 Database SQL (สำหรับ Supabase / PostgreSQL)
-- ==========================================

-- 1. DDL: สร้างตารางจำนวน 2 ตาราง
-- ลบตารางเดิมถ้ามีอยู่ (เผื่อรันซ้ำ)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

-- สร้างตาราง users (เก็บข้อมูลผู้ใช้งานและยอดเงิน)
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    wallet_balance NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- สร้างตาราง orders (เก็บข้อมูลคิวสั่งอาหาร)
CREATE TABLE orders (
    queue_id BIGINT PRIMARY KEY,
    menu VARCHAR(100) NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


-- 2. DML: เพิ่มข้อมูลจำลองอย่างน้อย 3 รายการ
-- เพิ่มข้อมูลผู้ใช้จำลอง (จำเป็นต้องมีถ้าจะทดสอบระบบจ่ายเงิน)
INSERT INTO users (id, name, wallet_balance) VALUES
(101, 'Somchai Dee', 150.00),
(102, 'Somsri Rakdee', 45.00);

-- เพิ่มข้อมูลคิวอาหารจำลอง 3 รายการ
INSERT INTO orders (queue_id, menu, total_price, status) VALUES 
(1, 'ข้าวกะเพราไก่ไข่ดาว', 55.00, 'Pending'),
(2, 'ข้าวผัดหมู', 50.00, 'Pending'),
(3, 'ก๋วยเตี๋ยวเส้นเล็กต้มยำ', 60.00, 'Ready');


-- DML: เขียนคำสั่ง UPDATE เปลี่ยนสถานะจาก 'Pending' เป็น 'Ready'
UPDATE orders 
SET status = 'Ready' 
WHERE queue_id = 1;


-- 3. Data Query: ค้นหาและแสดงเฉพาะคิวที่ Status เป็น 'Pending'
SELECT queue_id, menu, total_price, status 
FROM orders 
WHERE status = 'Pending'
ORDER BY queue_id ASC;