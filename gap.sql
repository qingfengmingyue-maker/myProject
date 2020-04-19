--**drop table organization;
CREATE TABLE organization
(
orgcode	varchar(10) NOT NULL,
orgname	varchar(100) NOT NULL,
cityname	varchar(100),
citycode	varchar(6) NOT NULL,
upperbaseorg varchar(6) NOT NULL,
upperbaseorgname varchar(100),
creditcode	varchar(20) NOT NULL,
orgshortname	varchar(100),
postcode	varchar(10),
legalperson	varchar(100),
address	varchar(255),
telphone	varchar(20),
faxno	varchar(20),
orglevel	varchar(20),
orgstate	varchar(20),
upperorg	varchar(100),
accountname	varchar(100),
accountno	varchar(20),
bankname	varchar(100),
brandname	varchar(255),
inserttime	timestamp,
operatetime	timestamp,
PRIMARY KEY (orgcode) 
);
--**drop table usermsg;
CREATE TABLE usermsg
(
usercode	varchar(10) not null,
username	varchar(100) not null,
userpwd		varchar(8) not null,
orgcode	varchar(10) not null,
orgname	varchar(100) not null,
telphone	varchar(20),
postflag	char(1),
businesspost	varchar(100),
inserttime	timestamp,
operatetime	timestamp,
PRIMARY KEY (usercode) 
);

--**drop table partya;
CREATE TABLE partya
(
contractno	varchar(17),
orgname	varchar(100),
orgcode	varchar(10) not null,
businesscode	varchar(10),
businessname	varchar(100),
mobile	varchar(20),
PRIMARY KEY (contractno) 
);
--**drop table partyb;
CREATE TABLE partyb
(
contractno	varchar(17),
ownername	varchar(100),
ownermobile	varchar(20),
ownerdress	varchar(200),
documenttype	varchar(2),
documentno	varchar(20),
PRIMARY KEY (contractno) 
);
--**drop table vehiclemsg;
CREATE TABLE vehiclemsg
(
contractno	varchar(17),
purchasedate	date,
carstate	varchar(50),
usernature	varchar(1),
licenseno	varchar(20),
engineno	varchar(30),
vinno   varchar(17),
brandname	varchar(50),
classname	varchar(50),
modelname	varchar(50),
invoiceamount	DECIMAL(14,2),
purchaseamount	DECIMAL(14,2),
insurancetype	varchar(20),
insurancename	varchar(50),
licensefee	DECIMAL(14,2),
taxamount	DECIMAL(14,2),
PRIMARY KEY (contractno) 
);
--**drop table maincontract;
CREATE TABLE  maincontract
(
contractno	varchar(17) not null,
servicetype	varchar(2),
servicedate	char(1),
settleamount	DECIMAL(14,2),
settleprice	DECIMAL(14,2),
startdate	date,
enddate	date,
saleuser	varchar(50),
appendmsg	varchar(2000),
remark	varchar(2000),
policyno varchar(22),
savetype char(1),
operatecode varchar(10),
inserttime	timestamp,
operatetime	timestamp,
PRIMARY KEY (contractno) 
);
--**drop table baseorganization;
CREATE TABLE baseorganization
(
citycode	varchar(6),
cityname	varchar(50),
orglevel	char(1),
uppercode	varchar(6),
inserttime	timestamp,
operatetime	timestamp,
PRIMARY KEY (citycode) 
);
--**drop table vehicleclass;
CREATE TABLE vehicleclass
(
classname	varchar(200),
brandname	varchar(50),
inserttime	timestamp,
operatetime	timestamp,
PRIMARY KEY (classname) 
);
--**drop table regulation;
CREATE TABLE regulation
(
businessno varchar(25),
groupno	varchar(15),
maxno	varchar(10),
inserttime	timestamp,
PRIMARY KEY (businessno)
);
