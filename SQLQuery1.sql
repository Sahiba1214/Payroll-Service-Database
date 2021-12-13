/*UC1*/
create database payrollservice1

use payrollservice1

/*UC2*/
create table employee_payroll(id int identity (1,1) primary key, Name varchar(150) NOT NULL, Salary float NOT NULL, Start date NOT NULL);
exec sp_help employee_payroll;

/*UC3*/
insert into employee_payroll(Name,Salary,Start) values
( 'Sahiba', 400000, '2021-07-15'),
( 'Mantasha', 300000, '2021-10-13'),
( 'Kashish', 280000, '2021-05-25'),
( 'Enayat', 480000, '2021-09-10');