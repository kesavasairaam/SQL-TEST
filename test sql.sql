create database sql1;
use sql1;
 #1st
SELECT Customer.cust_name AS "Customer",
Customer.grade AS "Grade",Orders.ord_no AS "Order No."
FROM Orders, Salesman, Customer
WHERE Orders.customer_id = Customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND Salesman.city IS NOT NULL
AND Customer.grade IS NOT NULL;
#2nd
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders 
WHERE salesman_id IN(SELECT salesman_id 
FROM salesman
WHERE commision = (SELECT MAX(commision) 
FROM salesman));
#3rd
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN (SELECT salesman_id FROM salesman WHERE city='nagpur');
#4th
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date;
#5th
SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders);
#6th
select purch_amt from orders order by purch_amt desc
 limit 1
 offset 4;
#8th
Select customer_id , ba.account_number,
Case when ifnull(balance_amount,0) = 0 then   Transaction_amount else balance_amount end  as balance_amount
from Bank_Account_Details ba  
inner join
bank_account_transaction bat
on ba.account_number = bat.account_number
and account_type = "Credit Card";
#9th
Select bank_account_details.account_number, balance_amount, transaction_amount
from bank_account_details inner join bank_account_transaction on bank_account_details.account_number = bank_account_transaction.account_number
And (date_format(Transaction_Date , '%Y-%m')  between "2020-03" and "2020-04");
#10th
Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba  
Left join bank_account_transaction bat
on ba.account_number = bat.account_number
And NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );