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

/*UC7*/
alter table employee_payroll alter column Salary float;

select sum(Salary) from employee_payroll where Gender='F' group by Gender;
select SUM(Salary) from employee_payroll where Gender='F' group by Gender;

select avg(Salary) from employee_payroll where Gender='F' group by Gender;
select avg(Salary) from employee_payroll where Gender='F' group by Gender;

select min(Salary) from employee_payroll where Gender='F' group by Gender;
select min(Salary) from employee_payroll where Gender='F' group by Gender;

select max(Salary) from employee_payroll where Gender='F' group by Gender;
select max(Salary) from employee_payroll where Gender='F' group by Gender;

select count(Salary) from employee_payroll where Gender='F' group by Gender;
select count(Salary) from employee_payroll where Gender='F' group by Gender;

/*UC8*/
alter table employee_payroll add Phone varchar(16);
alter table employee_payroll add Address varchar(100) default 'TBD';
alter table employee_payroll add Department varchar(50) NOT NULL default ''; 

/*UC9*/
exec sp_rename 'employee_payroll.Salary', 'BasicPay', 'column';
alter table employee_payroll add Deductions float, TaxablePay float, IncomeTax float, NetPay float;
update employee_payroll set Phone='2356409476', Address='Delhi' where Name='Sahiba';
update employee_payroll set Phone='6733448959', Address='Punjab' where Name='Mantasha';
update employee_payroll set Phone='9523456760', Address='Kolkata' where Name='Kashish';
update employee_payroll set Phone='7222227504', Address='Mumbai' where Name='Enayat';
update employee_payroll set Department='Sales', 'Deductions'=1000, 'TaxablePay'=500, IncomeTax=0.1*(BasicPay), NetPay=BasicPay-1500 where Name='Sahiba' or Name='Mantasha';
update employee_payroll set Department='Marketing', Deductions=1500, 'TaxablePay'=500, IncomeTax=0.15*(BasicPay), NetPay=BasicPay-2000 where Name='Enayat' or Name='Kashish';