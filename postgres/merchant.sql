CREATE TABLE IF NOT EXISTS merchant(
   id           VARCHAR(36) NOT NULL PRIMARY KEY
  ,go_live_date DATE  NOT NULL
  ,name         VARCHAR(256) NOT NULL
  ,email        VARCHAR(256) NOT NULL
  ,phone        VARCHAR(16) NOT NULL
  ,owner_id     VARCHAR(256) NOT NULL
);
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('224e99cd-42a7-43b7-9f65-18cfe897eb25','2022-09-18T20:59:36Z','Bubblebox','rwanne0@pbs.org','4479250879','CUST-100');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('f160988a-ea6a-4852-b4a7-16100666e024','2022-09-01T06:11:29Z','Twitterwire','ableasdille1@slashdot.org','8302029380','CUST-101');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('f1f8030a-f514-4d4e-a99d-89d9c94d2ed0','2022-05-04T20:16:41Z','Divavu','ncocking2@slideshare.net','4674266862','CUST-102');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('1db30656-e53f-436e-9fa6-e9f588efa657','2022-10-29T20:27:00Z','Browsedrive','csantello3@joomla.org','1857134839','CUST-103');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('9cc2e006-b172-4dfb-a0e8-84d8c30447e8','2022-05-11T10:12:15Z','Thoughtworks','mpinor4@skyrock.com','5899813420','CUST-104');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('ec657607-6146-482b-a857-0bebdcdad40e','2022-02-04T09:47:42Z','Kanoodle','msporgeon5@cafepress.com','3367968023','CUST-105');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('c2f9eada-840c-442d-b8c3-e727e23f2279','2022-02-15T05:47:55Z','Jayo','fcalvey6@sbwire.com','6329689345','CUST-106');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('63b4d7c2-f040-4261-a23e-89156c30b01f','2022-05-12T17:59:14Z','Skibox','mforsard7@mediafire.com','9094989678','CUST-107');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('7a5cc3a5-7375-4387-8fa3-1bb21c689737','2022-03-08T16:06:56Z','Brainlounge','xsprague8@abc.net.au','4194544632','CUST-108');
INSERT INTO merchant(id,go_live_date,name,email,phone,owner_id) VALUES ('150ef478-ed1c-429e-93ff-b10461312b9f','2022-04-25T00:16:22Z','Agivu','hpash9@php.net','9293173702','CUST-109');


-- 9ms