LOAD CSV WITH HEADERS FROM 'file:///address.csv' AS add
MERGE (ad: Address {
    id: add.id,
    city: add.city,
    country: add.country,
    pincode: add.pincode
    });
// Added 500 labels, created 500 nodes, set 2000 properties, completed after 165 ms.



LOAD CSV WITH HEADERS FROM 'file:///individual.csv' AS ind
MATCH (a: Address {id: ind.address_id})
MERGE (i: Individual {
    id: ind.id,
    name: ind.name,
    email: ind.email,
    phone: ind.phone,
    nationality: ind.nationality,
    dateOfBirth: ind.date_of_birth
    })-[:ADDRESS]->(a);
// Added 500 labels, created 500 nodes, set 3000 properties, created 500 relationships, completed after 445 ms.

LOAD CSV WITH HEADERS FROM 'file:///merchant.csv' AS mer
MATCH (i: Individual {id: mer.owner_id})
MERGE (m: Merchant {
    id: mer.id,
    goLiveDate: datetime(mer.go_live_date),
    name: mer.name,
    email: mer.email,
    phone: mer.phone
    })-[:MERCHANT_OWNER]->(i)
MERGE (i)-[:OWNS_BUSINESS]->(m);
// Added 10 labels, created 10 nodes, set 50 properties, created 20 relationships, completed after 145 ms.



LOAD CSV WITH HEADERS FROM 'file:///account.csv' AS acc
MATCH (i: Individual {id: acc.owner_id})
MERGE (a: Account {
    id: acc.id,
    type: acc.type,
    bankCode: acc.bank_code,
    accountNumber: acc.account_number,
    createdDate: datetime(acc.created_date)
    })-[:ACCOUNT_OWNER]->(i)
MERGE (i)-[:OWNS_ACCOUNT]->(a);
// Added 1000 labels, created 1000 nodes, set 5000 properties, created 2000 relationships, completed after 476 ms.

LOAD CSV WITH HEADERS FROM 'file:///transaction.csv' AS txn
MATCH (m: Merchant {id: txn.merchant_id})
MATCH (sender: Individual { id: txn.sender_account_id})
MATCH (recipient: Individual { id: txn.recipient_account_id})
MERGE (t: Transaction {
    id: txn.id,
    merchantId: txn.merchant_id,
    recipientAccountId: txn.recipient_account_id,
    senderAccountId: txn.sender_account_id,
    amount: toInteger(txn.amount),
    transactionDate: datetime(txn.transaction_date)
    })-[:CREATED_BY]->(m)
MERGE (m)-[:CREATED_TXN]->(t)
MERGE (t)-[:SENT_BY]->(sender)
MERGE (sender)-[:SENT_TXN]->(t)
MERGE (t)-[:RECIEVED_BY]->(recipient)
MERGE (recipient)-[:RECIEVED_TXN]->(t);
// Added 74021 labels, created 74021 nodes, set 444126 properties, created 444126 relationships, completed after 832891 ms.
