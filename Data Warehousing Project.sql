CREATE TABLE CustomerReview (
  CustomerID int NOT NULL,
  YearMonthDate DATE NOT NULL,
  Review NUMERIC(10,5),
  Feedback varchar(255),
  PRIMARY KEY (CustomerID,YearMonthDate)
  );
CREATE TABLE MerchantReview (
  MerchantID int NOT NULL,
  YearMonthDate DATE NOT NULL,
  Review NUMERIC(10,5),
  Feedback varchar(255),
  PRIMARY KEY (MerchantID,YearMonthDate)
  );
CREATE TABLE CustomerInfo (
  CustomerID int NOT NULL,
  CustomerName varchar(255) NOT NULL,
  YMD DATE, 	
  LoginStamp DATETIME NOT NULL,
  LogoutStamp DATETIME,
  City varchar(255),
  IpAddress	varchar(255),
  State varchar(255),
  PRIMARY KEY (CustomerID,LoginStamp)
  );

CREATE TABLE MerchantInfo (
  MerchantID int NOT NULL,
  MerchantName varchar(255) NOT NULL,
  YearMonthDate DATE NOT NULL,
  ContractStartYear int,
  ContractEndYear int,
  Sales NUMERIC(10,5),
  PRIMARY KEY (MerchantID,YearMonthDate)
  );

  
INSERT INTO MerchantReview VALUES (2000000001, '3/1/13',5,'thank you!');
INSERT INTO MerchantReview VALUES (2000000002, '3/1/13',4,'well done');
INSERT INTO MerchantReview VALUES (2000000003, '3/1/13',4,'nice cooperation');
INSERT INTO MerchantReview VALUES (2000000004, '3/1/13',4,'Good job');
INSERT INTO MerchantReview VALUES (2000000005, '3/1/13',4,'decent increae in sales');
INSERT INTO MerchantReview VALUES (2000000001, '3/1/11',4,'moderate improvement');
INSERT INTO MerchantReview VALUES (2000000001, '3/1/12',4,'thanks!');


INSERT INTO CustomerReview VALUES (1000000001,'3/1/13',4,'love it!');
INSERT INTO CustomerReview VALUES (1000000004,'3/1/13',4,'Useful app, pls add more selection of furnitures.');
INSERT INTO CustomerReview VALUES (1000000005,'3/1/13',5,'Huge help in finding the furniture I want. Please add more suppliers.');
INSERT INTO CustomerReview VALUES (1000000006,'3/2/13',2,'Not good matching!');
INSERT INTO CustomerReview VALUES (1000000007,'3/2/13',3,'no comment');
INSERT INTO CustomerReview VALUES (1000000009,'3/2/13',5,'Best ever!');
INSERT INTO CustomerReview VALUES (1000000007,'3/3/13',3,'Not helpful');
INSERT INTO CustomerReview VALUES (1000000008,'3/3/13',4,'I like it.');
INSERT INTO CustomerReview VALUES (1000000009,'3/3/13',3,'Copying the other app.');
INSERT INTO CustomerReview VALUES (1000000010,'3/3/13',5,'Great!');


INSERT INTO CustomerInfo VALUES (1000000001,'Harry Smith','3/1/13','3/1/13 12:10','3/1/13 12:30','Chicago','47.71.133.50','IL');
INSERT INTO CustomerInfo VALUES (1000000002,'Ian Wicker','3/1/13','3/1/13 14:00','3/1/13 15:00','New York','154.169.160.246','NY');
INSERT INTO CustomerInfo VALUES (1000000003,'Jennifer Hans','3/1/13','3/1/13 1:00','3/1/13 3:00','Seattle','27.73.52.99','WA');
INSERT INTO CustomerInfo VALUES (1000000004,'Emma Lee','3/2/13','3/2/13 17:00','3/2/13 19:00','Boston','162.124.60.50','MA');
INSERT INTO CustomerInfo VALUES (1000000005,'Sara Wunder','3/2/13','3/2/13 12:00','3/2/13 12:30','Washington D.C.','239.163.170.124','DC');
INSERT INTO CustomerInfo VALUES (1000000006,'Karissa Livoir','3/2/13','3/2/13 14:10','3/2/13 14:30','Springfield','119.186.183.95','IL');
INSERT INTO CustomerInfo VALUES (1000000007,'Jeddy Livoir','3/2/13','3/2/13 15:00','3/2/13 16:30','Philadelphia','102.215.89.162','PA');
INSERT INTO CustomerInfo VALUES (1000000009,'Caye Koch','3/2/13','3/2/13 15:10','3/2/13 15:40','Los Angeles','187.241.88.185','CA');
INSERT INTO CustomerInfo VALUES (1000000007,'Jeddy Livoir','3/3/13','3/3/13 16:30','3/3/13 17:30','Philadelphia','102.215.89.162','PA');
INSERT INTO CustomerInfo VALUES (1000000008,'Jacod Gerard','3/3/13','3/3/13 15:30','3/3/13 18:30','Houston','194.54.132.145','TX');
INSERT INTO CustomerInfo VALUES (1000000009,'Caye Koch','3/3/13','3/3/13 0:10','3/3/13 1:30','Los Angeles','187.241.88.185','CA');
INSERT INTO CustomerInfo VALUES (1000000010,'Ruth Dirr','3/3/13','3/3/13 2:00','3/3/13 3:30','San Diego','218.227.116.129','CA');



