CREATE TABLE IF NOT EXISTS company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    head_office VARCHAR(100),
    ceo_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

INSERT INTO company (company_name, head_office, ceo_name, contact_email, contact_phone)
VALUES 
('Maruti Suzuki India Ltd', 'Gurugram, Haryana', 'Hisashi Takeuchi', 'contact@marutisuzuki.com', '+91-124-6710000');
CREATE TABLE IF NOT EXISTS region (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    region_name VARCHAR(50) NOT NULL,
    zone_head VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);
 SHOW TABLES;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS car_model;
DROP TABLE IF EXISTS dealership;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS company;
CREATE TABLE company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    head_office VARCHAR(100),
    ceo_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

INSERT INTO company (company_name, head_office, ceo_name, contact_email, contact_phone)
VALUES 
('Maruti Suzuki India Ltd', 'Gurugram, Haryana', 'Hisashi Takeuchi', 'contact@marutisuzuki.com', '+91-124-6710000');
SHOW TABLES;
CREATE TABLE company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    head_office VARCHAR(100),
    ceo_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);
SHOW TABLES;
INSERT INTO company (company_name, head_office, ceo_name, contact_email, contact_phone)
VALUES ('Maruti Suzuki India Ltd', 'Gurugram, Haryana', 'Hisashi Takeuchi', 'contact@marutisuzuki.com', '+91-124-6710000');
CREATE TABLE region (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    region_name VARCHAR(50) NOT NULL,
    zone_head VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

INSERT INTO region (company_id, region_name, zone_head)
VALUES (1, 'Uttar Pradesh', 'Rohit Malhotra');
SHOW TABLES;
SELECT * FROM company;
SELECT * FROM region;
CREATE TABLE dealership (
    dealer_id INT AUTO_INCREMENT PRIMARY KEY,
    dealer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    region_id INT,
    manager_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (region_id) REFERENCES region(region_id)
);

USE maruti_suzuki_up;
SHOW TABLES;
INSERT INTO region (company_id, region_name, zone_head)
VALUES (1, 'Uttar Pradesh', 'Rohit Malhotra');
SHOW TABLES;
USE maruti_suzuki_up;

CREATE TABLE IF NOT EXISTS dealership (
    dealer_id INT AUTO_INCREMENT PRIMARY KEY,
    dealer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    region_id INT,
    manager_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (region_id) REFERENCES region(region_id)
);

INSERT INTO dealership (dealer_name, city, state, region_id, manager_name, phone, email) VALUES
('Maruti Suzuki Lucknow Elite Motors','Lucknow','Uttar Pradesh',1,'Amit Verma','9998012345','elite.lko@maruti.co.in'),
('Maruti Suzuki Vikas Auto Kanpur','Kanpur','Uttar Pradesh',1,'Rohit Mehra','9998023456','vikasauto.knp@maruti.co.in'),
('Maruti Suzuki Galaxy Motors Noida','Noida','Uttar Pradesh',1,'Pooja Sharma','9998034567','galaxy.noida@maruti.co.in'),
('Maruti Suzuki Shree Auto Meerut','Meerut','Uttar Pradesh',1,'Anand Gupta','9998045678','shreeauto.meerut@maruti.co.in'),
('Maruti Suzuki Heritage Motors Agra','Agra','Uttar Pradesh',1,'Neha Singh','9998056789','heritage.agra@maruti.co.in');
SELECT * FROM dealership;
DELETE FROM dealership;
ALTER TABLE dealership AUTO_INCREMENT = 1;
CREATE TABLE car_model (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    model_name VARCHAR(100),
    category VARCHAR(50),
    engine_type VARCHAR(50),
    transmission VARCHAR(20),
    price DECIMAL(10,2),
    launch_year INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

INSERT INTO car_model (company_id, model_name, category, engine_type, transmission, price, launch_year) VALUES
(1,'Swift','Hatchback','Petrol','Manual',659000,2023),
(1,'Fronx','SUV','Petrol','Automatic',1115000,2024),
(1,'Dzire','Sedan','Petrol','Manual',859000,2023),
(1,'Baleno','Hatchback','Petrol','Automatic',829000,2023),
(1,'Celerio','Hatchback','CNG','Manual',580000,2022),
(1,'Brezza','SUV','Diesel','Manual',1025000,2024),
(1,'Jimny','SUV','Petrol','Automatic',1449000,2024),
(1,'Grand Vitara','SUV','Hybrid','Automatic',1875000,2024);
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO customer (customer_name, city, state, phone, email) VALUES
('Rohan Agarwal','Lucknow','Uttar Pradesh','9123456781','rohan.ag@gmail.com'),
('Surbhi Yadav','Kanpur','Uttar Pradesh','9123456782','surbhi.yadav@gmail.com'),
('Manish Bansal','Noida','Uttar Pradesh','9123456783','manish.noida@gmail.com'),
('Preeti Sharma','Meerut','Uttar Pradesh','9123456784','preeti.meerut@gmail.com'),
('Nikhil Rastogi','Agra','Uttar Pradesh','9123456785','nikhil.agra@gmail.com');
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    dealer_id INT,
    car_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    discount DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    payment_mode VARCHAR(20),
    FOREIGN KEY (dealer_id) REFERENCES dealership(dealer_id),
    FOREIGN KEY (car_id) REFERENCES car_model(car_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO sales (dealer_id, car_id, customer_id, sale_date, quantity, price_per_unit, discount, total_amount, payment_mode) VALUES
(1,1,1,'2024-02-14',1,659000,9000,650000,'Cash'),
(2,6,2,'2024-08-18',1,1025000,25000,1000000,'Loan'),
(3,4,3,'2025-01-10',2,829000,15000,1643000,'EMI'),
(4,3,4,'2025-04-22',1,859000,5000,854000,'Credit Card'),
(5,8,5,'2025-06-30',1,1875000,30000,1845000,'Online');

CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    review_date DATE,
    rating INT,
    sentiment VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES car_model(car_id)
);

INSERT INTO review (customer_id, car_id, review_date, rating, sentiment) VALUES
(1,1,'2024-02-20',5,'Positive'),
(2,6,'2024-08-25',4,'Positive'),
(3,4,'2025-01-20',3,'Neutral'),
(4,3,'2025-04-25',5,'Positive'),
(5,8,'2025-07-05',4,'Positive');
INSERT INTO customer (customer_name, city, state, phone, email) VALUES
('Amit Sharma','Lucknow','Uttar Pradesh','9100000001','amit.sharma@gmail.com'),
('Rohit Singh','Lucknow','Uttar Pradesh','9100000002','rohit.singh@gmail.com'),
('Priya Verma','Lucknow','Uttar Pradesh','9100000003','priya.verma@gmail.com'),
('Vivek Agarwal','Lucknow','Uttar Pradesh','9100000004','vivek.agarwal@gmail.com'),
('Sneha Tiwari','Lucknow','Uttar Pradesh','9100000005','sneha.tiwari@gmail.com'),
('Aditya Pandey','Lucknow','Uttar Pradesh','9100000006','aditya.pandey@gmail.com'),
('Anjali Chauhan','Lucknow','Uttar Pradesh','9100000007','anjali.chauhan@gmail.com'),
('Nitesh Yadav','Lucknow','Uttar Pradesh','9100000008','nitesh.yadav@gmail.com'),
('Kritika Gupta','Lucknow','Uttar Pradesh','9100000009','kritika.gupta@gmail.com'),
('Saurabh Mishra','Lucknow','Uttar Pradesh','9100000010','saurabh.mishra@gmail.com'),
('Mohit Jain','Kanpur','Uttar Pradesh','9100000011','mohit.jain@gmail.com'),
('Neha Srivastava','Kanpur','Uttar Pradesh','9100000012','neha.srivastava@gmail.com'),
('Rahul Mehra','Kanpur','Uttar Pradesh','9100000013','rahul.mehra@gmail.com'),
('Divya Kapoor','Kanpur','Uttar Pradesh','9100000014','divya.kapoor@gmail.com'),
('Harshita Yadav','Kanpur','Uttar Pradesh','9100000015','harshita.yadav@gmail.com'),
('Deepak Gupta','Kanpur','Uttar Pradesh','9100000016','deepak.gupta@gmail.com'),
('Aman Tiwari','Kanpur','Uttar Pradesh','9100000017','aman.tiwari@gmail.com'),
('Kajal Singh','Kanpur','Uttar Pradesh','9100000018','kajal.singh@gmail.com'),
('Rajeev Bansal','Kanpur','Uttar Pradesh','9100000019','rajeev.bansal@gmail.com'),
('Tanvi Jain','Kanpur','Uttar Pradesh','9100000020','tanvi.jain@gmail.com'),
('Pooja Gupta','Noida','Uttar Pradesh','9100000021','pooja.gupta@gmail.com'),
('Arjun Khanna','Noida','Uttar Pradesh','9100000022','arjun.khanna@gmail.com'),
('Shruti Sharma','Noida','Uttar Pradesh','9100000023','shruti.sharma@gmail.com'),
('Nikhil Verma','Noida','Uttar Pradesh','9100000024','nikhil.verma@gmail.com'),
('Ankita Agarwal','Noida','Uttar Pradesh','9100000025','ankita.agarwal@gmail.com'),
('Ritesh Chauhan','Noida','Uttar Pradesh','9100000026','ritesh.chauhan@gmail.com'),
('Simran Kaur','Noida','Uttar Pradesh','9100000027','simran.kaur@gmail.com'),
('Sandeep Yadav','Noida','Uttar Pradesh','9100000028','sandeep.yadav@gmail.com'),
('Rachna Pandey','Noida','Uttar Pradesh','9100000029','rachna.pandey@gmail.com'),
('Manish Gupta','Noida','Uttar Pradesh','9100000030','manish.gupta@gmail.com'),
('Pankaj Sharma','Agra','Uttar Pradesh','9100000031','pankaj.sharma@gmail.com'),
('Rina Yadav','Agra','Uttar Pradesh','9100000032','rina.yadav@gmail.com'),
('Ashish Verma','Agra','Uttar Pradesh','9100000033','ashish.verma@gmail.com'),
('Garima Singh','Agra','Uttar Pradesh','9100000034','garima.singh@gmail.com'),
('Vijay Bansal','Agra','Uttar Pradesh','9100000035','vijay.bansal@gmail.com'),
('Meena Gupta','Agra','Uttar Pradesh','9100000036','meena.gupta@gmail.com'),
('Suraj Kumar','Agra','Uttar Pradesh','9100000037','suraj.kumar@gmail.com'),
('Isha Tiwari','Agra','Uttar Pradesh','9100000038','isha.tiwari@gmail.com'),
('Yogesh Jain','Agra','Uttar Pradesh','9100000039','yogesh.jain@gmail.com'),
('Charu Sharma','Agra','Uttar Pradesh','9100000040','charu.sharma@gmail.com'),
('Ankit Patel','Meerut','Uttar Pradesh','9100000041','ankit.patel@gmail.com'),
('Ritika Sinha','Meerut','Uttar Pradesh','9100000042','ritika.sinha@gmail.com'),
('Harish Yadav','Meerut','Uttar Pradesh','9100000043','harish.yadav@gmail.com'),
('Monika Chauhan','Meerut','Uttar Pradesh','9100000044','monika.chauhan@gmail.com'),
('Naveen Gupta','Meerut','Uttar Pradesh','9100000045','naveen.gupta@gmail.com'),
('Priti Verma','Meerut','Uttar Pradesh','9100000046','priti.verma@gmail.com'),
('Vikas Tyagi','Meerut','Uttar Pradesh','9100000047','vikas.tyagi@gmail.com'),
('Rupali Jain','Meerut','Uttar Pradesh','9100000048','rupali.jain@gmail.com'),
('Ashutosh Singh','Meerut','Uttar Pradesh','9100000049','ashutosh.singh@gmail.com'),
('Mitali Gupta','Meerut','Uttar Pradesh','9100000050','mitali.gupta@gmail.com'),
('Deepak Raj','Ghaziabad','Uttar Pradesh','9100000051','deepak.raj@gmail.com'),
('Ravi Yadav','Ghaziabad','Uttar Pradesh','9100000052','ravi.yadav@gmail.com'),
('Anjali Sharma','Ghaziabad','Uttar Pradesh','9100000053','anjali.sharma@gmail.com'),
('Vivek Bansal','Ghaziabad','Uttar Pradesh','9100000054','vivek.bansal@gmail.com'),
('Sonia Singh','Ghaziabad','Uttar Pradesh','9100000055','sonia.singh@gmail.com'),
('Karan Gupta','Ghaziabad','Uttar Pradesh','9100000056','karan.gupta@gmail.com'),
('Shradha Agarwal','Ghaziabad','Uttar Pradesh','9100000057','shradha.agarwal@gmail.com'),
('Rohit Tyagi','Ghaziabad','Uttar Pradesh','9100000058','rohit.tyagi@gmail.com'),
('Pooja Jain','Ghaziabad','Uttar Pradesh','9100000059','pooja.jain@gmail.com'),
('Devansh Mehta','Ghaziabad','Uttar Pradesh','9100000060','devansh.mehta@gmail.com'),
('Raj Kumar','Varanasi','Uttar Pradesh','9100000061','raj.kumar@gmail.com'),
('Surbhi Tiwari','Varanasi','Uttar Pradesh','9100000062','surbhi.tiwari@gmail.com'),
('Sandeep Singh','Varanasi','Uttar Pradesh','9100000063','sandeep.singh@gmail.com'),
('Kavita Verma','Varanasi','Uttar Pradesh','9100000064','kavita.verma@gmail.com'),
('Harshit Gupta','Varanasi','Uttar Pradesh','9100000065','harshit.gupta@gmail.com'),
('Sonam Yadav','Varanasi','Uttar Pradesh','9100000066','sonam.yadav@gmail.com'),
('Ramesh Sharma','Varanasi','Uttar Pradesh','9100000067','ramesh.sharma@gmail.com'),
('Manju Devi','Varanasi','Uttar Pradesh','9100000068','manju.devi@gmail.com'),
('Akash Jain','Varanasi','Uttar Pradesh','9100000069','akash.jain@gmail.com'),
('Ruchi Sinha','Varanasi','Uttar Pradesh','9100000070','ruchi.sinha@gmail.com'),
('Ravi Chauhan','Prayagraj','Uttar Pradesh','9100000071','ravi.chauhan@gmail.com'),
('Shalini Gupta','Prayagraj','Uttar Pradesh','9100000072','shalini.gupta@gmail.com'),
('Vineet Kumar','Prayagraj','Uttar Pradesh','9100000073','vineet.kumar@gmail.com'),
('Geeta Yadav','Prayagraj','Uttar Pradesh','9100000074','geeta.yadav@gmail.com'),
('Ankur Sharma','Prayagraj','Uttar Pradesh','9100000075','ankur.sharma@gmail.com'),
('Sneha Chauhan','Prayagraj','Uttar Pradesh','9100000076','sneha.chauhan@gmail.com'),
('Nitin Gupta','Prayagraj','Uttar Pradesh','9100000077','nitin.gupta@gmail.com'),
('Kiran Agarwal','Prayagraj','Uttar Pradesh','9100000078','kiran.agarwal@gmail.com'),
('Saurabh Yadav','Prayagraj','Uttar Pradesh','9100000079','saurabh.yadav@gmail.com'),
('Komal Bansal','Prayagraj','Uttar Pradesh','9100000080','komal.bansal@gmail.com'),
('Anil Kumar','Bareilly','Uttar Pradesh','9100000081','anil.kumar@gmail.com'),
('Neelam Sharma','Bareilly','Uttar Pradesh','9100000082','neelam.sharma@gmail.com'),
('Ajay Yadav','Bareilly','Uttar Pradesh','9100000083','ajay.yadav@gmail.com'),
('Suman Verma','Bareilly','Uttar Pradesh','9100000084','suman.verma@gmail.com'),
('Ravi Agarwal','Bareilly','Uttar Pradesh','9100000085','ravi.agarwal@gmail.com'),
('Bhavna Gupta','Bareilly','Uttar Pradesh','9100000086','bhavna.gupta@gmail.com'),
('Manoj Singh','Bareilly','Uttar Pradesh','9100000087','manoj.singh@gmail.com'),
('Kirti Jain','Bareilly','Uttar Pradesh','9100000088','kirti.jain@gmail.com'),
('Arun Yadav','Bareilly','Uttar Pradesh','9100000089','arun.yadav@gmail.com'),
('Payal Agarwal','Bareilly','Uttar Pradesh','9100000090','payal.agarwal@gmail.com'),
('Deepak Chauhan','Gorakhpur','Uttar Pradesh','9100000091','deepak.chauhan@gmail.com'),
('Nisha Sharma','Gorakhpur','Uttar Pradesh','9100000092','nisha.sharma@gmail.com'),
('Kamal Gupta','Gorakhpur','Uttar Pradesh','9100000093','kamal.gupta@gmail.com'),
('Megha Yadav','Gorakhpur','Uttar Pradesh','9100000094','megha.yadav@gmail.com'),
('Vishal Singh','Gorakhpur','Uttar Pradesh','9100000095','vishal.singh@gmail.com'),
('Aarti Verma','Gorakhpur','Uttar Pradesh','9100000096','aarti.verma@gmail.com'),
('Naveen Chauhan','Gorakhpur','Uttar Pradesh','9100000097','naveen.chauhan@gmail.com'),
('Rashmi Gupta','Gorakhpur','Uttar Pradesh','9100000098','rashmi.gupta@gmail.com'),
('Rajat Tyagi','Gorakhpur','Uttar Pradesh','9100000099','rajat.tyagi@gmail.com'),
('Seema Tiwari','Gorakhpur','Uttar Pradesh','9100000100','seema.tiwari@gmail.com');
INSERT INTO customer (customer_name, city, state, phone, email) VALUES
('Arjun Sharma','Aligarh','Uttar Pradesh','9100000101','arjun.sharma@gmail.com'),
('Priya Singh','Aligarh','Uttar Pradesh','9100000102','priya.singh@gmail.com'),
('Rakesh Verma','Aligarh','Uttar Pradesh','9100000103','rakesh.verma@gmail.com'),
('Sonal Yadav','Aligarh','Uttar Pradesh','9100000104','sonal.yadav@gmail.com'),
('Gaurav Agarwal','Aligarh','Uttar Pradesh','9100000105','gaurav.agarwal@gmail.com'),
('Kavita Tiwari','Aligarh','Uttar Pradesh','9100000106','kavita.tiwari@gmail.com'),
('Amit Chauhan','Aligarh','Uttar Pradesh','9100000107','amit.chauhan@gmail.com'),
('Ritu Gupta','Aligarh','Uttar Pradesh','9100000108','ritu.gupta@gmail.com'),
('Vivek Yadav','Aligarh','Uttar Pradesh','9100000109','vivek.yadav@gmail.com'),
('Ankita Jain','Aligarh','Uttar Pradesh','9100000110','ankita.jain@gmail.com'),
('Suresh Mehta','Moradabad','Uttar Pradesh','9100000111','suresh.mehta@gmail.com'),
('Manisha Verma','Moradabad','Uttar Pradesh','9100000112','manisha.verma@gmail.com'),
('Anuj Singh','Moradabad','Uttar Pradesh','9100000113','anuj.singh@gmail.com'),
('Poonam Agarwal','Moradabad','Uttar Pradesh','9100000114','poonam.agarwal@gmail.com'),
('Ravi Sharma','Moradabad','Uttar Pradesh','9100000115','ravi.sharma@gmail.com'),
('Shruti Yadav','Moradabad','Uttar Pradesh','9100000116','shruti.yadav@gmail.com'),
('Ashok Bansal','Moradabad','Uttar Pradesh','9100000117','ashok.bansal@gmail.com'),
('Deepa Gupta','Moradabad','Uttar Pradesh','9100000118','deepa.gupta@gmail.com'),
('Naveen Kumar','Moradabad','Uttar Pradesh','9100000119','naveen.kumar@gmail.com'),
('Mona Sharma','Moradabad','Uttar Pradesh','9100000120','mona.sharma@gmail.com'),
('Harshit Jain','Jhansi','Uttar Pradesh','9100000121','harshit.jain@gmail.com'),
('Neha Chauhan','Jhansi','Uttar Pradesh','9100000122','neha.chauhan@gmail.com'),
('Pankaj Gupta','Jhansi','Uttar Pradesh','9100000123','pankaj.gupta@gmail.com'),
('Meena Yadav','Jhansi','Uttar Pradesh','9100000124','meena.yadav@gmail.com'),
('Rohit Tyagi','Jhansi','Uttar Pradesh','9100000125','rohit.tyagi@gmail.com'),
('Divya Tiwari','Jhansi','Uttar Pradesh','9100000126','divya.tiwari@gmail.com'),
('Ajay Sharma','Jhansi','Uttar Pradesh','9100000127','ajay.sharma@gmail.com'),
('Surbhi Jain','Jhansi','Uttar Pradesh','9100000128','surbhi.jain@gmail.com'),
('Ankit Verma','Jhansi','Uttar Pradesh','9100000129','ankit.verma@gmail.com'),
('Kiran Gupta','Jhansi','Uttar Pradesh','9100000130','kiran.gupta@gmail.com'),
('Rajesh Singh','Ayodhya','Uttar Pradesh','9100000131','rajesh.singh@gmail.com'),
('Pooja Yadav','Ayodhya','Uttar Pradesh','9100000132','pooja.yadav@gmail.com'),
('Vivek Kumar','Ayodhya','Uttar Pradesh','9100000133','vivek.kumar@gmail.com'),
('Neelam Verma','Ayodhya','Uttar Pradesh','9100000134','neelam.verma@gmail.com'),
('Manish Agarwal','Ayodhya','Uttar Pradesh','9100000135','manish.agarwal@gmail.com'),
('Priyanka Singh','Ayodhya','Uttar Pradesh','9100000136','priyanka.singh@gmail.com'),
('Abhishek Gupta','Ayodhya','Uttar Pradesh','9100000137','abhishek.gupta@gmail.com'),
('Rachna Jain','Ayodhya','Uttar Pradesh','9100000138','rachna.jain@gmail.com'),
('Anurag Yadav','Ayodhya','Uttar Pradesh','9100000139','anurag.yadav@gmail.com'),
('Shivani Verma','Ayodhya','Uttar Pradesh','9100000140','shivani.verma@gmail.com'),
('Sanjay Gupta','Mathura','Uttar Pradesh','9100000141','sanjay.gupta@gmail.com'),
('Ritika Kapoor','Mathura','Uttar Pradesh','9100000142','ritika.kapoor@gmail.com'),
('Ashish Yadav','Mathura','Uttar Pradesh','9100000143','ashish.yadav@gmail.com'),
('Komal Sharma','Mathura','Uttar Pradesh','9100000144','komal.sharma@gmail.com'),
('Aakash Chauhan','Mathura','Uttar Pradesh','9100000145','aakash.chauhan@gmail.com'),
('Sneha Gupta','Mathura','Uttar Pradesh','9100000146','sneha.gupta@gmail.com'),
('Rohit Verma','Mathura','Uttar Pradesh','9100000147','rohit.verma@gmail.com'),
('Shreya Jain','Mathura','Uttar Pradesh','9100000148','shreya.jain@gmail.com'),
('Nitin Bansal','Mathura','Uttar Pradesh','9100000149','nitin.bansal@gmail.com'),
('Garima Yadav','Mathura','Uttar Pradesh','9100000150','garima.yadav@gmail.com'),
('Ravi Kiran','Lucknow','Uttar Pradesh','9100000151','ravi.kiran@gmail.com'),
('Megha Gupta','Lucknow','Uttar Pradesh','9100000152','megha.gupta@gmail.com'),
('Vikas Jain','Lucknow','Uttar Pradesh','9100000153','vikas.jain@gmail.com'),
('Sonia Tiwari','Lucknow','Uttar Pradesh','9100000154','sonia.tiwari@gmail.com'),
('Rohit Sharma','Lucknow','Uttar Pradesh','9100000155','rohit.sharma2@gmail.com'),
('Anita Yadav','Lucknow','Uttar Pradesh','9100000156','anita.yadav@gmail.com'),
('Harish Mehta','Lucknow','Uttar Pradesh','9100000157','harish.mehta@gmail.com'),
('Kajal Verma','Lucknow','Uttar Pradesh','9100000158','kajal.verma@gmail.com'),
('Saurabh Singh','Lucknow','Uttar Pradesh','9100000159','saurabh.singh@gmail.com'),
('Mansi Agarwal','Lucknow','Uttar Pradesh','9100000160','mansi.agarwal@gmail.com'),
('Aman Gupta','Kanpur','Uttar Pradesh','9100000161','aman.gupta@gmail.com'),
('Nisha Rani','Kanpur','Uttar Pradesh','9100000162','nisha.rani@gmail.com'),
('Harendra Yadav','Kanpur','Uttar Pradesh','9100000163','harendra.yadav@gmail.com'),
('Shruti Bansal','Kanpur','Uttar Pradesh','9100000164','shruti.bansal@gmail.com'),
('Vivek Chauhan','Kanpur','Uttar Pradesh','9100000165','vivek.chauhan@gmail.com'),
('Ragini Sharma','Kanpur','Uttar Pradesh','9100000166','ragini.sharma@gmail.com'),
('Ajay Mehta','Kanpur','Uttar Pradesh','9100000167','ajay.mehta@gmail.com'),
('Rekha Yadav','Kanpur','Uttar Pradesh','9100000168','rekha.yadav@gmail.com'),
('Tushar Gupta','Kanpur','Uttar Pradesh','9100000169','tushar.gupta@gmail.com'),
('Simran Agarwal','Kanpur','Uttar Pradesh','9100000170','simran.agarwal@gmail.com'),
('Rajeev Tyagi','Noida','Uttar Pradesh','9100000171','rajeev.tyagi@gmail.com'),
('Payal Singh','Noida','Uttar Pradesh','9100000172','payal.singh@gmail.com'),
('Deepak Bansal','Noida','Uttar Pradesh','9100000173','deepak.bansal@gmail.com'),
('Madhuri Chauhan','Noida','Uttar Pradesh','9100000174','madhuri.chauhan@gmail.com'),
('Arvind Yadav','Noida','Uttar Pradesh','9100000175','arvind.yadav@gmail.com'),
('Priti Jain','Noida','Uttar Pradesh','9100000176','priti.jain@gmail.com'),
('Sumit Sharma','Noida','Uttar Pradesh','9100000177','sumit.sharma@gmail.com'),
('Ruchi Agarwal','Noida','Uttar Pradesh','9100000178','ruchi.agarwal@gmail.com'),
('Ashok Mehta','Noida','Uttar Pradesh','9100000179','ashok.mehta@gmail.com'),
('Divya Kapoor','Noida','Uttar Pradesh','9100000180','divya.kapoor2@gmail.com'),
('Kunal Gupta','Agra','Uttar Pradesh','9100000181','kunal.gupta@gmail.com'),
('Anita Mehra','Agra','Uttar Pradesh','9100000182','anita.mehra@gmail.com'),
('Rakesh Yadav','Agra','Uttar Pradesh','9100000183','rakesh.yadav@gmail.com'),
('Seema Sharma','Agra','Uttar Pradesh','9100000184','seema.sharma@gmail.com'),
('Rajiv Bansal','Agra','Uttar Pradesh','9100000185','rajiv.bansal@gmail.com'),
('Bhavna Tiwari','Agra','Uttar Pradesh','9100000186','bhavna.tiwari@gmail.com'),
('Ashutosh Gupta','Agra','Uttar Pradesh','9100000187','ashutosh.gupta@gmail.com'),
('Neelam Yadav','Agra','Uttar Pradesh','9100000188','neelam.yadav@gmail.com'),
('Vinay Sharma','Agra','Uttar Pradesh','9100000189','vinay.sharma@gmail.com'),
('Reena Verma','Agra','Uttar Pradesh','9100000190','reena.verma@gmail.com'),
('Amit Khanna','Meerut','Uttar Pradesh','9100000191','amit.khanna@gmail.com'),
('Sneha Bansal','Meerut','Uttar Pradesh','9100000192','sneha.bansal@gmail.com'),
('Gaurav Yadav','Meerut','Uttar Pradesh','9100000193','gaurav.yadav@gmail.com'),
('Ritu Agarwal','Meerut','Uttar Pradesh','9100000194','ritu.agarwal@gmail.com'),
('Nikhil Sharma','Meerut','Uttar Pradesh','9100000195','nikhil.sharma@gmail.com'),
('Shweta Mehra','Meerut','Uttar Pradesh','9100000196','shweta.mehra@gmail.com'),
('Rohit Kumar','Meerut','Uttar Pradesh','9100000197','rohit.kumar@gmail.com'),
('Anu Chauhan','Meerut','Uttar Pradesh','9100000198','anu.chauhan@gmail.com'),
('Ashish Jain','Meerut','Uttar Pradesh','9100000199','ashish.jain@gmail.com'),
('Poonam Verma','Meerut','Uttar Pradesh','9100000200','poonam.verma@gmail.com');
INSERT INTO customer (customer_name, city, state, phone, email) VALUES
('Ramesh Patel','Ghaziabad','Uttar Pradesh','9100000201','ramesh.patel@gmail.com'),
('Divya Singh','Ghaziabad','Uttar Pradesh','9100000202','divya.singh@gmail.com'),
('Akash Verma','Ghaziabad','Uttar Pradesh','9100000203','akash.verma@gmail.com'),
('Nidhi Yadav','Ghaziabad','Uttar Pradesh','9100000204','nidhi.yadav@gmail.com'),
('Arun Bansal','Ghaziabad','Uttar Pradesh','9100000205','arun.bansal@gmail.com'),
('Shalini Jain','Ghaziabad','Uttar Pradesh','9100000206','shalini.jain@gmail.com'),
('Manoj Kumar','Ghaziabad','Uttar Pradesh','9100000207','manoj.kumar@gmail.com'),
('Aarti Verma','Ghaziabad','Uttar Pradesh','9100000208','aarti.verma@gmail.com'),
('Deepak Tyagi','Ghaziabad','Uttar Pradesh','9100000209','deepak.tyagi@gmail.com'),
('Meera Agarwal','Ghaziabad','Uttar Pradesh','9100000210','meera.agarwal@gmail.com'),
('Saurabh Tiwari','Varanasi','Uttar Pradesh','9100000211','saurabh.tiwari@gmail.com'),
('Ritika Gupta','Varanasi','Uttar Pradesh','9100000212','ritika.gupta@gmail.com'),
('Naveen Yadav','Varanasi','Uttar Pradesh','9100000213','naveen.yadav@gmail.com'),
('Ankita Sharma','Varanasi','Uttar Pradesh','9100000214','ankita.sharma@gmail.com'),
('Pawan Chauhan','Varanasi','Uttar Pradesh','9100000215','pawan.chauhan@gmail.com'),
('Meenakshi Verma','Varanasi','Uttar Pradesh','9100000216','meenakshi.verma@gmail.com'),
('Vivek Sinha','Varanasi','Uttar Pradesh','9100000217','vivek.sinha@gmail.com'),
('Shreya Kapoor','Varanasi','Uttar Pradesh','9100000218','shreya.kapoor@gmail.com'),
('Harish Gupta','Varanasi','Uttar Pradesh','9100000219','harish.gupta@gmail.com'),
('Sneha Tyagi','Varanasi','Uttar Pradesh','9100000220','sneha.tyagi@gmail.com'),
('Rajiv Sharma','Prayagraj','Uttar Pradesh','9100000221','rajiv.sharma@gmail.com'),
('Rupali Yadav','Prayagraj','Uttar Pradesh','9100000222','rupali.yadav@gmail.com'),
('Ashok Chauhan','Prayagraj','Uttar Pradesh','9100000223','ashok.chauhan@gmail.com'),
('Simran Verma','Prayagraj','Uttar Pradesh','9100000224','simran.verma@gmail.com'),
('Amit Tiwari','Prayagraj','Uttar Pradesh','9100000225','amit.tiwari@gmail.com'),
('Kiran Yadav','Prayagraj','Uttar Pradesh','9100000226','kiran.yadav@gmail.com'),
('Gaurav Sharma','Prayagraj','Uttar Pradesh','9100000227','gaurav.sharma@gmail.com'),
('Neha Gupta','Prayagraj','Uttar Pradesh','9100000228','neha.gupta@gmail.com'),
('Suresh Kumar','Prayagraj','Uttar Pradesh','9100000229','suresh.kumar@gmail.com'),
('Preeti Jain','Prayagraj','Uttar Pradesh','9100000230','preeti.jain@gmail.com'),
('Manish Chauhan','Bareilly','Uttar Pradesh','9100000231','manish.chauhan@gmail.com'),
('Swati Sharma','Bareilly','Uttar Pradesh','9100000232','swati.sharma@gmail.com'),
('Ankur Gupta','Bareilly','Uttar Pradesh','9100000233','ankur.gupta@gmail.com'),
('Pallavi Yadav','Bareilly','Uttar Pradesh','9100000234','pallavi.yadav@gmail.com'),
('Ravi Mehta','Bareilly','Uttar Pradesh','9100000235','ravi.mehta@gmail.com'),
('Bhavna Chauhan','Bareilly','Uttar Pradesh','9100000236','bhavna.chauhan@gmail.com'),
('Nitin Agarwal','Bareilly','Uttar Pradesh','9100000237','nitin.agarwal@gmail.com'),
('Sonal Verma','Bareilly','Uttar Pradesh','9100000238','sonal.verma@gmail.com'),
('Ajay Tyagi','Bareilly','Uttar Pradesh','9100000239','ajay.tyagi@gmail.com'),
('Deepika Singh','Bareilly','Uttar Pradesh','9100000240','deepika.singh@gmail.com'),
('Alok Gupta','Gorakhpur','Uttar Pradesh','9100000241','alok.gupta@gmail.com'),
('Rashmi Jain','Gorakhpur','Uttar Pradesh','9100000242','rashmi.jain@gmail.com'),
('Anand Verma','Gorakhpur','Uttar Pradesh','9100000243','anand.verma@gmail.com'),
('Monika Tyagi','Gorakhpur','Uttar Pradesh','9100000244','monika.tyagi@gmail.com'),
('Vikas Yadav','Gorakhpur','Uttar Pradesh','9100000245','vikas.yadav@gmail.com'),
('Nisha Sharma','Gorakhpur','Uttar Pradesh','9100000246','nisha.sharma2@gmail.com'),
('Kamal Chauhan','Gorakhpur','Uttar Pradesh','9100000247','kamal.chauhan@gmail.com'),
('Sangeeta Verma','Gorakhpur','Uttar Pradesh','9100000248','sangeeta.verma@gmail.com'),
('Rajat Gupta','Gorakhpur','Uttar Pradesh','9100000249','rajat.gupta@gmail.com'),
('Anjali Mehta','Gorakhpur','Uttar Pradesh','9100000250','anjali.mehta@gmail.com'),
('Sameer Yadav','Aligarh','Uttar Pradesh','9100000251','sameer.yadav@gmail.com'),
('Kritika Chauhan','Aligarh','Uttar Pradesh','9100000252','kritika.chauhan@gmail.com'),
('Rajesh Bansal','Aligarh','Uttar Pradesh','9100000253','rajesh.bansal@gmail.com'),
('Manju Singh','Aligarh','Uttar Pradesh','9100000254','manju.singh@gmail.com'),
('Anil Yadav','Aligarh','Uttar Pradesh','9100000255','anil.yadav@gmail.com'),
('Rekha Sharma','Aligarh','Uttar Pradesh','9100000256','rekha.sharma@gmail.com'),
('Vivek Chauhan','Aligarh','Uttar Pradesh','9100000257','vivek.chauhan@gmail.com'),
('Pooja Tiwari','Aligarh','Uttar Pradesh','9100000258','pooja.tiwari@gmail.com'),
('Harshit Verma','Aligarh','Uttar Pradesh','9100000259','harshit.verma@gmail.com'),
('Tanvi Agarwal','Aligarh','Uttar Pradesh','9100000260','tanvi.agarwal@gmail.com'),
('Rohit Chauhan','Moradabad','Uttar Pradesh','9100000261','rohit.chauhan@gmail.com'),
('Meena Gupta','Moradabad','Uttar Pradesh','9100000262','meena.gupta2@gmail.com'),
('Sanjay Tiwari','Moradabad','Uttar Pradesh','9100000263','sanjay.tiwari@gmail.com'),
('Priyanka Jain','Moradabad','Uttar Pradesh','9100000264','priyanka.jain@gmail.com'),
('Vineet Kumar','Moradabad','Uttar Pradesh','9100000265','vineet.kumar@gmail.com'),
('Aisha Yadav','Moradabad','Uttar Pradesh','9100000266','aisha.yadav@gmail.com'),
('Ashish Gupta','Moradabad','Uttar Pradesh','9100000267','ashish.gupta@gmail.com'),
('Sneha Mehta','Moradabad','Uttar Pradesh','9100000268','sneha.mehta@gmail.com'),
('Ravindra Singh','Moradabad','Uttar Pradesh','9100000269','ravindra.singh@gmail.com'),
('Isha Verma','Moradabad','Uttar Pradesh','9100000270','isha.verma@gmail.com'),
('Abhinav Gupta','Jhansi','Uttar Pradesh','9100000271','abhinav.gupta@gmail.com'),
('Sakshi Sharma','Jhansi','Uttar Pradesh','9100000272','sakshi.sharma@gmail.com'),
('Mukesh Yadav','Jhansi','Uttar Pradesh','9100000273','mukesh.yadav@gmail.com'),
('Divya Chauhan','Jhansi','Uttar Pradesh','9100000274','divya.chauhan@gmail.com'),
('Anuj Bansal','Jhansi','Uttar Pradesh','9100000275','anuj.bansal@gmail.com'),
('Riya Jain','Jhansi','Uttar Pradesh','9100000276','riya.jain@gmail.com'),
('Chetan Mehra','Jhansi','Uttar Pradesh','9100000277','chetan.mehra@gmail.com'),
('Shweta Tyagi','Jhansi','Uttar Pradesh','9100000278','shweta.tyagi@gmail.com'),
('Aman Chauhan','Jhansi','Uttar Pradesh','9100000279','aman.chauhan@gmail.com'),
('Rachita Gupta','Jhansi','Uttar Pradesh','9100000280','rachita.gupta@gmail.com'),
('Rajeev Agarwal','Ayodhya','Uttar Pradesh','9100000281','rajeev.agarwal@gmail.com'),
('Kavita Chauhan','Ayodhya','Uttar Pradesh','9100000282','kavita.chauhan@gmail.com'),
('Naveen Tiwari','Ayodhya','Uttar Pradesh','9100000283','naveen.tiwari@gmail.com'),
('Monika Verma','Ayodhya','Uttar Pradesh','9100000284','monika.verma@gmail.com'),
('Suresh Gupta','Ayodhya','Uttar Pradesh','9100000285','suresh.gupta@gmail.com'),
('Pallavi Yadav','Ayodhya','Uttar Pradesh','9100000286','pallavi.yadav@gmail.com'),
('Rohit Mehta','Ayodhya','Uttar Pradesh','9100000287','rohit.mehta@gmail.com'),
('Rashmi Sharma','Ayodhya','Uttar Pradesh','9100000288','rashmi.sharma@gmail.com'),
('Arvind Chauhan','Ayodhya','Uttar Pradesh','9100000289','arvind.chauhan@gmail.com'),
('Deepa Bansal','Ayodhya','Uttar Pradesh','9100000290','deepa.bansal@gmail.com'),
('Vikram Jain','Mathura','Uttar Pradesh','9100000291','vikram.jain@gmail.com'),
('Renu Yadav','Mathura','Uttar Pradesh','9100000292','renu.yadav@gmail.com'),
('Ankit Sharma','Mathura','Uttar Pradesh','9100000293','ankit.sharma@gmail.com'),
('Kirti Mehta','Mathura','Uttar Pradesh','9100000294','kirti.mehta@gmail.com'),
('Rahul Agarwal','Mathura','Uttar Pradesh','9100000295','rahul.agarwal@gmail.com'),
('Shilpa Singh','Mathura','Uttar Pradesh','9100000296','shilpa.singh@gmail.com'),
('Vinod Verma','Mathura','Uttar Pradesh','9100000297','vinod.verma@gmail.com'),
('Aarti Gupta','Mathura','Uttar Pradesh','9100000298','aarti.gupta@gmail.com'),
('Nitin Tyagi','Mathura','Uttar Pradesh','9100000299','nitin.tyagi@gmail.com'),
('Sneha Jain','Mathura','Uttar Pradesh','9100000300','sneha.jain@gmail.com');
SELECT COUNT(*) AS total_customers FROM customer;
SELECT customer_id, customer_name, city FROM customer ORDER BY customer_id DESC LIMIT 10;
INSERT INTO sales (dealer_id, car_id, customer_id, sale_date, quantity, price_per_unit, discount, total_amount, payment_mode) VALUES
(1,1,5,'2024-01-14',1,659000,9000,650000,'Cash'),
(1,2,12,'2024-02-21',1,1115000,15000,1100000,'Loan'),
(2,3,23,'2024-03-10',2,859000,25000,1693000,'EMI'),
(3,4,41,'2024-04-05',1,829000,5000,824000,'Credit Card'),
(4,5,45,'2024-04-28',1,580000,8000,572000,'Online'),
(5,6,59,'2024-05-12',1,1025000,20000,1005000,'Loan'),
(1,7,62,'2024-06-19',1,1449000,30000,1419000,'EMI'),
(2,8,73,'2024-07-02',1,1875000,25000,1850000,'Online'),
(3,1,84,'2024-07-26',2,659000,10000,1308000,'Cash'),
(4,2,91,'2024-08-05',1,1115000,15000,1100000,'Credit Card'),
(5,3,95,'2024-08-21',1,859000,10000,849000,'EMI'),
(1,4,103,'2024-09-01',1,829000,5000,824000,'Online'),
(2,5,114,'2024-09-15',2,580000,10000,1150000,'Cash'),
(3,6,118,'2024-10-03',1,1025000,15000,1010000,'Loan'),
(4,7,123,'2024-10-19',1,1449000,25000,1424000,'EMI'),
(5,8,128,'2024-11-01',1,1875000,30000,1845000,'Credit Card'),
(1,1,130,'2024-11-15',1,659000,5000,654000,'Cash'),
(2,2,135,'2024-12-10',2,1115000,25000,2200000,'EMI'),
(3,3,139,'2024-12-29',1,859000,10000,849000,'Loan'),
(4,4,141,'2025-01-07',1,829000,15000,814000,'Credit Card'),
(5,5,150,'2025-01-18',1,580000,8000,572000,'Online'),
(1,6,152,'2025-01-30',1,1025000,20000,1005000,'Loan'),
(2,7,155,'2025-02-09',1,1449000,30000,1419000,'EMI'),
(3,8,161,'2025-02-22',1,1875000,25000,1850000,'Cash'),
(4,1,166,'2025-03-02',2,659000,10000,1308000,'Online'),
(5,2,172,'2025-03-15',1,1115000,15000,1100000,'Credit Card'),
(1,3,174,'2025-03-28',1,859000,10000,849000,'Loan'),
(2,4,180,'2025-04-11',1,829000,5000,824000,'EMI'),
(3,5,185,'2025-04-22',2,580000,10000,1150000,'Cash'),
(4,6,190,'2025-05-04',1,1025000,15000,1010000,'Online'),
(5,7,194,'2025-05-17',1,1449000,25000,1424000,'Loan'),
(1,8,199,'2025-05-29',1,1875000,30000,1845000,'EMI'),
(2,1,203,'2025-06-09',1,659000,5000,654000,'Credit Card'),
(3,2,207,'2025-06-21',2,1115000,25000,2200000,'Online'),
(4,3,210,'2025-07-02',1,859000,10000,849000,'EMI'),
(5,4,214,'2025-07-10',1,829000,15000,814000,'Cash'),
(1,5,218,'2025-07-19',1,580000,8000,572000,'Loan'),
(2,6,223,'2025-07-28',1,1025000,20000,1005000,'Credit Card'),
(3,7,227,'2025-08-05',1,1449000,30000,1419000,'Online'),
(4,8,233,'2025-08-13',1,1875000,25000,1850000,'EMI'),
(5,1,240,'2025-08-22',2,659000,10000,1308000,'Cash'),
(1,2,242,'2025-08-29',1,1115000,15000,1100000,'Loan'),
(2,3,247,'2025-09-03',1,859000,10000,849000,'Credit Card'),
(3,4,250,'2025-09-09',1,829000,5000,824000,'Online'),
(4,5,253,'2025-09-17',2,580000,10000,1150000,'EMI'),
(5,6,257,'2025-09-25',1,1025000,15000,1010000,'Loan'),
(1,7,260,'2025-10-01',1,1449000,25000,1424000,'Credit Card'),
(2,8,263,'2025-10-04',1,1875000,30000,1845000,'Online');

INSERT INTO sales (dealer_id, car_id, customer_id, sale_date, quantity, price_per_unit, discount, total_amount, payment_mode) VALUES
(1,3,5,'2024-02-14',1,859000,15000,844000,'Cash'),
(2,4,7,'2024-03-05',1,829000,10000,819000,'Credit Card'),
(3,5,9,'2024-03-21',1,580000,8000,572000,'Loan'),
(4,6,12,'2024-04-02',2,1025000,20000,2030000,'EMI'),
(5,7,15,'2024-04-19',1,1449000,25000,1424000,'Online'),
(1,8,17,'2024-05-04',1,1875000,30000,1845000,'Cash'),
(2,1,20,'2024-05-19',1,659000,9000,650000,'Loan'),
(3,2,22,'2024-06-01',1,1115000,15000,1100000,'EMI'),
(4,3,25,'2024-06-17',2,859000,20000,1698000,'Credit Card'),
(5,4,27,'2024-07-03',1,829000,10000,819000,'Online'),
(1,5,30,'2024-07-16',1,580000,8000,572000,'Cash'),
(2,6,32,'2024-07-30',1,1025000,15000,1010000,'Loan'),
(3,7,35,'2024-08-12',1,1449000,30000,1419000,'EMI'),
(4,8,39,'2024-08-25',1,1875000,25000,1850000,'Credit Card'),
(5,1,42,'2024-09-09',1,659000,9000,650000,'Online'),
(1,2,46,'2024-09-22',2,1115000,20000,2210000,'Cash'),
(2,3,50,'2024-10-05',1,859000,10000,849000,'Loan'),
(3,4,53,'2024-10-17',1,829000,10000,819000,'EMI'),
(4,5,57,'2024-10-31',1,580000,8000,572000,'Credit Card'),
(5,6,60,'2024-11-15',1,1025000,20000,1005000,'Online'),
(1,7,64,'2024-11-28',1,1449000,25000,1424000,'Cash'),
(2,8,67,'2024-12-10',1,1875000,30000,1845000,'Loan'),
(3,1,70,'2024-12-22',2,659000,15000,1303000,'EMI'),
(4,2,72,'2025-01-04',1,1115000,15000,1100000,'Credit Card'),
(5,3,76,'2025-01-17',1,859000,10000,849000,'Online'),
(1,4,79,'2025-02-01',1,829000,10000,819000,'Cash'),
(2,5,82,'2025-02-14',1,580000,8000,572000,'Loan'),
(3,6,85,'2025-02-26',1,1025000,15000,1010000,'EMI'),
(4,7,89,'2025-03-10',1,1449000,30000,1419000,'Credit Card'),
(5,8,92,'2025-03-23',1,1875000,25000,1850000,'Online'),
(1,1,96,'2025-04-07',1,659000,9000,650000,'Cash'),
(2,2,99,'2025-04-19',1,1115000,15000,1100000,'Loan'),
(3,3,103,'2025-05-02',2,859000,20000,1698000,'EMI'),
(4,4,106,'2025-05-15',1,829000,10000,819000,'Credit Card'),
(5,5,110,'2025-05-29',1,580000,8000,572000,'Online'),
(1,6,113,'2025-06-11',1,1025000,20000,1005000,'Cash'),
(2,7,116,'2025-06-23',1,1449000,25000,1424000,'Loan'),
(3,8,120,'2025-07-05',1,1875000,30000,1845000,'EMI'),
(4,1,124,'2025-07-19',1,659000,9000,650000,'Credit Card'),
(5,2,128,'2025-08-01',2,1115000,20000,2210000,'Online'),
(1,3,132,'2025-08-12',1,859000,10000,849000,'Cash'),
(2,4,136,'2025-08-27',1,829000,10000,819000,'Loan'),
(3,5,140,'2025-09-09',1,580000,8000,572000,'EMI'),
(4,6,144,'2025-09-21',1,1025000,15000,1010000,'Credit Card'),
(5,7,149,'2025-10-04',1,1449000,25000,1424000,'Online'),
(1,8,152,'2025-10-17',1,1875000,30000,1845000,'Cash'),
(2,1,156,'2025-10-29',2,659000,15000,1303000,'Loan'),
(3,2,160,'2025-11-12',1,1115000,15000,1100000,'EMI'),
(4,3,165,'2025-11-25',1,859000,10000,849000,'Credit Card'),
(5,4,169,'2025-12-08',1,829000,10000,819000,'Online'),
(1,5,172,'2025-12-21',1,580000,8000,572000,'Cash'),
(2,6,175,'2025-12-31',1,1025000,20000,1005000,'Loan'),
(3,7,178,'2025-01-12',1,1449000,25000,1424000,'EMI'),
(4,8,181,'2025-01-27',1,1875000,30000,1845000,'Credit Card'),
(5,1,185,'2025-02-09',2,659000,15000,1303000,'Online'),
(1,2,188,'2025-02-23',1,1115000,15000,1100000,'Cash'),
(2,3,192,'2025-03-06',1,859000,10000,849000,'Loan'),
(3,4,195,'2025-03-20',1,829000,10000,819000,'EMI'),
(4,5,199,'2025-04-02',1,580000,8000,572000,'Credit Card'),
(5,6,203,'2025-04-14',1,1025000,20000,1005000,'Online'),
(1,7,208,'2025-04-26',1,1449000,25000,1424000,'Cash'),
(2,8,212,'2025-05-08',1,1875000,30000,1845000,'Loan'),
(3,1,215,'2025-05-22',1,659000,9000,650000,'EMI'),
(4,2,219,'2025-06-05',1,1115000,15000,1100000,'Credit Card'),
(5,3,222,'2025-06-18',2,859000,20000,1698000,'Online'),
(1,4,225,'2025-06-30',1,829000,10000,819000,'Cash'),
(2,5,228,'2025-07-12',1,580000,8000,572000,'Loan'),
(3,6,232,'2025-07-26',1,1025000,15000,1010000,'EMI'),
(4,7,236,'2025-08-07',1,1449000,25000,1424000,'Credit Card'),
(5,8,240,'2025-08-18',1,1875000,30000,1845000,'Online');

INSERT INTO sales (dealer_id, car_id, customer_id, sale_date, quantity, price_per_unit, discount, total_amount, payment_mode) VALUES
(1,1,245,'2025-03-01',1,659000,9000,650000,'Cash'),
(2,2,248,'2025-03-10',2,1115000,20000,2210000,'Loan'),
(3,3,252,'2025-03-23',1,859000,10000,849000,'Credit Card'),
(4,4,257,'2025-04-07',1,829000,15000,814000,'Online'),
(5,5,260,'2025-04-21',1,580000,8000,572000,'Cash'),
(1,6,263,'2025-05-04',1,1025000,20000,1005000,'Loan'),
(2,7,266,'2025-05-19',1,1449000,25000,1424000,'EMI'),
(3,8,270,'2025-06-01',1,1875000,30000,1845000,'Credit Card'),
(4,1,273,'2025-06-15',2,659000,10000,1308000,'Online'),
(5,2,277,'2025-06-30',1,1115000,15000,1100000,'Cash'),
(1,3,280,'2025-07-14',1,859000,10000,849000,'Loan'),
(2,4,283,'2025-07-29',1,829000,10000,819000,'EMI'),
(3,5,287,'2025-08-09',1,580000,8000,572000,'Credit Card'),
(4,6,289,'2025-08-22',1,1025000,15000,1010000,'Online'),
(5,7,292,'2025-09-04',1,1449000,30000,1419000,'Cash'),
(1,8,295,'2025-09-17',1,1875000,25000,1850000,'Loan'),
(2,1,298,'2025-09-29',1,659000,9000,650000,'EMI'),
(3,2,300,'2025-10-04',1,1115000,15000,1100000,'Credit Card'),
(4,3,297,'2025-10-07',1,859000,10000,849000,'Online'),
(5,4,293,'2025-10-10',2,829000,15000,1643000,'Loan'),
(1,5,288,'2025-10-13',1,580000,8000,572000,'Cash'),
(2,6,284,'2025-10-15',1,1025000,15000,1010000,'Credit Card'),
(3,7,281,'2025-10-18',1,1449000,30000,1419000,'Online'),
(4,8,278,'2025-10-20',1,1875000,25000,1850000,'Cash'),
(5,1,275,'2025-10-23',1,659000,9000,650000,'EMI'),
(1,2,272,'2025-10-25',2,1115000,20000,2210000,'Loan'),
(2,3,269,'2025-10-27',1,859000,10000,849000,'Credit Card'),
(3,4,265,'2025-10-29',1,829000,15000,814000,'Online'),
(4,5,262,'2025-10-30',1,580000,8000,572000,'Cash'),
(5,6,259,'2025-10-31',1,1025000,20000,1005000,'Loan'),
(1,7,256,'2025-11-01',1,1449000,30000,1419000,'EMI'),
(2,8,254,'2025-11-02',1,1875000,25000,1850000,'Online'),
(3,1,251,'2025-11-03',1,659000,9000,650000,'Credit Card'),
(4,2,249,'2025-11-04',1,1115000,15000,1100000,'Cash'),
(5,3,246,'2025-11-05',2,859000,20000,1698000,'Loan'),
(1,4,243,'2025-11-06',1,829000,10000,819000,'Online'),
(2,5,239,'2025-11-07',1,580000,8000,572000,'EMI'),
(3,6,236,'2025-11-08',1,1025000,20000,1005000,'Cash'),
(4,7,232,'2025-11-09',1,1449000,25000,1424000,'Credit Card'),
(5,8,228,'2025-11-10',1,1875000,30000,1845000,'Online'),
(1,1,225,'2025-11-11',1,659000,9000,650000,'Loan'),
(2,2,221,'2025-11-12',1,1115000,15000,1100000,'Cash'),
(3,3,218,'2025-11-13',2,859000,20000,1698000,'EMI'),
(4,4,215,'2025-11-14',1,829000,10000,819000,'Online'),
(5,5,211,'2025-11-15',1,580000,8000,572000,'Credit Card'),
(1,6,207,'2025-11-16',1,1025000,20000,1005000,'Loan'),
(2,7,204,'2025-11-17',1,1449000,30000,1419000,'Cash'),
(3,8,201,'2025-11-18',1,1875000,25000,1850000,'EMI');

INSERT INTO review (customer_id, car_id, review_date, rating, sentiment) VALUES
(1,1,'2024-03-01',5,'Positive'),
(2,2,'2024-03-05',4,'Positive'),
(3,3,'2024-03-10',5,'Positive'),
(4,4,'2024-03-12',3,'Neutral'),
(5,5,'2024-03-14',4,'Positive'),
(6,6,'2024-03-17',5,'Positive'),
(7,7,'2024-03-19',4,'Positive'),
(8,8,'2024-03-22',5,'Positive'),
(9,1,'2024-03-24',4,'Positive'),
(10,2,'2024-03-26',3,'Neutral'),
(11,3,'2024-03-28',5,'Positive'),
(12,4,'2024-03-30',4,'Positive'),
(13,5,'2024-04-01',5,'Positive'),
(14,6,'2024-04-02',3,'Neutral'),
(15,7,'2024-04-04',2,'Negative'),
(16,8,'2024-04-06',4,'Positive'),
(17,1,'2024-04-08',5,'Positive'),
(18,2,'2024-04-10',5,'Positive'),
(19,3,'2024-04-12',3,'Neutral'),
(20,4,'2024-04-14',4,'Positive'),
(21,5,'2024-04-16',2,'Negative'),
(22,6,'2024-04-18',5,'Positive'),
(23,7,'2024-04-20',4,'Positive'),
(24,8,'2024-04-22',3,'Neutral'),
(25,1,'2024-04-24',5,'Positive'),
(26,2,'2024-04-26',4,'Positive'),
(27,3,'2024-04-28',3,'Neutral'),
(28,4,'2024-04-30',4,'Positive'),
(29,5,'2024-05-01',5,'Positive'),
(30,6,'2024-05-02',2,'Negative'),
(31,7,'2024-05-03',4,'Positive'),
(32,8,'2024-05-04',5,'Positive'),
(33,1,'2024-05-05',3,'Neutral'),
(34,2,'2024-05-06',4,'Positive'),
(35,3,'2024-05-07',5,'Positive'),
(36,4,'2024-05-08',4,'Positive'),
(37,5,'2024-05-09',3,'Neutral'),
(38,6,'2024-05-10',4,'Positive'),
(39,7,'2024-05-11',5,'Positive'),
(40,8,'2024-05-12',4,'Positive'),
(41,1,'2024-05-13',5,'Positive'),
(42,2,'2024-05-14',3,'Neutral'),
(43,3,'2024-05-15',5,'Positive'),
(44,4,'2024-05-16',2,'Negative'),
(45,5,'2024-05-17',4,'Positive'),
(46,6,'2024-05-18',5,'Positive'),
(47,7,'2024-05-19',3,'Neutral'),
(48,8,'2024-05-20',4,'Positive'),
(49,1,'2024-05-21',5,'Positive'),
(50,2,'2024-05-22',4,'Positive'),
(51,3,'2024-05-23',5,'Positive'),
(52,4,'2024-05-24',3,'Neutral'),
(53,5,'2024-05-25',4,'Positive'),
(54,6,'2024-05-26',5,'Positive'),
(55,7,'2024-05-27',3,'Neutral'),
(56,8,'2024-05-28',4,'Positive'),
(57,1,'2024-05-29',5,'Positive'),
(58,2,'2024-05-30',4,'Positive'),
(59,3,'2024-05-31',3,'Neutral'),
(60,4,'2024-06-01',4,'Positive'),
(61,5,'2024-06-02',5,'Positive'),
(62,6,'2024-06-03',4,'Positive'),
(63,7,'2024-06-04',5,'Positive'),
(64,8,'2024-06-05',3,'Neutral'),
(65,1,'2024-06-06',4,'Positive'),
(66,2,'2024-06-07',2,'Negative'),
(67,3,'2024-06-08',5,'Positive'),
(68,4,'2024-06-09',4,'Positive'),
(69,5,'2024-06-10',3,'Neutral'),
(70,6,'2024-06-11',5,'Positive'),
(71,7,'2024-06-12',4,'Positive'),
(72,8,'2024-06-13',5,'Positive'),
(73,1,'2024-06-14',3,'Neutral'),
(74,2,'2024-06-15',4,'Positive'),
(75,3,'2024-06-16',5,'Positive'),
(76,4,'2024-06-17',4,'Positive'),
(77,5,'2024-06-18',3,'Neutral'),
(78,6,'2024-06-19',5,'Positive'),
(79,7,'2024-06-20',4,'Positive'),
(80,8,'2024-06-21',5,'Positive'),
(81,1,'2024-06-22',3,'Neutral'),
(82,2,'2024-06-23',5,'Positive'),
(83,3,'2024-06-24',4,'Positive'),
(84,4,'2024-06-25',5,'Positive'),
(85,5,'2024-06-26',3,'Neutral'),
(86,6,'2024-06-27',4,'Positive'),
(87,7,'2024-06-28',5,'Positive'),
(88,8,'2024-06-29',5,'Positive'),
(89,1,'2024-06-30',4,'Positive'),
(90,2,'2024-07-01',5,'Positive'),
(91,3,'2024-07-02',3,'Neutral'),
(92,4,'2024-07-03',4,'Positive'),
(93,5,'2024-07-04',5,'Positive'),
(94,6,'2024-07-05',3,'Neutral'),
(95,7,'2024-07-06',4,'Positive'),
(96,8,'2024-07-07',5,'Positive'),
(97,1,'2024-07-08',4,'Positive'),
(98,2,'2024-07-09',3,'Neutral'),
(99,3,'2024-07-10',5,'Positive'),
(100,4,'2024-07-11',4,'Positive');
------------
SELECT COUNT(*) FROM sales;   
SELECT COUNT(*) FROM review;
------------
SELECT 
    d.dealer_name AS Dealership,
    d.city AS City,
    SUM(s.total_amount) AS Total_Revenue,
    COUNT(s.sale_id) AS Total_Sales
FROM sales s
JOIN dealership d ON s.dealer_id = d.dealer_id
GROUP BY d.dealer_name, d.city
ORDER BY Total_Revenue DESC;
------------
SELECT 
    c.model_name AS Car_Model,
    COUNT(s.sale_id) AS Units_Sold,
    SUM(s.total_amount) AS Total_Sales_Value
FROM sales s
JOIN car_model c ON s.car_id = c.car_id
GROUP BY c.model_name
ORDER BY Units_Sold DESC
LIMIT 5;
----------
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS Month,
    SUM(s.total_amount) AS Monthly_Revenue,
    COUNT(s.sale_id) AS Total_Sales
FROM sales s
GROUP BY Month
ORDER BY Month;
------------
SELECT 
    d.city,
    SUM(s.total_amount) AS Total_Revenue,
    COUNT(s.sale_id) AS Total_Sales
FROM sales s
JOIN dealership d ON s.dealer_id = d.dealer_id
GROUP BY d.city
ORDER BY Total_Revenue DESC;
-----------
SELECT 
    c.category AS Car_Category,
    SUM(s.total_amount) AS Total_Sales,
    COUNT(s.sale_id) AS Units_Sold
FROM sales s
JOIN car_model c ON s.car_id = c.car_id
GROUP BY c.category
ORDER BY Total_Sales DESC;
--------
SELECT 
    ROUND(AVG(total_amount), 2) AS Avg_Sale_Value
FROM sales;
-------
SELECT 
    payment_mode,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(total_amount), 2) AS Total_Value
FROM sales
GROUP BY payment_mode
ORDER BY Total_Value DESC;
------------
SELECT 
    ROUND(AVG(discount), 2) AS Avg_Discount,
    ROUND(SUM(total_amount), 2) AS Total_Sales,
    ROUND(SUM(discount)/SUM(total_amount)*100, 2) AS Discount_Percentage
FROM sales;
-------------
SELECT 
    c.model_name AS Car_Model,
    ROUND(AVG(r.rating), 2) AS Avg_Rating,
    COUNT(r.review_id) AS Review_Count
FROM review r
JOIN car_model c ON r.car_id = c.car_id
GROUP BY c.model_name
ORDER BY Avg_Rating DESC;
---------------
SELECT 
    sentiment,
    COUNT(*) AS Total_Reviews,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM review), 2) AS Percentage
