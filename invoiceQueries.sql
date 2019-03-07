SET SQL_SAFE_UPDATES = 0;
/* A query to retrieve the major fields for every person;
*/
SELECT * FROM Person;
/* A query to retrieve the email(s) of a given person
*/
SELECT email FROM Email where personKey = '2';
/* A query to add an email to a specific person
*/
INSERT INTO Email(personKey, email) VALUES (4, 'mstrout@att.net');
SELECT * FROM Email;
/* A query to change the email address of a given email record
*/
UPDATE Email SET email = 'hellfire@verizon.net' where email = 'pfraschinif@studiopress.com';

/* A query (or series of queries) to remove a given person record
*/
DELETE FROM Address where addressKey = 9;
DELETE FROM Email where personKey = 9;
DELETE FROM Person where personKey = 9;

/* A query to create a person record
*/
INSERT INTO Address VALUES (100,'9624 Amherst St.','Chippewa Falls', 'WI','54729', 'USA');
SELECT * FROM Address;
INSERT INTO Email VALUES (30, 'mwitte@sbcglobal.net', 73);
SELECT * FROM Email;
INSERT INTO Person VALUES (73, '415b','Frizk, Allison', 100);
SELECT * FROM Person;
/* A query to get all the products in a particular invoice
*/
SELECT * From InvoiceProductList pl
	JOIN Product p on pl.productKey = p.productKey  where invoiceKey = 2;
/*  A query to get all the invoices of a particular customer
*/
SELECT * From Invoice i 
	JOIN Customer c ON i.customerKey = c.customerKey WHERE c.customerKey = 3 ;
/* A query to create a new product record
*/
INSERT INTO Product(productKey, productCode, productType, productName, unitPrice)
	VALUES (81, '31ts', 'E', 'Cinco Touch Pad', '300.00');
SELECT * From Product;
/* A query to create a new invoice record
*/
INSERT INTO Invoice VALUES (6,'INV006',5,73);
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES (12,6,81,3);
SELECT * FROM Invoice;
SELECT * FROM InvoiceProductList;
/* A query to associate a particular product with a particular invoice
*/
SELECT * FROM Product p 
	JOIN InvoiceProductList ip on p.productKey = ip.productKey 
    JOIN Invoice i on i.invoiceKey = ip.invoiceKey  WHERE ip.listKey = 4;
/* A query to find the total number of invoices foreach(and every) customer record
*/
SELECT c.customerCode, COUNT(i.invoiceCode) totalInvoices FROM Customer c
	LEFT JOIN Invoice i ON c.customerKey = i.customerKey 
    GROUP BY c.customerCode;
/* A query to find the total number of invoices for each salesperson
*/
SELECT p.personCode, COUNT(i.invoiceCode) totalInvoices FROM Person p
	JOIN Invoice i ON p.personKey = i.personKey 
    GROUP BY p.personCode;
/*  A query to find the total number of invoices that include a particular product
*/
SELECT p.productCode, COUNT(ip.productKey) totalInvoices FROM Product p
	JOIN InvoiceProductList ip ON p.productKey = ip.productKey WHERE ip.productKey = 4;
/* A query to find thetotalcost (excluding fees and taxes) of all equipment in each invoice
*/
SELECT i.invoiceCode, SUM(p.unitPrice * ip.units) totalCostOfEquipment FROM InvoiceProductList ip
	JOIN Product p ON ip.productKey = p.productKey 
    JOIN Invoice i ON i.invoiceKey = ip.invoiceKey
    GROUP BY i.invoiceCode;
/* A query to detect invalid datawhich finds any invoice that includes multipleinstances of the same equipment product.
*/ 
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES (13,1,3,4);
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES (14,2,2,8);
SELECT ip.invoiceKey, ip.productKey, COUNT(*) duplicateAmount, i.invoiceCode FROM InvoiceProductList ip
	JOIN Invoice i ON ip.invoiceKey = i.invoiceKey
	GROUP BY invoiceKey, productKey
    HAVING COUNT(*) > 1;
/* A query to find any and all invoices where thesalesperson is the same as the primary contact of the invoice’s customer.
*/
INSERT INTO Invoice VALUES (7,'INV007',6,17);
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES (15,7,6,7);
INSERT INTO Invoice VALUES (8,'INV008',2,4);
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES (16,8,2,6);
SELECT i.invoiceKey, c.personKey, c.customerCode, i.invoiceCode FROM Invoice i 
	JOIN Customer c ON i.personKey = c.personKey;
    





