INSERT INTO MerchantInfo VALUES (2000000001,'Furniture Market','3/1/13',2011,2015,5000);
INSERT INTO MerchantInfo VALUES (2000000002,'Vans','3/1/13',2014,2016,100);
INSERT INTO MerchantInfo VALUES (2000000003,'PopArt','3/1/13',2013,2015,300);
INSERT INTO MerchantInfo VALUES (2000000004,'V Sale','3/2/13',2014,2015,2000);
INSERT INTO MerchantInfo VALUES (2000000005,'Home Style','3/2/13',2013,2016,1000);
INSERT INTO MerchantInfo VALUES (2000000003,'PopArt','3/2/13',2013,2015,500);
INSERT INTO MerchantInfo VALUES (2000000001,'Furniture Market','3/3/13',2013,2015,1000);
INSERT INTO MerchantInfo VALUES (2000000002,'Vans','3/3/13',2014,2016,300);
INSERT INTO MerchantInfo VALUES (2000000004,'V Sale','3/3/13',2014,2015,1000);
INSERT INTO MerchantInfo VALUES (2000000005,'Home Style','3/3/13',2013,2016,500);


CREATE TABLE SalesFact (
  MerchantID int NOT NULL,
  YearMonthDate DATE NOT NULL,
  DailyTotalSales NUMERIC(10,5),
  DailyCustomerNo int,
  PRIMARY KEY (MerchantID,YearMonthDate)
   );

INSERT INTO SalesFact
SELECT MerchantID,YearMonthDate,DailyTotalSales,DailyCustomerNo
FROM (
SELECT MerchantID, YearMonthDate, SUM(Sales) AS DailyTotalSales FROM MerchantInfo 
GROUP BY MerchantID, YearMonthDate
)t1
LEFT JOIN
(
SELECT YMD,COUNT(DISTINCT CustomerID) AS DailyCustomerNo FROM CustomerInfo 
GROUP BY YMD
)t2
ON t2.YMD=t1.YearMonthDate

/*return tables */
SELECT * FROM CustomerInfo;
SELECT * FROM CustomerReview;
SELECT * FROM MerchantInfo;
SELECT * FROM MerchantReview;
SELECT * FROM SalesFact;

/*return kpi: DACS */
SELECT MerchantID, YearMonthDate, DailyTotalSales/DailyCustomerNo AS DailyAveragedCustomerSales FROM SalesFact;

/*return kpi:DailyCustomerNo,MinPerDay  */
SELECT YMD,COUNT(DISTINCT CustomerID) AS DailyCustomerNo FROM CustomerInfo 
GROUP BY YMD;
SELECT YMD, SUM(DATEDIFF(MINUTE,LoginStamp,LogoutStamp)) AS MinPerDay FROM CustomerInfo 
GROUP BY YMD;

SELECT YMD, COUNT(DISTINCT CustomerID) AS DailyCustomerNo, 
SUM(DATEDIFF(MINUTE,LoginStamp,LogoutStamp)) AS MinPerDay FROM CustomerInfo 
GROUP BY YMD;

/*return kpi: AveragedCustomerTime spend on app per day */
SELECT a.YMD, a.MinPerDay/a.DailyCustomerNo AS AveragedCustomerTime 
FROM(
SELECT YMD, COUNT(DISTINCT CustomerID) AS DailyCustomerNo, 
SUM(DATEDIFF(MINUTE,LoginStamp,LogoutStamp)) AS MinPerDay
FROM CustomerInfo
GROUP BY YMD)a

/*return kpi: NewContracts number by year */
SELECT ContractStartYear AS C_YEAR,COUNT(DISTINCT MerchantID) AS NewContracts FROM MerchantInfo 
GROUP BY ContractStartYear; 
/*return kpi: AveragedMerchantSales daily */
SELECT a.YearMonthDate, a.DailyTotalSales/a.DailyMerchantNo AS AveragedMerchantSales 
FROM(
SELECT COUNT(DISTINCT MerchantID) AS DailyMerchantNo, YearMonthDate, SUM(Sales) AS DailyTotalSales 
FROM MerchantInfo 
GROUP BY YearMonthDate)a; 

/*return kpi: Average CustomerReview BY DAY */
SELECT YearMonthDate, SUM(Review)/COUNT(CustomerID) AS AveragedCReview 
from CustomerReview GROUP BY YearMonthDate; 

/*return kpi: AveragedMerchantSales daily */
SELECT YearMonthDate, SUM(Review)/COUNT(MerchantID) AS AveragedMReview 
from MerchantReview GROUP BY YearMonthDate; 
/*return kpi: KEY client review */
SELECT * from MerchantReview WHERE MerchantID=2000000001;
