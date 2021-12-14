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

/*UC4*/
select * from employee_payroll;
/*UC5*/
select Name,Salary from employee_payroll where name = 'Sahiba';
select * from employee_payroll
where start between cast('2021-10-01' as date) and getdate();

/*UC6*/
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender = 'F' where name = 'Sahiba' or name = 'Mantasha' or name = 'Kashish';
update employee_payroll set Gender = 'F' where name = 'Enayat';