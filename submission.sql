--1)Get the username of the person who made the post about EmptyStack in forum_posts.

SELECT * 
FROM forum_posts 
WHERE date BETWEEN '2048-04-01' AND '2048-05-01' 
AND content ILIKE '%emptystack%' 
AND content ILIKE '%dad%';


--2)Get the last name of the person associated with that username in forum_accounts.

SELECT * 
FROM forum_accounts 
WHERE username = 'smart-money-44';

--3)Find all other accounts with the same last name. 

--smart-money-44's name is Brad Steele


SELECT * 
FROM forum_accounts 
WHERE last_name = 'Steele';

-- Other options of last name Steele are Andrew(sharp-engine-57) & Kevin(stinky-tofu-98)

--4)Find all accounts in emptystack_accounts with the same last name.

SELECT * 
FROM emptystack_accounts 
WHERE last_name = 'Steele';

-- Options for last name Steele are Andrew again(triple-cart-38), & Lance(lance-main-11)
-- Andrews password is password456

--5)There will only be one EmptyStack employee with a forum account. 
--Use their credentials to access node mainframe, which will output a new sql file for you to run.

--psql -f emptystack.sql
-- \l
-- \c mainframe-override
-- \d
-- \d emptystack_messages

--6)Find the message in emptystack_messages that mentions a project involving self-driving taxis. 
--That message is sent from an admin account and also reveals the project code.

SELECT * 
FROM emptystack_messages 
WHERE body ILIKE '%taxi%' 
OR body ILIKE '%project%';

-- message:  LidWj | your-boss-99 | triple-cart-38 | Project TAXI | 
--Deploy Project TAXI by end of week. We need this out ASAP.

--7)Get the credentials for the admin account from emptystack_accounts.

SELECT * 
FROM emptystack_accounts 
WHERE username = 'your-boss-99';

--Skylar Singer u: your-boss-99 p: notagaincarter

--8)Get the ID of the project from emptystack_projects.

SELECT * 
FROM emptystack_projects 
WHERE code = 'TAXI';

-- id: DczE0v2b

--9)Use that information to stop the project: node mainframe -stop!

sarahhopp717@Sarahs-MacBook-Air mainframe-override % node mainframe -stop
WARNING: admin access required. Unauthorized access will be logged.
Username: your-boss-99
Password: notagaincarter
Welcome, your-boss-99.
Project ID: DczE0v2b
Initiating project shutdown sequence...
5...
4...
3...
2...
1...
Project shutdown complete.
sarahhopp717@Sarahs-MacBook-Air mainframe-override % 
