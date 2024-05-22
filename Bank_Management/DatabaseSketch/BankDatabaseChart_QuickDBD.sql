-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "BankAccount" (
    "AccountID" varchar(10)   NOT NULL,
    "Name" text   NOT NULL,
    "Email" varchar(90)   NOT NULL,
    "Password" text   NOT NULL,
    "Address" text   NOT NULL,
    "City" text   NOT NULL,
    "State" varchar(2)   NOT NULL,
    "Country" varchar(20)   NOT NULL,
    "Postal" varchar(30)   NOT NULL,
    CONSTRAINT "pk_BankAccount" PRIMARY KEY (
        "AccountID"
     )
);

CREATE TABLE "BankAccountTypes" (
    "AccountID" varchar(10)   NOT NULL,
    "CheckingID" varchar(10)   NULL,
    "SavingID" varchar(10)   NULL,
    "CreditID" varchar(10)   NULL,
    "MoneyMarketID" varchar(10)   NULL,
    "CertDepoID" varchar(10)   NULL,
    "RothIRAID" varchar(10)   NULL,
    CONSTRAINT "pk_BankAccountTypes" PRIMARY KEY (
        "AccountID"
     )
);

CREATE TABLE "AccountBalance" (
    "AccountID" varchar(10)   NOT NULL,
    "Checking" money   NOT NULL,
    "Saving" money   NOT NULL,
    "Credit" money   NOT NULL,
    "MoneyMarket" money   NOT NULL,
    "CertDepo" money   NOT NULL,
    "RothIRA" money   NOT NULL,
    CONSTRAINT "pk_AccountBalance" PRIMARY KEY (
        "AccountID"
     )
);

CREATE TABLE "TransactionHistory" (
    "AccountID" varchar(10)   NOT NULL,
    "AccountTypes" varchar(50)   NOT NULL,
    "TransactionID" varchar(10)   NOT NULL,
    "TransactionMemo" varchar(10)   NOT NULL,
    "Balance" money   NOT NULL,
    CONSTRAINT "pk_TransactionHistory" PRIMARY KEY (
        "AccountID"
     ),
    CONSTRAINT "uc_TransactionHistory_TransactionID" UNIQUE (
        "TransactionID"
    )
);

ALTER TABLE "BankAccountTypes" ADD CONSTRAINT "fk_BankAccountTypes_AccountID" FOREIGN KEY("AccountID")
REFERENCES "BankAccount" ("AccountID");

ALTER TABLE "AccountBalance" ADD CONSTRAINT "fk_AccountBalance_AccountID" FOREIGN KEY("AccountID")
REFERENCES "BankAccount" ("AccountID");

ALTER TABLE "TransactionHistory" ADD CONSTRAINT "fk_TransactionHistory_AccountID" FOREIGN KEY("AccountID")
REFERENCES "BankAccount" ("AccountID");

