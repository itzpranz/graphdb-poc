CREATE TABLE transaction (
   id                   VARCHAR(256) NOT NULL PRIMARY KEY
  ,merchant_id          VARCHAR(36) NOT NULL
  ,recipient_account_id VARCHAR(256) NOT NULL
  ,sender_account_id    VARCHAR(256) NOT NULL
  ,amount              NUMERIC(15,2) NOT NULL
  ,transaction_date    TIMESTAMP WITH TIME ZONE  NOT NULL
);


-- Data import completed in 16.969s