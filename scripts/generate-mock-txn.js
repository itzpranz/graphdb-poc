// id string [pk]
//   entity_id string [ref: > business.id]
//   recipient_account_id string  [ref: > account.id]
//   sender_account_id string [ref: > account.id]
//   amount string
//   transaction_date date

const random = require('lodash').random;
const ObjectsToCsv = require('objects-to-csv')

function randomDate(start, end) {
    var date = new Date(+start + Math.random() * (end - start));
    return date;
}
async function start() {
    const transaction = [];

    const entityIds = [
        '224e99cd-42a7-43b7-9f65-18cfe897eb25',
        'f160988a-ea6a-4852-b4a7-16100666e024',
        'f1f8030a-f514-4d4e-a99d-89d9c94d2ed0',
        '1db30656-e53f-436e-9fa6-e9f588efa657',
        '9cc2e006-b172-4dfb-a0e8-84d8c30447e8',
        'ec657607-6146-482b-a857-0bebdcdad40e',
        'c2f9eada-840c-442d-b8c3-e727e23f2279',
        '63b4d7c2-f040-4261-a23e-89156c30b01f',
        '7a5cc3a5-7375-4387-8fa3-1bb21c689737',
        '150ef478-ed1c-429e-93ff-b10461312b9f'
    ];

    for (let a = 0; a < 100000; a++) {
        const t = {
            id: 'TXN-' + (a + 1),
            merchant_id: entityIds[random(0,9)],
            recipient_account_id: 'CUST-' + random(1,500),
            sender_account_id: 'CUST-' + random(1,500),
            amount: random(100,1000000),
            transaction_date: randomDate(new Date('2021-01-01'), new Date('2022-11-01')).toISOString()
        }
        transaction.push(t);
    }

    const csv = new ObjectsToCsv(transaction);

    await csv.toDisk('./data/transaction.csv')
}
    
start();
// console.log(transaction);