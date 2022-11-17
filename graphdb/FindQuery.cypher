// Find Merchant who went live in last one month and calculate amount and count of transcation
MATCH (m: Merchant)-[:CREATED_TXN]->(t: Transaction)
WHERE m.goLiveDate > datetime({ year:2022, month: 9})
RETURN m.name, count(t), sum(t.amount)
// Started streaming 2 records in less than 1 ms and completed after 23 ms.


// Find amount received in an amount
MATCH (a :Account {accountNumber: '4367936589',bankCode: 'BRI'})-[:ACCOUNT_OWNER]->(i)<-[:SENT_BY]-(t: Transaction)
RETURN a, sum(t.amount)
// Started streaming 1 records in less than 1 ms and completed after 3 ms.


// Compare the amount of TPV by in past months by a merchant
MATCH (t1: Transaction)<-[:CREATED_TXN]-(m: Merchant {id: '224e99cd-42a7-43b7-9f65-18cfe897eb25'}) 
WHERE t1.transactionDate > datetime({ year:2022, month: 9})
return apoc.date.format(timestamp(t1.transactionDate), 'ms', 'YYYY-MM') AS month,
       sum(t1.amount) AS tpv
// Started streaming 2 records after 3 ms and completed after 428 ms.