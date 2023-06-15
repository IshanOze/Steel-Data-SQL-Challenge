-- What are the names of all the customers who live in New York?

select concat(FirstName, ' ', LastName)
from customers
where state = 'NY';

-- What is the total number of accounts in the Accounts table?

select count(AccountId) as accounts
from accounts;

-- What is the total balance of all checking accounts?

select sum(balance) as balance
from accounts
where AccountType = 'Checking';

-- What is the total balance of all accounts associated with customers who live in Los Angeles?

select sum(balance) as balannce
from accounts, customers
where accounts.CustomerId = customers.CustomerId
and City = 'Los Angeles';

-- Which branch has the highest average account balance?

select branches.BranchID, avg(balance) as avg_balance
from accounts, branches
where accounts.BranchID = branches.BranchID
group by branches.BranchID
order by avg_balance desc limit 1;

-- Which customer has the highest current balance in their accounts?

select concat(FirstName, ' ', LastName) as name, sum(balance) as balance
from accounts, customers
where accounts.CustomerID = customers.CustomerID
group by name
order by balance desc limit 1;

-- Which customer has made the most transactions in the Transactions table?

select transactions.AccountID, count(TransactionID) as transactions
from transactions, accounts
where accounts.AccountID = transactions.AccountID
group by transactions.AccountID
order by transactions desc limit 1;

-- Which branch has the highest total balance across all of its accounts?

select branches.branchID, sum(balance) as balance
from accounts, branches
where accounts.BranchID = branches.BranchID
group by branches.BranchID
order by balance desc limit 1;


-- Which customer has the highest total balance across all of their accounts, including savings and checking accounts?

select customers.CustomerID, concat(FirstName, ' ', LastName) as name, sum(balance) as balance
from accounts, customers
where customers.CustomerID = accounts.CustomerID
group by CustomerID
order by balance desc limit 1;

-- Which branch has the highest number of transactions in the Transactions table?

select branches.BranchID, branches.BranchName, count(TransactionID) as transactions
from transactions, accounts, branches
where transactions.AccountID = accounts.AccountID and branches.BranchID = accounts.BranchID
group by branches.BranchID
order by transactions desc limit 1;