FROM review
GROUP BY sentiment;
----------------
SELECT 
    c.city,
    ROUND(AVG(r.rating), 2) AS Avg_Rating,
    COUNT(r.review_id) AS Total_Reviews
FROM review r
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.city
ORDER BY Avg_Rating DESC;
-----------------
SELECT 
    cu.customer_name,
    cu.city,
    ROUND(SUM(s.total_amount), 2) AS Total_Spent
FROM sales s
JOIN customer cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_name, cu.city
ORDER BY Total_Spent DESC
LIMIT 5;
------------------
SELECT 
    YEAR(s.sale_date) AS Year,
    SUM(s.total_amount) AS Total_Revenue,
    COUNT(s.sale_id) AS Total_Transactions
FROM sales s
GROUP BY YEAR(s.sale_date)
ORDER BY Year;
------------
SELECT 
    d.dealer_name,
    ROUND(AVG(r.rating), 2) AS Avg_Rating
FROM review r
JOIN sales s ON r.customer_id = s.customer_id
JOIN dealership d ON s.dealer_id = d.dealer_id
GROUP BY d.dealer_name
ORDER BY Avg_Rating DESC;
----------------
SELECT 
    c.model_name,
    ROUND(SUM(s.total_amount) / (SELECT SUM(total_amount) FROM sales) * 100, 2) AS Revenue_Share_Percentage
