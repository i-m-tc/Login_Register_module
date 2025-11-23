 -- work with the database project 1--
 create database login_auth_aug;
 show tables;
 use login_auth_aug;
 CREATE TABLE cust_details (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    address VARCHAR(300) NOT NULL,
    ph_no BIGINT NOT NULL,
    userid VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL
)AUTO_INCREMENT=1;
 select * from cust_details;
 delete from cust_Details where cust_id=15;
 INSERT INTO cust_details (full_name, address, ph_no, userid, password)
VALUES ('Rahul Sharma', '221B Baker Street, Mumbai', 9876543210, 'rahul.sharma', 'Pass@123');
select * from cust_details where userid='test12';
truncate table cust_Details;