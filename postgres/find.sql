select
	m."name",
	count(t.id),
	sum(t.amount)
from
	merchant m 
left join 
	"transaction" t 
on 
	t.merchant_id = m.id 
where 
	go_live_date > date '2022-09-01'
group  by m.id;

-- Node Type	Entity	Cost	Rows	Time	Condition
-- Aggregate	[NULL]	2878.72 - 2878.89	2	1807.505	[NULL]
-- Hash Join	[NULL]	10.66 - 2634.97	19984	1639.304	((t.merchant_id)::text = (m.id)::text)
-- Seq Scan	transaction	0.00 - 2334.00	100000	726.485	[NULL]
-- Hash	[NULL]	10.50 - 10.50	2	0.070	[NULL]
-- Seq Scan	merchant	0.00 - 10.50	2	0.037	(go_live_date > '2022-09-01'::date)


select
	a.account_number,
	a.bank_code,
	sum(t.amount)
from
	account a	
left join 
	individual i 
on 
	a.owner_id  = i.id
left join
	"transaction" t 
on
	t.sender_account_id = i.id
where
	a.account_number = '4367936589'
	and a.bank_code = 'BRI' 
group  by a.account_number, a.bank_code;

-- 17ms
-- Node Type	Entity	Cost	Rows	Time	Condition
-- Aggregate	[NULL]	8.30 - 2636.54	1	1471.714	[NULL]
-- Nested Loop	[NULL]	8.30 - 2635.03	185	1469.641	[NULL]
-- Seq Scan	account	0.00 - 26.00	1	0.109	"(((account_number)::text = '4367936589'::text)
-- and ((bank_code)::text = 'BRI'::text))"
-- Hash Join	[NULL]	8.30 - 2607.03	185	1466.789	((t.sender_account_id)::text = (i.id)::text)
-- Seq Scan	transaction	0.00 - 2334.00	100000	716.841	[NULL]
-- Hash	[NULL]	8.29 - 8.29	1	0.059	[NULL]
-- Index Only Scan	individual	0.27 - 8.29	1	0.032	(id = (a.owner_id)::text)