FROM sales s
JOIN car_model c ON s.car_id = c.car_id
GROUP BY c.model_name
ORDER BY Revenue_Share_Percentage DESC;
----------------
SELECT 
    c.model_name,
    COUNT(s.sale_id) AS Units_Sold,
    SUM(s.total_amount) AS Total_Revenue,
    ROUND(AVG(r.rating), 2) AS Avg_Rating,
    ROUND(SUM(s.total_amount) / COUNT(s.sale_id), 2) AS Avg_Sale_Value
FROM sales s
JOIN car_model c ON s.car_id = c.car_id
LEFT JOIN review r ON s.car_id = r.car_id
GROUP BY c.model_name
ORDER BY Total_Revenue DESC;
-----------------
SELECT 
    -- 1️⃣ Overall KPIs
    (SELECT COUNT(s.sale_id) FROM sales s) AS Total_Sales_Transactions,
    (SELECT SUM(s.quantity) FROM sales s) AS Total_Cars_Sold,
    CONCAT('₹', FORMAT(SUM(s.total_amount), 0)) AS Total_Revenue,
    CONCAT('₹', FORMAT(AVG(s.total_amount), 0)) AS Avg_Sale_Value,
    
    -- 2️⃣ Top Dealership by Revenue
    (SELECT d.dealer_name 
     FROM sales s2 
     JOIN dealership d ON s2.dealer_id = d.dealer_id 
     GROUP BY d.dealer_name 
     ORDER BY SUM(s2.total_amount) DESC 
     LIMIT 1) AS Top_Dealership,

    -- 3️⃣ Best-Selling Car Model
    (SELECT c.model_name 
     FROM sales s3 
     JOIN car_model c ON s3.car_id = c.car_id 
     GROUP BY c.model_name 
     ORDER BY COUNT(s3.sale_id) DESC 
     LIMIT 1) AS Best_Selling_Model,

    -- 4️⃣ Average Customer Rating
    ROUND((SELECT AVG(r.rating) FROM review r), 2) AS Avg_Rating,

    -- 5️⃣ Positive Sentiment %
    ROUND((SELECT COUNT(*) 
           FROM review r 
           WHERE r.sentiment = 'Positive') * 100.0 / 
          (SELECT COUNT(*) FROM review), 2) AS Positive_Sentiment_Percentage,

    -- 6️⃣ Yearly Revenue Breakdown
    CONCAT('₹', FORMAT(SUM(CASE WHEN YEAR(s.sale_date) = 2024 THEN s.total_amount ELSE 0 END), 0)) AS Revenue_2024,
    CONCAT('₹', FORMAT(SUM(CASE WHEN YEAR(s.sale_date) = 2025 THEN s.total_amount ELSE 0 END), 0)) AS Revenue_2025,

    -- 7️⃣ Growth %
    ROUND(
        (SUM(CASE WHEN YEAR(s.sale_date) = 2025 THEN s.total_amount ELSE 0 END) -
         SUM(CASE WHEN YEAR(s.sale_date) = 2024 THEN s.total_amount ELSE 0 END))
         / NULLIF(SUM(CASE WHEN YEAR(s.sale_date) = 2024 THEN s.total_amount ELSE 0 END), 0) * 100, 2
    ) AS Revenue_Growth_Percentage

FROM sales s;
------------
-------GRAPHICAL ------
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS Month,
    SUM(s.total_amount) AS Total_Revenue
FROM sales s
GROUP BY Month
ORDER BY Month;
----------------
SELECT 
    d.city AS City,
    SUM(s.total_amount) AS Total_Revenue,
    COUNT(s.sale_id) AS Total_Transactions
FROM sales s
JOIN dealership d ON s.dealer_id = d.dealer_id
GROUP BY d.city
ORDER BY Total_Revenue DESC;
---------------
CREATE OR REPLACE VIEW maruti_dashboard_graph_view AS
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS Month,
    d.city AS City,
    c.model_name AS Car_Model,
    s.payment_mode,
    r.sentiment,
    SUM(s.total_amount) AS Total_Revenue,
    ROUND(AVG(r.rating), 2) AS Avg_Rating
FROM sales s
JOIN dealership d ON s.dealer_id = d.dealer_id
JOIN car_model c ON s.car_id = c.car_id
LEFT JOIN review r ON s.car_id = r.car_id
GROUP BY Month, City, Car_Model, s.payment_mode, r.sentiment
ORDER BY Month;
------------------
