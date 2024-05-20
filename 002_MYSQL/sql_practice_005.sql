-- 정규화
-- first_name, last_name, email, order_date, amount, customer_id
-- 주문을 했는데 이메일이 바뀔 수가 있다. 컬럼이 이렇게 설계되어있으면 불필요한 데이터 중복이 발생한다.
-- 따라서 관계성이 높은 컬럼끼리 따로 테이블을 만들어주어서 id로 연결시켜주는 방법으로 해결한다.

-- customers
-- customer_id, first_name, last_name, email
-- 여기서 customer_id는 primary key

-- orders
-- order_id, order_date, amount, customer_id
-- 여기서 order_id는 primary key이고 customer_id는 foreign key이다.

-- primary key | 주요 키 | 해당 테이블이 사용하는 id값
-- foreign key | 외래 키 | 정규화된 테이블 끼리 연결시켜주는 id값 | 바인딩 용도로 사용

-- 해당 practice의 경우에는 [스페너 버튼 - orders - Table - Foreign Keys탭]에서 설정을 해주어야 한다.
-- Foreign Key Name | orders_customer_id
-- Referenced Table | 'yhdb'.'customers'
-- Column | customer_id
-- Referenced Column | id
-- 여기서 주의할 점은 id컬럼은 보통 UN(unsigned)로 설정해주는데 마찬가지로 foreign key도 UN(unsigned)로 설정해주어야 한다.
-- 똑같이 양수만 사용가능하도록 설정해야 시스템에서는 같은 데이터 타입이라고 인지한다.
-- 요약 | -10 ~ +10 과 +20 범위는 다르다. 하지만 +20 과 +20 범위는 같다.

-- 이렇게 두 테이블로 나누어서 primary key인 id로 연동해서 사용하면 데이터베이스를 최적화하여 사용할 수 있다.
-- 주의할 점은 바인딩할 테이블에 대한 id컬럼이 따로 존재해야 한다.

-- 참고로 데이터타입 decimal(8, 2)는 전체 자릿수 8자리 중의 2자리를 소숫점으로 허용하는 실수를 의미한다.
-- 예시 | decimal(3, 1) | 최대값 : 99.9

use yhdb;

insert into customers (first_name, last_name, email) values ('Quintin', 'Whelpton', 'qwhelpton0@irs.gov');
insert into customers (first_name, last_name, email) values ('Netty', 'Ryhorovich', 'nryhorovich1@soundcloud.com');
insert into customers (first_name, last_name, email) values ('Yvette', 'Boys', 'yboys2@multiply.com');
insert into customers (first_name, last_name, email) values ('Renault', 'Bunworth', 'rbunworth3@hhs.gov');
insert into customers (first_name, last_name, email) values ('Zane', 'Comelini', 'zcomelini4@adobe.com');
insert into customers (first_name, last_name, email) values ('Angelique', 'Aspenlon', 'aaspenlon5@feedburner.com');
insert into customers (first_name, last_name, email) values ('Rahal', 'Waplington', 'rwaplington6@topsy.com');
insert into customers (first_name, last_name, email) values ('Enoch', 'Lantiffe', 'elantiffe7@tmall.com');
insert into customers (first_name, last_name, email) values ('Chick', 'Vigietti', 'cvigietti8@arstechnica.com');
insert into customers (first_name, last_name, email) values ('Clemmy', 'Dorsey', 'cdorsey9@mit.edu');
insert into customers (first_name, last_name, email) values ('Lutero', 'Croucher', 'lcrouchera@census.gov');
insert into customers (first_name, last_name, email) values ('Marcile', 'Bowton', 'mbowtonb@csmonitor.com');
insert into customers (first_name, last_name, email) values ('Saxe', 'Grabham', 'sgrabhamc@techcrunch.com');
insert into customers (first_name, last_name, email) values ('Miguelita', 'Hanvey', 'mhanveyd@comsenz.com');
insert into customers (first_name, last_name, email) values ('Thomasina', 'Abrahamoff', 'tabrahamoffe@biblegateway.com');
insert into customers (first_name, last_name, email) values ('Randie', 'Marney', 'rmarneyf@example.com');
insert into customers (first_name, last_name, email) values ('Kelsey', 'Lourens', 'klourensg@unicef.org');
insert into customers (first_name, last_name, email) values ('Camilla', 'Albany', 'calbanyh@comcast.net');
insert into customers (first_name, last_name, email) values ('Tybi', 'Benardet', 'tbenardeti@ehow.com');
insert into customers (first_name, last_name, email) values ('Benedick', 'Jansen', 'bjansenj@phpbb.com');
insert into customers (first_name, last_name, email) values ('Rodger', 'Pappin', 'rpappink@tinyurl.com');
insert into customers (first_name, last_name, email) values ('Diego', 'Gallienne', 'dgalliennel@friendfeed.com');
insert into customers (first_name, last_name, email) values ('Salim', 'Borrington', 'sborringtonm@unesco.org');
insert into customers (first_name, last_name, email) values ('Corella', 'Barribal', 'cbarribaln@gizmodo.com');
insert into customers (first_name, last_name, email) values ('Doralyn', 'Mansford', 'dmansfordo@tamu.edu');
insert into customers (first_name, last_name, email) values ('Carry', 'Matskiv', 'cmatskivp@latimes.com');
insert into customers (first_name, last_name, email) values ('Gustavo', 'Pyott', 'gpyottq@ehow.com');
insert into customers (first_name, last_name, email) values ('Jonathan', 'McVicar', 'jmcvicarr@ca.gov');
insert into customers (first_name, last_name, email) values ('Sterling', 'Bavage', 'sbavages@geocities.jp');
insert into customers (first_name, last_name, email) values ('Kassey', 'Sessions', 'ksessionst@1und1.de');
insert into customers (first_name, last_name, email) values ('Angele', 'Duplock', 'aduplocku@4shared.com');
insert into customers (first_name, last_name, email) values ('Chickie', 'Liggett', 'cliggettv@disqus.com');
insert into customers (first_name, last_name, email) values ('Mallorie', 'Bulley', 'mbulleyw@jigsy.com');
insert into customers (first_name, last_name, email) values ('Lammond', 'Birks', 'lbirksx@arstechnica.com');
insert into customers (first_name, last_name, email) values ('Zondra', 'Shivell', 'zshivelly@slideshare.net');
insert into customers (first_name, last_name, email) values ('Dyann', 'Dafter', 'ddafterz@blogs.com');
insert into customers (first_name, last_name, email) values ('Evangeline', 'Winwright', 'ewinwright10@pen.io');
insert into customers (first_name, last_name, email) values ('Joyan', 'Gillfillan', 'jgillfillan11@irs.gov');
insert into customers (first_name, last_name, email) values ('Cornell', 'Jovovic', 'cjovovic12@cnet.com');
insert into customers (first_name, last_name, email) values ('Nerty', 'Caldow', 'ncaldow13@hud.gov');
insert into customers (first_name, last_name, email) values ('Christos', 'Wane', 'cwane14@xing.com');
insert into customers (first_name, last_name, email) values ('Willabella', 'Gold', 'wgold15@posterous.com');
insert into customers (first_name, last_name, email) values ('Rudie', 'Chestney', 'rchestney16@twitpic.com');
insert into customers (first_name, last_name, email) values ('Herrick', 'Wickey', 'hwickey17@mtv.com');
insert into customers (first_name, last_name, email) values ('Richart', 'Kingsmill', 'rkingsmill18@accuweather.com');
insert into customers (first_name, last_name, email) values ('Roselia', 'Djakovic', 'rdjakovic19@soundcloud.com');
insert into customers (first_name, last_name, email) values ('Lorettalorna', 'Izaac', 'lizaac1a@pbs.org');
insert into customers (first_name, last_name, email) values ('Jaynell', 'Kik', 'jkik1b@ebay.com');
insert into customers (first_name, last_name, email) values ('Chariot', 'Bulgen', 'cbulgen1c@sun.com');
insert into customers (first_name, last_name, email) values ('Wat', 'Veschambes', 'wveschambes1d@last.fm');
insert into customers (first_name, last_name, email) values ('Angil', 'Aleksic', 'aaleksic1e@elegantthemes.com');
insert into customers (first_name, last_name, email) values ('Clemmie', 'Rexworthy', 'crexworthy1f@ebay.com');
insert into customers (first_name, last_name, email) values ('Bree', 'Geake', 'bgeake1g@ifeng.com');
insert into customers (first_name, last_name, email) values ('Malchy', 'Gianuzzi', 'mgianuzzi1h@studiopress.com');
insert into customers (first_name, last_name, email) values ('Isac', 'Swin', 'iswin1i@nsw.gov.au');
insert into customers (first_name, last_name, email) values ('Lyman', 'Founds', 'lfounds1j@state.gov');
insert into customers (first_name, last_name, email) values ('Lisetta', 'MacCarrane', 'lmaccarrane1k@loc.gov');
insert into customers (first_name, last_name, email) values ('Eadith', 'Quinnelly', 'equinnelly1l@slashdot.org');
insert into customers (first_name, last_name, email) values ('Keely', 'Roblin', 'kroblin1m@networkadvertising.org');
insert into customers (first_name, last_name, email) values ('Georgie', 'Peacock', 'gpeacock1n@dedecms.com');
insert into customers (first_name, last_name, email) values ('Pavel', 'Dix', 'pdix1o@clickbank.net');
insert into customers (first_name, last_name, email) values ('Dale', 'Bingham', 'dbingham1p@angelfire.com');
insert into customers (first_name, last_name, email) values ('Abra', 'Bonner', 'abonner1q@home.pl');
insert into customers (first_name, last_name, email) values ('Martino', 'Bengle', 'mbengle1r@nba.com');
insert into customers (first_name, last_name, email) values ('Dyann', 'Webb-Bowen', 'dwebbbowen1s@eventbrite.com');
insert into customers (first_name, last_name, email) values ('Juanita', 'Rozanski', 'jrozanski1t@typepad.com');
insert into customers (first_name, last_name, email) values ('Rakel', 'Couttes', 'rcouttes1u@edublogs.org');
insert into customers (first_name, last_name, email) values ('Dominic', 'Varfalameev', 'dvarfalameev1v@yellowbook.com');
insert into customers (first_name, last_name, email) values ('Viola', 'Sadler', 'vsadler1w@senate.gov');
insert into customers (first_name, last_name, email) values ('Dietrich', 'Eyers', 'deyers1x@addtoany.com');
insert into customers (first_name, last_name, email) values ('Ree', 'Domaschke', 'rdomaschke1y@digg.com');
insert into customers (first_name, last_name, email) values ('Hartley', 'Gravett', 'hgravett1z@cbslocal.com');
insert into customers (first_name, last_name, email) values ('Willa', 'Hacking', 'whacking20@opera.com');
insert into customers (first_name, last_name, email) values ('Avery', 'Wincer', 'awincer21@noaa.gov');
insert into customers (first_name, last_name, email) values ('Aluin', 'Dowse', 'adowse22@typepad.com');
insert into customers (first_name, last_name, email) values ('Padget', 'Deluca', 'pdeluca23@google.com.hk');
insert into customers (first_name, last_name, email) values ('Cobby', 'Grisdale', 'cgrisdale24@dailymail.co.uk');
insert into customers (first_name, last_name, email) values ('Hieronymus', 'Skippen', 'hskippen25@yelp.com');
insert into customers (first_name, last_name, email) values ('Di', 'Sandcroft', 'dsandcroft26@psu.edu');
insert into customers (first_name, last_name, email) values ('Karena', 'Shepherdson', 'kshepherdson27@wufoo.com');
insert into customers (first_name, last_name, email) values ('Humfrid', 'Le Franc', 'hlefranc28@washington.edu');
insert into customers (first_name, last_name, email) values ('Randy', 'Caldaro', 'rcaldaro29@yolasite.com');
insert into customers (first_name, last_name, email) values ('Francene', 'Kyne', 'fkyne2a@icq.com');
insert into customers (first_name, last_name, email) values ('Lanita', 'Penhaligon', 'lpenhaligon2b@indiegogo.com');
insert into customers (first_name, last_name, email) values ('Korry', 'Videan', 'kvidean2c@vimeo.com');
insert into customers (first_name, last_name, email) values ('Granthem', 'Peatt', 'gpeatt2d@bluehost.com');
insert into customers (first_name, last_name, email) values ('Nicol', 'Swettenham', 'nswettenham2e@state.tx.us');
insert into customers (first_name, last_name, email) values ('Dorree', 'Spread', 'dspread2f@ehow.com');
insert into customers (first_name, last_name, email) values ('Natty', 'Gromley', 'ngromley2g@amazonaws.com');
insert into customers (first_name, last_name, email) values ('Darcey', 'Summerlie', 'dsummerlie2h@usatoday.com');
insert into customers (first_name, last_name, email) values ('Costa', 'Duggon', 'cduggon2i@gnu.org');
insert into customers (first_name, last_name, email) values ('Ursa', 'Gohn', 'ugohn2j@over-blog.com');
insert into customers (first_name, last_name, email) values ('Karel', 'Sinclaire', 'ksinclaire2k@ehow.com');
insert into customers (first_name, last_name, email) values ('Cord', 'Weald', 'cweald2l@slideshare.net');
insert into customers (first_name, last_name, email) values ('Nolan', 'Roads', 'nroads2m@rambler.ru');
insert into customers (first_name, last_name, email) values ('Christoph', 'Osgar', 'cosgar2n@oracle.com');
insert into customers (first_name, last_name, email) values ('Gil', 'Vina', 'gvina2o@reverbnation.com');
insert into customers (first_name, last_name, email) values ('Sancho', 'Peris', 'speris2p@canalblog.com');
insert into customers (first_name, last_name, email) values ('Thurstan', 'Wooton', 'twooton2q@cam.ac.uk');
insert into customers (first_name, last_name, email) values ('Laurence', 'Bannester', 'lbannester2r@studiopress.com');

insert into orders (order_date, amount, customer_id) values ('2019/10/27', 284.81, 2);
insert into orders (order_date, amount, customer_id) values ('2020/02/08', 564.85, 97);
insert into orders (order_date, amount, customer_id) values ('2019/11/05', 615.05, 87);
insert into orders (order_date, amount, customer_id) values ('2019/10/20', 537.94, 64);
insert into orders (order_date, amount, customer_id) values ('2019/09/09', 755.31, 98);
insert into orders (order_date, amount, customer_id) values ('2019/10/16', 433.04, 78);
insert into orders (order_date, amount, customer_id) values ('2020/02/16', 65.48, 79);
insert into orders (order_date, amount, customer_id) values ('2020/06/12', 809.14, 9);
insert into orders (order_date, amount, customer_id) values ('2019/11/13', 157.45, 61);
insert into orders (order_date, amount, customer_id) values ('2020/01/22', 582.97, 50);
insert into orders (order_date, amount, customer_id) values ('2020/03/26', 340.2, 4);
insert into orders (order_date, amount, customer_id) values ('2020/06/21', 546.22, 10);
insert into orders (order_date, amount, customer_id) values ('2019/11/20', 646.1, 92);
insert into orders (order_date, amount, customer_id) values ('2020/03/04', 78.26, 4);
insert into orders (order_date, amount, customer_id) values ('2020/01/05', 151.15, 34);
insert into orders (order_date, amount, customer_id) values ('2019/08/18', 557.9, 93);
insert into orders (order_date, amount, customer_id) values ('2020/01/08', 271.64, 78);
insert into orders (order_date, amount, customer_id) values ('2020/04/24', 512.08, 71);
insert into orders (order_date, amount, customer_id) values ('2019/12/31', 117.41, 44);
insert into orders (order_date, amount, customer_id) values ('2019/11/30', 680.65, 74);
insert into orders (order_date, amount, customer_id) values ('2019/08/18', 83.95, 80);
insert into orders (order_date, amount, customer_id) values ('2019/11/12', 390.49, 8);
insert into orders (order_date, amount, customer_id) values ('2019/09/20', 315.03, 54);
insert into orders (order_date, amount, customer_id) values ('2019/12/20', 302.79, 75);
insert into orders (order_date, amount, customer_id) values ('2019/07/25', 45.17, 14);
insert into orders (order_date, amount, customer_id) values ('2020/02/05', 267.21, 78);
insert into orders (order_date, amount, customer_id) values ('2019/08/15', 602.27, 98);
insert into orders (order_date, amount, customer_id) values ('2020/05/12', 130.77, 84);
insert into orders (order_date, amount, customer_id) values ('2019/10/27', 390.96, 28);
insert into orders (order_date, amount, customer_id) values ('2020/04/06', 702.05, 6);
insert into orders (order_date, amount, customer_id) values ('2019/10/25', 312.03, 48);
insert into orders (order_date, amount, customer_id) values ('2019/08/03', 177.99, 50);
insert into orders (order_date, amount, customer_id) values ('2020/05/26', 515.42, 34);
insert into orders (order_date, amount, customer_id) values ('2020/03/12', 561.77, 62);
insert into orders (order_date, amount, customer_id) values ('2020/03/15', 806.42, 52);
insert into orders (order_date, amount, customer_id) values ('2020/05/19', 510.08, 68);
insert into orders (order_date, amount, customer_id) values ('2019/10/06', 719.99, 33);
insert into orders (order_date, amount, customer_id) values ('2019/09/07', 48.54, 66);
insert into orders (order_date, amount, customer_id) values ('2020/01/12', 146.36, 78);
insert into orders (order_date, amount, customer_id) values ('2020/04/20', 474.67, 25);
insert into orders (order_date, amount, customer_id) values ('2020/02/26', 592.44, 76);
insert into orders (order_date, amount, customer_id) values ('2019/09/20', 475.71, 77);
insert into orders (order_date, amount, customer_id) values ('2020/06/30', 498.6, 89);
insert into orders (order_date, amount, customer_id) values ('2020/02/08', 595.5, 18);
insert into orders (order_date, amount, customer_id) values ('2020/02/24', 65.72, 20);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 548.71, 91);
insert into orders (order_date, amount, customer_id) values ('2019/10/01', 348.3, 54);
insert into orders (order_date, amount, customer_id) values ('2019/09/23', 381.39, 62);
insert into orders (order_date, amount, customer_id) values ('2020/04/05', 637.96, 26);
insert into orders (order_date, amount, customer_id) values ('2020/04/06', 139.54, 90);
insert into orders (order_date, amount, customer_id) values ('2019/11/22', 93.82, 7);
insert into orders (order_date, amount, customer_id) values ('2019/10/24', 780.03, 73);
insert into orders (order_date, amount, customer_id) values ('2019/12/14', 180.91, 23);
insert into orders (order_date, amount, customer_id) values ('2019/11/27', 433.54, 86);
insert into orders (order_date, amount, customer_id) values ('2020/05/01', 214.87, 52);
insert into orders (order_date, amount, customer_id) values ('2019/09/07', 70.79, 40);
insert into orders (order_date, amount, customer_id) values ('2020/05/29', 225.34, 62);
insert into orders (order_date, amount, customer_id) values ('2020/01/06', 296.39, 37);
insert into orders (order_date, amount, customer_id) values ('2020/01/12', 55.96, 41);
insert into orders (order_date, amount, customer_id) values ('2019/08/10', 304.55, 49);
insert into orders (order_date, amount, customer_id) values ('2020/04/25', 230.41, 88);
insert into orders (order_date, amount, customer_id) values ('2020/05/30', 502.89, 96);
insert into orders (order_date, amount, customer_id) values ('2020/03/29', 264.09, 6);
insert into orders (order_date, amount, customer_id) values ('2019/12/11', 249.34, 66);
insert into orders (order_date, amount, customer_id) values ('2020/04/08', 406.2, 13);
insert into orders (order_date, amount, customer_id) values ('2019/09/18', 530.14, 55);
insert into orders (order_date, amount, customer_id) values ('2020/05/15', 103.93, 63);
insert into orders (order_date, amount, customer_id) values ('2020/05/10', 401.94, 80);
insert into orders (order_date, amount, customer_id) values ('2019/09/13', 584.32, 33);
insert into orders (order_date, amount, customer_id) values ('2020/02/04', 321.07, 96);
insert into orders (order_date, amount, customer_id) values ('2020/03/01', 130.9, 78);
insert into orders (order_date, amount, customer_id) values ('2020/05/09', 826.46, 84);
insert into orders (order_date, amount, customer_id) values ('2020/06/04', 58.67, 41);
insert into orders (order_date, amount, customer_id) values ('2019/07/18', 793.14, 4);
insert into orders (order_date, amount, customer_id) values ('2019/11/24', 552.1, 65);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 518.64, 25);
insert into orders (order_date, amount, customer_id) values ('2020/01/05', 154.9, 13);
insert into orders (order_date, amount, customer_id) values ('2020/03/17', 785.67, 62);
insert into orders (order_date, amount, customer_id) values ('2019/10/03', 91.66, 6);
insert into orders (order_date, amount, customer_id) values ('2020/02/16', 250.2, 50);
insert into orders (order_date, amount, customer_id) values ('2019/11/21', 68.4, 65);
insert into orders (order_date, amount, customer_id) values ('2020/05/06', 166.68, 77);
insert into orders (order_date, amount, customer_id) values ('2020/04/30', 411.18, 69);
insert into orders (order_date, amount, customer_id) values ('2019/11/24', 822.74, 81);
insert into orders (order_date, amount, customer_id) values ('2020/02/08', 406.93, 47);
insert into orders (order_date, amount, customer_id) values ('2020/06/22', 269.48, 52);
insert into orders (order_date, amount, customer_id) values ('2019/12/28', 443.37, 21);
insert into orders (order_date, amount, customer_id) values ('2019/10/23', 775.66, 2);
insert into orders (order_date, amount, customer_id) values ('2020/07/02', 578.37, 2);
insert into orders (order_date, amount, customer_id) values ('2020/01/27', 482.98, 59);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 254.83, 11);
insert into orders (order_date, amount, customer_id) values ('2020/03/13', 715.44, 43);
insert into orders (order_date, amount, customer_id) values ('2020/04/27', 425.17, 68);
insert into orders (order_date, amount, customer_id) values ('2020/04/15', 51.09, 91);
insert into orders (order_date, amount, customer_id) values ('2019/07/10', 821.35, 82);
insert into orders (order_date, amount, customer_id) values ('2020/04/27', 112.13, 20);
insert into orders (order_date, amount, customer_id) values ('2020/06/16', 523.22, 60);
insert into orders (order_date, amount, customer_id) values ('2020/05/13', 233.65, 15);
insert into orders (order_date, amount, customer_id) values ('2019/07/28', 592.2, 77);
insert into orders (order_date, amount, customer_id) values ('2019/11/19', 525.52, 32);
insert into orders (order_date, amount, customer_id) values ('2019/12/07', 494.84, 57);
insert into orders (order_date, amount, customer_id) values ('2020/01/23', 212.49, 92);
insert into orders (order_date, amount, customer_id) values ('2020/04/07', 437.29, 63);
insert into orders (order_date, amount, customer_id) values ('2019/12/21', 299.05, 92);
insert into orders (order_date, amount, customer_id) values ('2020/06/24', 107.3, 82);
insert into orders (order_date, amount, customer_id) values ('2019/11/11', 406.22, 58);
insert into orders (order_date, amount, customer_id) values ('2019/09/26', 672.23, 96);
insert into orders (order_date, amount, customer_id) values ('2020/07/07', 736.74, 26);
insert into orders (order_date, amount, customer_id) values ('2020/01/01', 760.95, 5);
insert into orders (order_date, amount, customer_id) values ('2020/01/08', 468.94, 15);
insert into orders (order_date, amount, customer_id) values ('2020/05/11', 124.75, 47);
insert into orders (order_date, amount, customer_id) values ('2019/09/02', 313.39, 70);
insert into orders (order_date, amount, customer_id) values ('2020/01/20', 804.6, 33);
insert into orders (order_date, amount, customer_id) values ('2019/12/15', 362.01, 74);
insert into orders (order_date, amount, customer_id) values ('2020/03/22', 459.2, 44);
insert into orders (order_date, amount, customer_id) values ('2019/08/25', 379.77, 45);
insert into orders (order_date, amount, customer_id) values ('2019/11/12', 649.54, 70);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 102.33, 55);
insert into orders (order_date, amount, customer_id) values ('2020/02/03', 488.52, 92);
insert into orders (order_date, amount, customer_id) values ('2019/12/24', 548.21, 95);
insert into orders (order_date, amount, customer_id) values ('2020/05/15', 128.85, 82);
insert into orders (order_date, amount, customer_id) values ('2020/05/07', 469.34, 100);
insert into orders (order_date, amount, customer_id) values ('2020/03/10', 113.18, 61);
insert into orders (order_date, amount, customer_id) values ('2019/12/12', 201.53, 75);
insert into orders (order_date, amount, customer_id) values ('2019/11/05', 62.02, 53);
insert into orders (order_date, amount, customer_id) values ('2019/12/27', 346.18, 4);
insert into orders (order_date, amount, customer_id) values ('2020/07/04', 294.54, 35);
insert into orders (order_date, amount, customer_id) values ('2019/08/05', 390.64, 38);
insert into orders (order_date, amount, customer_id) values ('2020/01/16', 535.72, 54);
insert into orders (order_date, amount, customer_id) values ('2019/10/31', 117.35, 24);
insert into orders (order_date, amount, customer_id) values ('2020/03/31', 712.75, 99);
insert into orders (order_date, amount, customer_id) values ('2020/06/04', 114.2, 59);
insert into orders (order_date, amount, customer_id) values ('2019/09/28', 376.64, 15);
insert into orders (order_date, amount, customer_id) values ('2019/10/13', 379.68, 83);
insert into orders (order_date, amount, customer_id) values ('2020/01/26', 97.13, 21);
insert into orders (order_date, amount, customer_id) values ('2019/08/31', 752.07, 21);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 307.98, 1);
insert into orders (order_date, amount, customer_id) values ('2020/07/03', 424.69, 83);
insert into orders (order_date, amount, customer_id) values ('2020/01/13', 272.83, 44);
insert into orders (order_date, amount, customer_id) values ('2019/07/18', 614.68, 77);
insert into orders (order_date, amount, customer_id) values ('2020/01/14', 88.49, 78);
insert into orders (order_date, amount, customer_id) values ('2020/02/11', 214.71, 12);
insert into orders (order_date, amount, customer_id) values ('2020/03/06', 645.88, 92);
insert into orders (order_date, amount, customer_id) values ('2019/12/05', 656.63, 63);
insert into orders (order_date, amount, customer_id) values ('2019/12/10', 136.04, 78);
insert into orders (order_date, amount, customer_id) values ('2020/03/05', 675.83, 13);
insert into orders (order_date, amount, customer_id) values ('2019/10/21', 623.17, 28);
insert into orders (order_date, amount, customer_id) values ('2019/10/20', 672.55, 46);
insert into orders (order_date, amount, customer_id) values ('2020/01/07', 129.14, 8);
insert into orders (order_date, amount, customer_id) values ('2020/01/03', 545.74, 20);
insert into orders (order_date, amount, customer_id) values ('2019/10/19', 654.39, 80);
insert into orders (order_date, amount, customer_id) values ('2019/07/13', 600.4, 79);
insert into orders (order_date, amount, customer_id) values ('2019/10/27', 798.41, 32);
insert into orders (order_date, amount, customer_id) values ('2019/07/30', 768.74, 28);
insert into orders (order_date, amount, customer_id) values ('2019/12/01', 355.01, 44);
insert into orders (order_date, amount, customer_id) values ('2019/09/14', 776.99, 16);
insert into orders (order_date, amount, customer_id) values ('2020/07/08', 544.7, 75);
insert into orders (order_date, amount, customer_id) values ('2019/09/29', 136.15, 19);
insert into orders (order_date, amount, customer_id) values ('2020/01/02', 230.16, 28);
insert into orders (order_date, amount, customer_id) values ('2020/01/05', 366.53, 90);
insert into orders (order_date, amount, customer_id) values ('2019/10/15', 537.4, 76);
insert into orders (order_date, amount, customer_id) values ('2019/09/12', 580.25, 32);
insert into orders (order_date, amount, customer_id) values ('2019/12/08', 685.36, 63);
insert into orders (order_date, amount, customer_id) values ('2020/03/12', 715.64, 47);
insert into orders (order_date, amount, customer_id) values ('2020/06/25', 726.1, 11);
insert into orders (order_date, amount, customer_id) values ('2019/09/04', 371.04, 81);
insert into orders (order_date, amount, customer_id) values ('2020/06/23', 152.43, 88);
insert into orders (order_date, amount, customer_id) values ('2019/08/31', 718.29, 53);
insert into orders (order_date, amount, customer_id) values ('2019/09/26', 650.18, 90);
insert into orders (order_date, amount, customer_id) values ('2019/11/04', 42.85, 19);
insert into orders (order_date, amount, customer_id) values ('2019/11/30', 353.08, 21);
insert into orders (order_date, amount, customer_id) values ('2019/12/03', 145.66, 92);
insert into orders (order_date, amount, customer_id) values ('2019/09/04', 433.79, 71);
insert into orders (order_date, amount, customer_id) values ('2020/02/05', 79.34, 45);
insert into orders (order_date, amount, customer_id) values ('2019/10/11', 408.42, 77);
insert into orders (order_date, amount, customer_id) values ('2019/08/11', 242.73, 68);
insert into orders (order_date, amount, customer_id) values ('2019/10/27', 795.9, 56);
insert into orders (order_date, amount, customer_id) values ('2020/01/02', 381.87, 45);
insert into orders (order_date, amount, customer_id) values ('2020/04/13', 248.71, 97);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 212.76, 52);
insert into orders (order_date, amount, customer_id) values ('2020/01/05', 550.19, 31);
insert into orders (order_date, amount, customer_id) values ('2019/09/08', 517.26, 68);
insert into orders (order_date, amount, customer_id) values ('2020/06/12', 407.93, 88);
insert into orders (order_date, amount, customer_id) values ('2019/09/02', 723.41, 6);
insert into orders (order_date, amount, customer_id) values ('2019/09/05', 780.99, 18);
insert into orders (order_date, amount, customer_id) values ('2020/01/14', 383.64, 58);
insert into orders (order_date, amount, customer_id) values ('2020/02/07', 774.81, 15);
insert into orders (order_date, amount, customer_id) values ('2020/03/01', 486.93, 16);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 769.89, 86);
insert into orders (order_date, amount, customer_id) values ('2020/04/16', 550.15, 77);
insert into orders (order_date, amount, customer_id) values ('2019/10/14', 310.17, 63);
insert into orders (order_date, amount, customer_id) values ('2019/11/13', 233.31, 62);
insert into orders (order_date, amount, customer_id) values ('2019/10/07', 236.49, 8);
insert into orders (order_date, amount, customer_id) values ('2019/11/15', 71.06, 96);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 91.48, 41);
insert into orders (order_date, amount, customer_id) values ('2019/09/23', 106.14, 42);
insert into orders (order_date, amount, customer_id) values ('2020/02/11', 597.06, 41);
insert into orders (order_date, amount, customer_id) values ('2019/12/18', 577.03, 13);
insert into orders (order_date, amount, customer_id) values ('2019/08/20', 242.93, 32);
insert into orders (order_date, amount, customer_id) values ('2020/04/29', 117.51, 98);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 289.84, 10);
insert into orders (order_date, amount, customer_id) values ('2020/01/30', 775.51, 36);
insert into orders (order_date, amount, customer_id) values ('2020/02/23', 747.37, 4);
insert into orders (order_date, amount, customer_id) values ('2020/04/20', 625.49, 32);
insert into orders (order_date, amount, customer_id) values ('2019/11/20', 726.96, 98);
insert into orders (order_date, amount, customer_id) values ('2020/03/18', 382.53, 38);
insert into orders (order_date, amount, customer_id) values ('2020/06/04', 368.96, 40);
insert into orders (order_date, amount, customer_id) values ('2019/08/20', 659.49, 91);
insert into orders (order_date, amount, customer_id) values ('2019/12/09', 301.42, 19);
insert into orders (order_date, amount, customer_id) values ('2019/09/02', 505.51, 63);
insert into orders (order_date, amount, customer_id) values ('2020/06/15', 262.69, 84);
insert into orders (order_date, amount, customer_id) values ('2020/03/06', 680.45, 89);
insert into orders (order_date, amount, customer_id) values ('2019/07/27', 811.11, 56);
insert into orders (order_date, amount, customer_id) values ('2019/11/21', 550.98, 75);
insert into orders (order_date, amount, customer_id) values ('2020/04/08', 222.3, 55);
insert into orders (order_date, amount, customer_id) values ('2019/12/07', 386.18, 60);
insert into orders (order_date, amount, customer_id) values ('2019/12/30', 733.3, 87);
insert into orders (order_date, amount, customer_id) values ('2020/05/16', 587.88, 10);
insert into orders (order_date, amount, customer_id) values ('2019/07/09', 263.11, 33);
insert into orders (order_date, amount, customer_id) values ('2019/12/31', 446.54, 67);
insert into orders (order_date, amount, customer_id) values ('2019/12/29', 480.26, 78);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 749.66, 57);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 687.4, 67);
insert into orders (order_date, amount, customer_id) values ('2019/09/02', 227.52, 41);
insert into orders (order_date, amount, customer_id) values ('2019/12/25', 776.56, 46);
insert into orders (order_date, amount, customer_id) values ('2019/08/04', 172.94, 38);
insert into orders (order_date, amount, customer_id) values ('2019/07/14', 243.03, 35);
insert into orders (order_date, amount, customer_id) values ('2019/12/01', 746.17, 96);
insert into orders (order_date, amount, customer_id) values ('2020/06/15', 154.62, 1);
insert into orders (order_date, amount, customer_id) values ('2020/01/23', 711.07, 99);
insert into orders (order_date, amount, customer_id) values ('2020/04/25', 564.03, 68);
insert into orders (order_date, amount, customer_id) values ('2020/03/18', 725.72, 96);
insert into orders (order_date, amount, customer_id) values ('2020/06/25', 720.78, 11);
insert into orders (order_date, amount, customer_id) values ('2019/10/17', 440.33, 80);
insert into orders (order_date, amount, customer_id) values ('2020/01/31', 579.85, 70);
insert into orders (order_date, amount, customer_id) values ('2019/11/29', 113.45, 38);
insert into orders (order_date, amount, customer_id) values ('2020/05/02', 222.64, 86);
insert into orders (order_date, amount, customer_id) values ('2019/11/05', 467.88, 14);
insert into orders (order_date, amount, customer_id) values ('2020/02/02', 552.93, 76);
insert into orders (order_date, amount, customer_id) values ('2019/11/07', 43.23, 36);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 535.42, 51);
insert into orders (order_date, amount, customer_id) values ('2019/08/29', 136.38, 79);
insert into orders (order_date, amount, customer_id) values ('2019/07/24', 484.19, 66);
insert into orders (order_date, amount, customer_id) values ('2019/11/09', 208.68, 39);
insert into orders (order_date, amount, customer_id) values ('2019/11/16', 98.77, 76);
insert into orders (order_date, amount, customer_id) values ('2019/10/18', 497.97, 79);
insert into orders (order_date, amount, customer_id) values ('2019/08/05', 662.81, 51);
insert into orders (order_date, amount, customer_id) values ('2020/05/10', 674.1, 11);
insert into orders (order_date, amount, customer_id) values ('2020/02/22', 737.02, 75);
insert into orders (order_date, amount, customer_id) values ('2020/01/06', 665.86, 29);
insert into orders (order_date, amount, customer_id) values ('2020/03/28', 578.93, 43);
insert into orders (order_date, amount, customer_id) values ('2019/10/27', 97.16, 63);
insert into orders (order_date, amount, customer_id) values ('2020/06/11', 826.71, 63);
insert into orders (order_date, amount, customer_id) values ('2020/07/05', 410.16, 43);
insert into orders (order_date, amount, customer_id) values ('2020/01/09', 532.67, 8);
insert into orders (order_date, amount, customer_id) values ('2019/09/12', 365.99, 14);
insert into orders (order_date, amount, customer_id) values ('2019/12/21', 642.47, 51);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 193.6, 49);
insert into orders (order_date, amount, customer_id) values ('2020/02/23', 403.04, 49);
insert into orders (order_date, amount, customer_id) values ('2020/03/30', 130.14, 47);
insert into orders (order_date, amount, customer_id) values ('2020/06/26', 186.18, 9);
insert into orders (order_date, amount, customer_id) values ('2019/12/30', 294.33, 61);
insert into orders (order_date, amount, customer_id) values ('2020/05/15', 240.14, 75);
insert into orders (order_date, amount, customer_id) values ('2020/05/26', 479.5, 45);
insert into orders (order_date, amount, customer_id) values ('2019/07/13', 548.31, 100);
insert into orders (order_date, amount, customer_id) values ('2020/07/01', 71.75, 99);
insert into orders (order_date, amount, customer_id) values ('2019/10/20', 122.84, 80);
insert into orders (order_date, amount, customer_id) values ('2019/08/13', 407.57, 80);
insert into orders (order_date, amount, customer_id) values ('2019/09/03', 615.64, 80);
insert into orders (order_date, amount, customer_id) values ('2019/11/18', 323.94, 88);
insert into orders (order_date, amount, customer_id) values ('2020/05/29', 406.26, 60);
insert into orders (order_date, amount, customer_id) values ('2019/08/13', 501.05, 95);
insert into orders (order_date, amount, customer_id) values ('2019/12/29', 588.61, 58);
insert into orders (order_date, amount, customer_id) values ('2020/03/13', 404.45, 62);
insert into orders (order_date, amount, customer_id) values ('2020/03/12', 387.66, 18);
insert into orders (order_date, amount, customer_id) values ('2020/07/07', 492.23, 12);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 588.36, 53);
insert into orders (order_date, amount, customer_id) values ('2019/09/03', 79.79, 14);
insert into orders (order_date, amount, customer_id) values ('2019/09/19', 395.06, 77);
insert into orders (order_date, amount, customer_id) values ('2020/06/22', 524.3, 51);
insert into orders (order_date, amount, customer_id) values ('2019/07/09', 789.77, 98);
insert into orders (order_date, amount, customer_id) values ('2019/08/20', 261.91, 88);
insert into orders (order_date, amount, customer_id) values ('2019/09/10', 708.53, 23);
insert into orders (order_date, amount, customer_id) values ('2020/02/01', 548.05, 54);
insert into orders (order_date, amount, customer_id) values ('2019/07/14', 345.71, 66);
insert into orders (order_date, amount, customer_id) values ('2019/10/14', 387.79, 38);
insert into orders (order_date, amount, customer_id) values ('2020/07/01', 238.19, 89);
insert into orders (order_date, amount, customer_id) values ('2019/11/07', 389.76, 37);
insert into orders (order_date, amount, customer_id) values ('2020/04/30', 191.91, 44);
insert into orders (order_date, amount, customer_id) values ('2019/07/09', 782.47, 93);
insert into orders (order_date, amount, customer_id) values ('2020/03/06', 196.5, 5);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 105.08, 32);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 310.24, 60);
insert into orders (order_date, amount, customer_id) values ('2020/01/30', 474.59, 19);
insert into orders (order_date, amount, customer_id) values ('2019/12/29', 522.52, 99);
insert into orders (order_date, amount, customer_id) values ('2020/06/22', 308.77, 64);
insert into orders (order_date, amount, customer_id) values ('2020/01/20', 549.69, 40);
insert into orders (order_date, amount, customer_id) values ('2019/12/08', 761.94, 38);
insert into orders (order_date, amount, customer_id) values ('2020/03/20', 552.6, 76);
insert into orders (order_date, amount, customer_id) values ('2020/05/03', 412.17, 95);
insert into orders (order_date, amount, customer_id) values ('2020/05/21', 208.25, 53);
insert into orders (order_date, amount, customer_id) values ('2019/10/24', 803.85, 1);
insert into orders (order_date, amount, customer_id) values ('2019/11/11', 404.5, 94);
insert into orders (order_date, amount, customer_id) values ('2020/04/16', 282.23, 21);
insert into orders (order_date, amount, customer_id) values ('2020/05/04', 427.53, 57);
insert into orders (order_date, amount, customer_id) values ('2020/04/25', 374.32, 98);
insert into orders (order_date, amount, customer_id) values ('2019/07/17', 87.15, 64);
insert into orders (order_date, amount, customer_id) values ('2019/07/18', 190.69, 33);
insert into orders (order_date, amount, customer_id) values ('2020/02/15', 178.33, 89);
insert into orders (order_date, amount, customer_id) values ('2019/09/30', 758.92, 47);
insert into orders (order_date, amount, customer_id) values ('2020/04/01', 520.48, 95);
insert into orders (order_date, amount, customer_id) values ('2019/07/19', 726.73, 57);
insert into orders (order_date, amount, customer_id) values ('2019/11/20', 377.59, 7);
insert into orders (order_date, amount, customer_id) values ('2019/10/30', 285.68, 81);
insert into orders (order_date, amount, customer_id) values ('2019/10/22', 749.96, 18);
insert into orders (order_date, amount, customer_id) values ('2019/09/01', 593.43, 76);
insert into orders (order_date, amount, customer_id) values ('2019/12/13', 599.09, 44);
insert into orders (order_date, amount, customer_id) values ('2019/07/13', 306.14, 77);
insert into orders (order_date, amount, customer_id) values ('2020/05/09', 628.14, 42);
insert into orders (order_date, amount, customer_id) values ('2019/12/30', 636.23, 99);
insert into orders (order_date, amount, customer_id) values ('2019/07/10', 657.67, 99);
insert into orders (order_date, amount, customer_id) values ('2020/03/13', 130.34, 89);
insert into orders (order_date, amount, customer_id) values ('2020/05/02', 177.0, 79);
insert into orders (order_date, amount, customer_id) values ('2019/11/27', 462.33, 33);
insert into orders (order_date, amount, customer_id) values ('2020/03/11', 302.98, 28);
insert into orders (order_date, amount, customer_id) values ('2020/05/02', 562.84, 22);
insert into orders (order_date, amount, customer_id) values ('2019/11/02', 340.03, 43);
insert into orders (order_date, amount, customer_id) values ('2020/06/29', 539.47, 33);
insert into orders (order_date, amount, customer_id) values ('2019/09/28', 316.52, 17);
insert into orders (order_date, amount, customer_id) values ('2019/10/11', 278.31, 86);
insert into orders (order_date, amount, customer_id) values ('2020/02/27', 218.0, 63);
insert into orders (order_date, amount, customer_id) values ('2019/09/16', 658.82, 90);
insert into orders (order_date, amount, customer_id) values ('2020/03/14', 768.6, 98);
insert into orders (order_date, amount, customer_id) values ('2020/05/04', 42.19, 87);
insert into orders (order_date, amount, customer_id) values ('2020/06/05', 615.51, 27);
insert into orders (order_date, amount, customer_id) values ('2019/10/11', 90.75, 75);
insert into orders (order_date, amount, customer_id) values ('2020/01/02', 743.41, 6);
insert into orders (order_date, amount, customer_id) values ('2019/07/12', 807.99, 66);
insert into orders (order_date, amount, customer_id) values ('2019/10/02', 278.91, 32);
insert into orders (order_date, amount, customer_id) values ('2020/05/30', 718.58, 20);
insert into orders (order_date, amount, customer_id) values ('2020/05/07', 467.72, 21);
insert into orders (order_date, amount, customer_id) values ('2020/03/20', 151.14, 97);
insert into orders (order_date, amount, customer_id) values ('2019/10/01', 429.56, 29);
insert into orders (order_date, amount, customer_id) values ('2019/08/26', 823.01, 63);
insert into orders (order_date, amount, customer_id) values ('2020/03/28', 473.17, 67);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 80.84, 83);
insert into orders (order_date, amount, customer_id) values ('2020/04/02', 309.07, 88);
insert into orders (order_date, amount, customer_id) values ('2019/12/12', 526.6, 29);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 818.95, 41);
insert into orders (order_date, amount, customer_id) values ('2019/11/30', 811.51, 47);
insert into orders (order_date, amount, customer_id) values ('2020/05/07', 336.82, 8);
insert into orders (order_date, amount, customer_id) values ('2020/04/09', 792.27, 99);
insert into orders (order_date, amount, customer_id) values ('2020/03/24', 554.56, 46);
insert into orders (order_date, amount, customer_id) values ('2020/02/13', 792.98, 24);
insert into orders (order_date, amount, customer_id) values ('2019/11/09', 367.3, 73);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 791.85, 97);
insert into orders (order_date, amount, customer_id) values ('2019/08/09', 720.91, 33);
insert into orders (order_date, amount, customer_id) values ('2019/08/21', 435.02, 41);
insert into orders (order_date, amount, customer_id) values ('2020/03/23', 249.35, 62);
insert into orders (order_date, amount, customer_id) values ('2020/01/03', 113.5, 47);
insert into orders (order_date, amount, customer_id) values ('2019/10/24', 685.7, 84);
insert into orders (order_date, amount, customer_id) values ('2020/03/09', 302.05, 94);
insert into orders (order_date, amount, customer_id) values ('2019/09/26', 228.92, 31);
insert into orders (order_date, amount, customer_id) values ('2019/08/19', 376.82, 26);
insert into orders (order_date, amount, customer_id) values ('2020/02/26', 565.04, 77);
insert into orders (order_date, amount, customer_id) values ('2020/02/22', 396.65, 12);
insert into orders (order_date, amount, customer_id) values ('2020/06/27', 140.88, 64);
insert into orders (order_date, amount, customer_id) values ('2019/12/29', 424.15, 11);
insert into orders (order_date, amount, customer_id) values ('2019/09/26', 508.71, 17);
insert into orders (order_date, amount, customer_id) values ('2020/04/01', 717.56, 58);
insert into orders (order_date, amount, customer_id) values ('2019/09/03', 524.72, 63);
insert into orders (order_date, amount, customer_id) values ('2020/01/24', 404.96, 34);
insert into orders (order_date, amount, customer_id) values ('2020/03/10', 400.87, 54);
insert into orders (order_date, amount, customer_id) values ('2020/01/01', 787.36, 67);
insert into orders (order_date, amount, customer_id) values ('2020/05/11', 792.37, 75);
insert into orders (order_date, amount, customer_id) values ('2020/01/16', 499.53, 64);
insert into orders (order_date, amount, customer_id) values ('2020/04/03', 116.8, 54);
insert into orders (order_date, amount, customer_id) values ('2020/02/26', 317.16, 42);
insert into orders (order_date, amount, customer_id) values ('2019/12/10', 43.25, 12);
insert into orders (order_date, amount, customer_id) values ('2020/04/12', 767.38, 71);
insert into orders (order_date, amount, customer_id) values ('2020/04/17', 511.22, 18);
insert into orders (order_date, amount, customer_id) values ('2020/03/05', 113.8, 15);
insert into orders (order_date, amount, customer_id) values ('2020/01/27', 587.91, 41);
insert into orders (order_date, amount, customer_id) values ('2020/02/24', 483.15, 34);
insert into orders (order_date, amount, customer_id) values ('2020/03/10', 198.51, 12);
insert into orders (order_date, amount, customer_id) values ('2019/08/08', 617.82, 41);
insert into orders (order_date, amount, customer_id) values ('2020/01/22', 755.4, 68);
insert into orders (order_date, amount, customer_id) values ('2020/01/02', 246.58, 49);
insert into orders (order_date, amount, customer_id) values ('2019/08/31', 213.59, 60);
insert into orders (order_date, amount, customer_id) values ('2020/04/13', 770.5, 86);
insert into orders (order_date, amount, customer_id) values ('2019/08/22', 86.49, 48);
insert into orders (order_date, amount, customer_id) values ('2019/10/05', 174.27, 51);
insert into orders (order_date, amount, customer_id) values ('2020/06/16', 178.03, 39);
insert into orders (order_date, amount, customer_id) values ('2019/12/13', 51.76, 82);
insert into orders (order_date, amount, customer_id) values ('2019/12/27', 378.09, 42);
insert into orders (order_date, amount, customer_id) values ('2020/06/03', 658.33, 78);
insert into orders (order_date, amount, customer_id) values ('2019/11/22', 342.07, 24);
insert into orders (order_date, amount, customer_id) values ('2020/01/13', 444.83, 50);
insert into orders (order_date, amount, customer_id) values ('2019/09/24', 798.76, 67);
insert into orders (order_date, amount, customer_id) values ('2019/11/18', 278.97, 90);
insert into orders (order_date, amount, customer_id) values ('2020/05/03', 559.43, 44);
insert into orders (order_date, amount, customer_id) values ('2020/02/24', 55.64, 48);
insert into orders (order_date, amount, customer_id) values ('2020/03/14', 563.23, 76);
insert into orders (order_date, amount, customer_id) values ('2019/08/07', 693.45, 25);
insert into orders (order_date, amount, customer_id) values ('2020/06/04', 332.72, 56);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 248.47, 38);
insert into orders (order_date, amount, customer_id) values ('2019/09/27', 579.98, 11);
insert into orders (order_date, amount, customer_id) values ('2019/10/19', 265.71, 40);
insert into orders (order_date, amount, customer_id) values ('2019/08/28', 439.66, 18);
insert into orders (order_date, amount, customer_id) values ('2019/11/10', 85.09, 75);
insert into orders (order_date, amount, customer_id) values ('2020/02/03', 665.24, 66);
insert into orders (order_date, amount, customer_id) values ('2019/10/20', 251.51, 10);
insert into orders (order_date, amount, customer_id) values ('2020/06/28', 441.82, 9);
insert into orders (order_date, amount, customer_id) values ('2019/08/27', 416.11, 50);
insert into orders (order_date, amount, customer_id) values ('2020/03/10', 202.14, 34);
insert into orders (order_date, amount, customer_id) values ('2019/12/04', 114.99, 62);
insert into orders (order_date, amount, customer_id) values ('2019/10/19', 764.27, 34);
insert into orders (order_date, amount, customer_id) values ('2020/04/19', 598.9, 23);
insert into orders (order_date, amount, customer_id) values ('2020/03/10', 778.02, 55);
insert into orders (order_date, amount, customer_id) values ('2019/11/21', 766.0, 11);
insert into orders (order_date, amount, customer_id) values ('2019/12/29', 269.19, 84);
insert into orders (order_date, amount, customer_id) values ('2019/09/19', 616.88, 56);
insert into orders (order_date, amount, customer_id) values ('2019/08/23', 562.99, 53);
insert into orders (order_date, amount, customer_id) values ('2020/03/28', 200.87, 65);
insert into orders (order_date, amount, customer_id) values ('2019/09/28', 741.77, 5);
insert into orders (order_date, amount, customer_id) values ('2019/12/08', 797.25, 36);
insert into orders (order_date, amount, customer_id) values ('2019/09/03', 251.44, 25);
insert into orders (order_date, amount, customer_id) values ('2020/07/07', 301.48, 48);
insert into orders (order_date, amount, customer_id) values ('2020/05/21', 270.81, 81);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 321.48, 91);
insert into orders (order_date, amount, customer_id) values ('2020/02/26', 489.94, 92);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 305.22, 55);
insert into orders (order_date, amount, customer_id) values ('2019/09/30', 143.46, 46);
insert into orders (order_date, amount, customer_id) values ('2019/12/30', 192.27, 9);
insert into orders (order_date, amount, customer_id) values ('2020/04/30', 333.69, 1);
insert into orders (order_date, amount, customer_id) values ('2019/09/04', 268.86, 56);
insert into orders (order_date, amount, customer_id) values ('2019/11/20', 462.38, 19);
insert into orders (order_date, amount, customer_id) values ('2019/12/06', 826.67, 38);
insert into orders (order_date, amount, customer_id) values ('2019/12/04', 158.27, 38);
insert into orders (order_date, amount, customer_id) values ('2019/08/25', 403.4, 54);
insert into orders (order_date, amount, customer_id) values ('2019/07/24', 199.18, 93);
insert into orders (order_date, amount, customer_id) values ('2020/03/27', 670.91, 95);
insert into orders (order_date, amount, customer_id) values ('2019/12/02', 52.28, 60);
insert into orders (order_date, amount, customer_id) values ('2019/08/09', 430.83, 77);
insert into orders (order_date, amount, customer_id) values ('2020/03/08', 523.6, 41);
insert into orders (order_date, amount, customer_id) values ('2020/06/26', 87.24, 97);
insert into orders (order_date, amount, customer_id) values ('2020/06/28', 720.62, 75);
insert into orders (order_date, amount, customer_id) values ('2019/08/11', 725.61, 100);
insert into orders (order_date, amount, customer_id) values ('2020/02/03', 416.44, 21);
insert into orders (order_date, amount, customer_id) values ('2019/09/16', 402.66, 84);
insert into orders (order_date, amount, customer_id) values ('2020/01/23', 431.09, 24);
insert into orders (order_date, amount, customer_id) values ('2019/09/19', 113.0, 35);
insert into orders (order_date, amount, customer_id) values ('2019/12/23', 367.89, 27);
insert into orders (order_date, amount, customer_id) values ('2020/04/30', 638.49, 41);
insert into orders (order_date, amount, customer_id) values ('2019/09/12', 725.7, 2);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 288.89, 22);
insert into orders (order_date, amount, customer_id) values ('2019/09/10', 548.09, 99);
insert into orders (order_date, amount, customer_id) values ('2019/12/02', 129.59, 33);
insert into orders (order_date, amount, customer_id) values ('2020/05/28', 739.08, 41);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 572.62, 24);
insert into orders (order_date, amount, customer_id) values ('2020/07/07', 104.33, 39);
insert into orders (order_date, amount, customer_id) values ('2020/01/10', 721.3, 1);
insert into orders (order_date, amount, customer_id) values ('2019/09/14', 407.19, 21);
insert into orders (order_date, amount, customer_id) values ('2020/04/29', 315.87, 56);
insert into orders (order_date, amount, customer_id) values ('2019/07/18', 450.73, 15);
insert into orders (order_date, amount, customer_id) values ('2019/12/15', 541.24, 28);
insert into orders (order_date, amount, customer_id) values ('2020/06/12', 577.6, 28);
insert into orders (order_date, amount, customer_id) values ('2019/07/10', 487.14, 20);
insert into orders (order_date, amount, customer_id) values ('2019/12/04', 50.48, 50);
insert into orders (order_date, amount, customer_id) values ('2019/08/03', 779.06, 97);
insert into orders (order_date, amount, customer_id) values ('2020/06/02', 589.26, 31);
insert into orders (order_date, amount, customer_id) values ('2019/07/17', 252.5, 100);
insert into orders (order_date, amount, customer_id) values ('2019/12/13', 403.45, 85);
insert into orders (order_date, amount, customer_id) values ('2020/02/11', 758.39, 95);
insert into orders (order_date, amount, customer_id) values ('2019/07/15', 180.49, 97);
insert into orders (order_date, amount, customer_id) values ('2020/02/27', 143.94, 100);
insert into orders (order_date, amount, customer_id) values ('2020/04/05', 425.89, 77);
insert into orders (order_date, amount, customer_id) values ('2020/04/14', 118.73, 53);
insert into orders (order_date, amount, customer_id) values ('2019/07/27', 212.23, 29);
insert into orders (order_date, amount, customer_id) values ('2020/06/15', 168.97, 55);
insert into orders (order_date, amount, customer_id) values ('2019/07/10', 416.16, 76);
insert into orders (order_date, amount, customer_id) values ('2019/08/09', 291.14, 97);
insert into orders (order_date, amount, customer_id) values ('2020/04/03', 117.06, 82);
insert into orders (order_date, amount, customer_id) values ('2020/07/03', 485.65, 64);
insert into orders (order_date, amount, customer_id) values ('2020/05/25', 42.78, 99);
insert into orders (order_date, amount, customer_id) values ('2020/06/28', 96.96, 84);
insert into orders (order_date, amount, customer_id) values ('2019/08/01', 781.47, 80);
insert into orders (order_date, amount, customer_id) values ('2019/08/26', 381.63, 30);
insert into orders (order_date, amount, customer_id) values ('2020/04/23', 466.78, 50);
insert into orders (order_date, amount, customer_id) values ('2020/06/30', 223.39, 11);
insert into orders (order_date, amount, customer_id) values ('2020/06/29', 266.69, 11);
insert into orders (order_date, amount, customer_id) values ('2019/08/26', 63.88, 97);
insert into orders (order_date, amount, customer_id) values ('2019/08/16', 712.4, 2);
insert into orders (order_date, amount, customer_id) values ('2020/04/20', 411.12, 96);
insert into orders (order_date, amount, customer_id) values ('2020/07/08', 492.67, 18);
insert into orders (order_date, amount, customer_id) values ('2020/05/10', 587.43, 77);
insert into orders (order_date, amount, customer_id) values ('2019/07/29', 308.12, 64);
insert into orders (order_date, amount, customer_id) values ('2020/07/04', 388.26, 4);
insert into orders (order_date, amount, customer_id) values ('2019/07/26', 57.34, 79);
insert into orders (order_date, amount, customer_id) values ('2019/10/23', 78.5, 58);
insert into orders (order_date, amount, customer_id) values ('2020/06/23', 390.2, 2);
insert into orders (order_date, amount, customer_id) values ('2019/10/20', 686.2, 15);
insert into orders (order_date, amount, customer_id) values ('2019/10/22', 358.1, 86);
insert into orders (order_date, amount, customer_id) values ('2020/06/11', 509.31, 22);
insert into orders (order_date, amount, customer_id) values ('2019/09/30', 323.56, 9);
insert into orders (order_date, amount, customer_id) values ('2019/11/06', 334.46, 28);
insert into orders (order_date, amount, customer_id) values ('2019/12/18', 364.33, 82);
insert into orders (order_date, amount, customer_id) values ('2020/06/14', 53.36, 23);
insert into orders (order_date, amount, customer_id) values ('2019/08/29', 192.1, 62);
insert into orders (order_date, amount, customer_id) values ('2020/04/21', 608.87, 47);
insert into orders (order_date, amount, customer_id) values ('2020/04/10', 322.39, 5);
insert into orders (order_date, amount, customer_id) values ('2020/07/05', 617.89, 81);
insert into orders (order_date, amount, customer_id) values ('2020/06/04', 406.76, 2);
insert into orders (order_date, amount, customer_id) values ('2020/04/03', 359.42, 77);
insert into orders (order_date, amount, customer_id) values ('2019/11/21', 539.45, 96);
insert into orders (order_date, amount, customer_id) values ('2019/11/28', 87.27, 32);
insert into orders (order_date, amount, customer_id) values ('2020/06/15', 160.3, 7);
insert into orders (order_date, amount, customer_id) values ('2019/12/02', 667.38, 61);
insert into orders (order_date, amount, customer_id) values ('2020/02/01', 818.84, 53);
insert into orders (order_date, amount, customer_id) values ('2020/02/20', 185.24, 11);
insert into orders (order_date, amount, customer_id) values ('2019/09/14', 768.33, 82);
insert into orders (order_date, amount, customer_id) values ('2020/03/21', 90.49, 3);
insert into orders (order_date, amount, customer_id) values ('2020/04/15', 170.95, 29);
insert into orders (order_date, amount, customer_id) values ('2020/06/26', 564.86, 84);
insert into orders (order_date, amount, customer_id) values ('2019/12/04', 799.69, 96);
insert into orders (order_date, amount, customer_id) values ('2019/08/16', 185.14, 58);
insert into orders (order_date, amount, customer_id) values ('2020/01/23', 802.83, 27);
insert into orders (order_date, amount, customer_id) values ('2020/07/06', 641.55, 15);
insert into orders (order_date, amount, customer_id) values ('2019/10/30', 154.12, 22);
insert into orders (order_date, amount, customer_id) values ('2019/09/15', 565.36, 72);
insert into orders (order_date, amount, customer_id) values ('2020/01/10', 719.51, 86);
insert into orders (order_date, amount, customer_id) values ('2019/09/04', 128.47, 82);
insert into orders (order_date, amount, customer_id) values ('2019/11/23', 303.56, 40);
insert into orders (order_date, amount, customer_id) values ('2020/06/18', 507.36, 34);
insert into orders (order_date, amount, customer_id) values ('2019/10/17', 164.71, 71);
insert into orders (order_date, amount, customer_id) values ('2019/10/05', 74.75, 26);
insert into orders (order_date, amount, customer_id) values ('2020/06/30', 711.25, 6);
insert into orders (order_date, amount, customer_id) values ('2019/11/16', 144.1, 11);
insert into orders (order_date, amount, customer_id) values ('2020/04/10', 774.64, 10);
insert into orders (order_date, amount, customer_id) values ('2019/12/09', 285.87, 35);
insert into orders (order_date, amount, customer_id) values ('2019/09/01', 108.06, 68);
insert into orders (order_date, amount, customer_id) values ('2020/03/17', 305.4, 17);
insert into orders (order_date, amount, customer_id) values ('2019/11/12', 47.55, 27);
insert into orders (order_date, amount, customer_id) values ('2020/04/29', 643.99, 28);
insert into orders (order_date, amount, customer_id) values ('2020/01/14', 591.17, 96);
insert into orders (order_date, amount, customer_id) values ('2020/01/08', 506.32, 66);
insert into orders (order_date, amount, customer_id) values ('2019/10/14', 149.9, 77);
insert into orders (order_date, amount, customer_id) values ('2019/09/29', 149.82, 62);
insert into orders (order_date, amount, customer_id) values ('2020/01/28', 220.08, 73);
insert into orders (order_date, amount, customer_id) values ('2020/04/16', 197.43, 28);
insert into orders (order_date, amount, customer_id) values ('2019/08/26', 145.34, 6);
insert into orders (order_date, amount, customer_id) values ('2020/03/07', 50.77, 71);
insert into orders (order_date, amount, customer_id) values ('2019/08/05', 761.8, 2);
insert into orders (order_date, amount, customer_id) values ('2020/02/02', 281.23, 69);
insert into orders (order_date, amount, customer_id) values ('2020/04/27', 439.79, 93);
insert into orders (order_date, amount, customer_id) values ('2020/05/08', 215.75, 36);
insert into orders (order_date, amount, customer_id) values ('2019/08/15', 706.78, 52);
insert into orders (order_date, amount, customer_id) values ('2019/07/24', 307.2, 3);
insert into orders (order_date, amount, customer_id) values ('2020/04/06', 766.54, 58);
insert into orders (order_date, amount, customer_id) values ('2019/11/03', 649.24, 56);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 438.11, 81);
insert into orders (order_date, amount, customer_id) values ('2019/08/26', 37.93, 25);
insert into orders (order_date, amount, customer_id) values ('2019/12/05', 371.74, 14);
insert into orders (order_date, amount, customer_id) values ('2019/11/18', 341.73, 18);
insert into orders (order_date, amount, customer_id) values ('2020/02/21', 249.05, 92);
insert into orders (order_date, amount, customer_id) values ('2019/10/05', 641.32, 30);
insert into orders (order_date, amount, customer_id) values ('2020/06/11', 287.65, 8);
insert into orders (order_date, amount, customer_id) values ('2020/06/11', 227.34, 41);
insert into orders (order_date, amount, customer_id) values ('2019/07/20', 796.28, 15);
insert into orders (order_date, amount, customer_id) values ('2019/07/15', 581.79, 24);
insert into orders (order_date, amount, customer_id) values ('2019/09/28', 767.23, 11);
insert into orders (order_date, amount, customer_id) values ('2019/10/09', 418.25, 69);
insert into orders (order_date, amount, customer_id) values ('2020/04/04', 586.26, 70);
insert into orders (order_date, amount, customer_id) values ('2020/02/19', 224.94, 75);
insert into orders (order_date, amount, customer_id) values ('2019/07/14', 70.61, 38);
insert into orders (order_date, amount, customer_id) values ('2020/02/28', 749.73, 31);
insert into orders (order_date, amount, customer_id) values ('2019/08/09', 404.65, 23);
insert into orders (order_date, amount, customer_id) values ('2020/05/27', 385.96, 31);
insert into orders (order_date, amount, customer_id) values ('2020/02/08', 359.33, 3);
insert into orders (order_date, amount, customer_id) values ('2020/05/03', 814.5, 77);
insert into orders (order_date, amount, customer_id) values ('2019/10/08', 482.49, 13);
insert into orders (order_date, amount, customer_id) values ('2020/06/26', 596.73, 79);
insert into orders (order_date, amount, customer_id) values ('2020/02/13', 56.53, 89);
insert into orders (order_date, amount, customer_id) values ('2020/06/28', 629.56, 66);
insert into orders (order_date, amount, customer_id) values ('2020/01/09', 248.13, 66);
insert into orders (order_date, amount, customer_id) values ('2020/07/08', 261.9, 57);
insert into orders (order_date, amount, customer_id) values ('2020/01/13', 54.72, 16);
insert into orders (order_date, amount, customer_id) values ('2019/12/27', 188.75, 45);
insert into orders (order_date, amount, customer_id) values ('2020/05/31', 371.04, 29);
insert into orders (order_date, amount, customer_id) values ('2020/06/06', 55.74, 50);
insert into orders (order_date, amount, customer_id) values ('2020/02/23', 141.26, 4);
insert into orders (order_date, amount, customer_id) values ('2019/12/23', 709.88, 89);
insert into orders (order_date, amount, customer_id) values ('2019/09/20', 342.59, 57);
insert into orders (order_date, amount, customer_id) values ('2020/06/24', 741.52, 90);
insert into orders (order_date, amount, customer_id) values ('2020/06/20', 782.25, 10);
insert into orders (order_date, amount, customer_id) values ('2020/02/26', 216.78, 17);
insert into orders (order_date, amount, customer_id) values ('2020/04/23', 366.84, 98);
insert into orders (order_date, amount, customer_id) values ('2020/02/06', 754.99, 16);
insert into orders (order_date, amount, customer_id) values ('2019/10/13', 183.17, 76);
insert into orders (order_date, amount, customer_id) values ('2019/11/05', 562.16, 32);
insert into orders (order_date, amount, customer_id) values ('2020/05/05', 676.9, 65);
insert into orders (order_date, amount, customer_id) values ('2019/11/30', 466.07, 78);
insert into orders (order_date, amount, customer_id) values ('2020/07/04', 76.61, 42);
insert into orders (order_date, amount, customer_id) values ('2019/08/25', 64.85, 69);
insert into orders (order_date, amount, customer_id) values ('2019/10/08', 414.57, 28);
insert into orders (order_date, amount, customer_id) values ('2020/03/07', 665.8, 6);
insert into orders (order_date, amount, customer_id) values ('2019/08/10', 630.55, 63);
insert into orders (order_date, amount, customer_id) values ('2020/06/11', 169.6, 75);
insert into orders (order_date, amount, customer_id) values ('2019/07/15', 117.67, 27);
insert into orders (order_date, amount, customer_id) values ('2019/12/11', 570.92, 30);
insert into orders (order_date, amount, customer_id) values ('2019/10/31', 52.7, 17);
insert into orders (order_date, amount, customer_id) values ('2020/01/31', 506.04, 44);
insert into orders (order_date, amount, customer_id) values ('2019/10/09', 570.6, 35);
insert into orders (order_date, amount, customer_id) values ('2020/01/16', 680.35, 29);
insert into orders (order_date, amount, customer_id) values ('2020/02/07', 700.25, 29);
insert into orders (order_date, amount, customer_id) values ('2019/10/11', 176.74, 65);
insert into orders (order_date, amount, customer_id) values ('2019/08/24', 679.5, 17);
insert into orders (order_date, amount, customer_id) values ('2019/10/29', 793.83, 83);
insert into orders (order_date, amount, customer_id) values ('2020/03/14', 281.97, 16);
insert into orders (order_date, amount, customer_id) values ('2020/06/06', 773.97, 19);
insert into orders (order_date, amount, customer_id) values ('2020/07/02', 414.08, 20);
insert into orders (order_date, amount, customer_id) values ('2020/07/03', 633.64, 33);
insert into orders (order_date, amount, customer_id) values ('2019/08/27', 200.69, 45);
insert into orders (order_date, amount, customer_id) values ('2020/04/05', 161.62, 47);
insert into orders (order_date, amount, customer_id) values ('2019/11/29', 276.1, 62);
insert into orders (order_date, amount, customer_id) values ('2019/11/13', 768.62, 70);
insert into orders (order_date, amount, customer_id) values ('2019/09/11', 72.76, 79);
insert into orders (order_date, amount, customer_id) values ('2020/02/18', 342.49, 87);
insert into orders (order_date, amount, customer_id) values ('2020/03/30', 184.29, 62);
insert into orders (order_date, amount, customer_id) values ('2020/03/02', 265.81, 4);
insert into orders (order_date, amount, customer_id) values ('2019/09/15', 215.11, 22);
insert into orders (order_date, amount, customer_id) values ('2019/12/07', 485.57, 24);
insert into orders (order_date, amount, customer_id) values ('2020/04/14', 787.8, 13);
insert into orders (order_date, amount, customer_id) values ('2020/01/22', 580.08, 65);
insert into orders (order_date, amount, customer_id) values ('2020/02/04', 71.27, 67);
insert into orders (order_date, amount, customer_id) values ('2020/04/30', 184.74, 36);
insert into orders (order_date, amount, customer_id) values ('2020/02/10', 628.51, 17);
insert into orders (order_date, amount, customer_id) values ('2019/09/29', 442.02, 81);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 299.52, 32);
insert into orders (order_date, amount, customer_id) values ('2020/03/16', 243.56, 54);
insert into orders (order_date, amount, customer_id) values ('2019/08/15', 821.63, 100);
insert into orders (order_date, amount, customer_id) values ('2019/09/29', 211.4, 57);
insert into orders (order_date, amount, customer_id) values ('2020/03/16', 368.17, 89);
insert into orders (order_date, amount, customer_id) values ('2019/09/30', 471.68, 50);
insert into orders (order_date, amount, customer_id) values ('2020/02/15', 123.42, 57);
insert into orders (order_date, amount, customer_id) values ('2020/05/20', 332.1, 62);
insert into orders (order_date, amount, customer_id) values ('2020/03/26', 403.94, 99);
insert into orders (order_date, amount, customer_id) values ('2020/02/23', 377.83, 95);
insert into orders (order_date, amount, customer_id) values ('2020/05/17', 562.24, 26);
insert into orders (order_date, amount, customer_id) values ('2019/07/27', 400.22, 92);
insert into orders (order_date, amount, customer_id) values ('2019/12/06', 294.7, 38);
insert into orders (order_date, amount, customer_id) values ('2020/03/28', 201.47, 2);
insert into orders (order_date, amount, customer_id) values ('2019/08/15', 745.8, 34);
insert into orders (order_date, amount, customer_id) values ('2020/06/13', 681.44, 64);
insert into orders (order_date, amount, customer_id) values ('2019/09/10', 566.54, 36);
insert into orders (order_date, amount, customer_id) values ('2019/10/30', 100.54, 8);
insert into orders (order_date, amount, customer_id) values ('2019/11/17', 601.29, 53);
insert into orders (order_date, amount, customer_id) values ('2020/03/16', 688.82, 6);
insert into orders (order_date, amount, customer_id) values ('2019/08/01', 803.28, 69);
insert into orders (order_date, amount, customer_id) values ('2020/02/25', 598.03, 82);
insert into orders (order_date, amount, customer_id) values ('2019/08/02', 518.97, 46);
insert into orders (order_date, amount, customer_id) values ('2020/01/18', 634.07, 36);
insert into orders (order_date, amount, customer_id) values ('2020/04/17', 202.59, 4);
insert into orders (order_date, amount, customer_id) values ('2020/06/09', 300.45, 38);
insert into orders (order_date, amount, customer_id) values ('2020/02/21', 77.77, 97);
insert into orders (order_date, amount, customer_id) values ('2019/12/30', 213.77, 62);
insert into orders (order_date, amount, customer_id) values ('2019/09/15', 313.14, 17);
insert into orders (order_date, amount, customer_id) values ('2019/12/25', 576.57, 18);
insert into orders (order_date, amount, customer_id) values ('2019/09/15', 188.7, 2);
insert into orders (order_date, amount, customer_id) values ('2020/02/15', 578.98, 56);
insert into orders (order_date, amount, customer_id) values ('2019/11/09', 689.3, 62);
insert into orders (order_date, amount, customer_id) values ('2019/12/22', 63.08, 99);
insert into orders (order_date, amount, customer_id) values ('2020/03/17', 181.85, 13);
insert into orders (order_date, amount, customer_id) values ('2019/09/14', 637.78, 39);
insert into orders (order_date, amount, customer_id) values ('2019/09/02', 698.44, 17);
insert into orders (order_date, amount, customer_id) values ('2020/03/07', 388.73, 13);
insert into orders (order_date, amount, customer_id) values ('2019/11/11', 652.53, 54);
insert into orders (order_date, amount, customer_id) values ('2019/10/16', 405.04, 6);
insert into orders (order_date, amount, customer_id) values ('2019/12/06', 628.92, 58);
insert into orders (order_date, amount, customer_id) values ('2019/10/19', 275.55, 29);
insert into orders (order_date, amount, customer_id) values ('2019/12/10', 254.49, 83);
insert into orders (order_date, amount, customer_id) values ('2020/04/17', 687.92, 5);
insert into orders (order_date, amount, customer_id) values ('2019/12/03', 580.32, 79);
insert into orders (order_date, amount, customer_id) values ('2020/04/11', 339.02, 61);
insert into orders (order_date, amount, customer_id) values ('2020/03/28', 155.76, 95);
insert into orders (order_date, amount, customer_id) values ('2020/05/13', 620.21, 85);
insert into orders (order_date, amount, customer_id) values ('2019/11/10', 223.76, 81);
insert into orders (order_date, amount, customer_id) values ('2020/02/01', 440.74, 12);
insert into orders (order_date, amount, customer_id) values ('2020/07/06', 694.38, 75);
insert into orders (order_date, amount, customer_id) values ('2020/04/17', 421.24, 63);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 272.47, 9);
insert into orders (order_date, amount, customer_id) values ('2019/09/10', 355.01, 22);
insert into orders (order_date, amount, customer_id) values ('2020/01/18', 398.05, 24);
insert into orders (order_date, amount, customer_id) values ('2020/04/22', 765.62, 99);
insert into orders (order_date, amount, customer_id) values ('2020/02/17', 500.16, 21);
insert into orders (order_date, amount, customer_id) values ('2019/09/06', 42.12, 72);
insert into orders (order_date, amount, customer_id) values ('2019/12/11', 294.86, 66);
insert into orders (order_date, amount, customer_id) values ('2020/01/21', 773.87, 80);
insert into orders (order_date, amount, customer_id) values ('2019/08/16', 481.02, 98);
insert into orders (order_date, amount, customer_id) values ('2020/04/16', 751.77, 31);

select * from customers;
select * from orders;

-- 두개의 테이블을 하나로 합쳐서 가져오시오. | orders.customer_id와 customers.id가 같은 값이니까 join
-- join하면 같은 id끼리 연결되어서 조회됨.
select * from orders as o join customers as c on o.customer_id = c.id;

-- 중복된 컬럼명은 변경시켜 준다.
-- select id from orders as o join customers as c on o.customer_id = c.id; | id컬럼이 2개라서 에러
select o.id from orders as o join customers as c on o.customer_id = c.id;
select c.id from orders as o join customers as c on o.customer_id = c.id;

select o.id as order_id, o.order_date, o.amount, o.customer_id, c.*
from orders as o join customers as c on o.customer_id = c.id;

-- 예를 들어서 회원가입은 했는데 주문을 한번도 하지 않은 사람들도 있다.
-- 따라서 모든 고객 데이터를 가져오되 주문하지 않은 사람들도 정보를 볼 수 있도록 하는 방법이 필요하다.
-- left join, right join | 왼쪽 또는 오른쪽 테이블 id를 기준으로 정렬
-- 보통 from 다음 테이블이 left | join 다음 테이블이 right
-- 여기서 left는 customers | right는 orders
select * from customers c left join orders o on c.id = o.customer_id; -- left 기준 조회
select * from customers c right join orders o on c.id = o.customer_id; -- right 기준 조회

-- 당연히 이런 경우에는 orders가 left | customers가 right이다.
select * from orders o join customers c on o.customer_id = c.id;

-- left join, right join은 id만 기준으로 정렬
-- from과 join 뒤에 설정한 테이블 위치가 다르다면 표시 위치가 달라짐

-- 주문금액이 600달러보다 큰 데이터를 가져오시오.
select * from orders o join customers c on o.customer_id = c.id where o.amount > 600;

-- 위 결과에서 이메일과 주문금액, 주문날짜를 가져오시오.
select email, amount, order_date from orders o join customers c on o.customer_id = c.id where o.amount > 600;

-- 위 결과를 주문날짜 기준 내림차순으로 가져오시오.
select email, amount, order_date from orders o join customers c on o.customer_id = c.id where o.amount > 600 order by order_date desc;

-- 고객 아이디가 36인 사람의 주문내역(모든 정보)을 가져오시오.
select * from customers c join orders o on c.id = o.customer_id where c.id = 36;

-- first_name이 'Cobby'인 사람의 주문내역(모든 정보)을 가져오시오.
select * from customers c join orders o on c.id = o.customer_id where first_name = 'Cobby';

-- first_name에 ty가 포함되어 있는 사람의 주문내역(모든 정보)을 가져오시오.
select * from customers c join orders o on c.id = o.customer_id where first_name like '%ty%';

-- 주문금액이 300이상 500이하인 주문내역(모든 정보)을 가져오되 주문한 사람의 이메일도 함께 조회되도록 가져오시오.
select o.*, c.email from customers c join orders o on c.id = o.customer_id where amount between 300 and 500;

-- 각 고객별로 주문 수를 나타내시오.
-- (단 고객의 이름과 이메일이 함께 나와야 합니다.)
-- group by c.id | count(o.id)
-- 이렇게 하면 c.id로 그룹핑 된 상태에서 o.id의 갯수(주문 수)를 알아낼 수 있다.
select first_name, last_name, email, count(o.id) order_count from customers c join orders o on c.id = o.customer_id group by c.id;

-- 각 고객별로 주문금액 평균이 300달러 이상인 데이터를 가져오시오.
-- (단 고객의 이메일, 이름, 평균금액이 함께 나와야 합니다.)
select email, first_name, last_name, avg(amount) avg_amount from customers c join orders o on c.id = o.customer_id group by c.id having avg_amount >= 300;

-- 각 고객별로 주문금액의 최대값을 구하고
-- 이 값이 600달러 이상인 데이터만 가져와서
-- 내림차순으로 정렬하시오.
-- (단 고객의 이메일, 이름, 주문최대금액이 함께 나와야 합니다.)
select email, first_name, last_name, max(amount) max_amount from customers c join orders o on c.id = o.customer_id group by c.id having max_amount >= 600 order by max_amount desc;

-- 2019년 12월 20일에서 2020년 01월 10일까지의 주문내역 중 주문한 사람은 총 몇명인지 구하시오.
-- iso형식을 맞춘다면 datetime형식도 조건 검색이 가능하다.
-- distinct | 중복 제거 | 고유한 값
select count(distinct customer_id) total from orders where order_date between '2019-12-20' and '2020-01-10';

-- 2019년 12월 20일에서 2020년 01월 10일까지의 주문내역 중
-- 고객별 주문금액평균이 300달러 이상인 사람의
-- 이름과 평균금액을 가져오시오.
select first_name, last_name, avg(amount) avg_amount from orders o join customers c on o.customer_id = c.id where order_date between '2019-12-20' and '2020-01-10' group by c.id having avg_amount >= 300 order by avg_amount desc;

-- 실습 문제 ___________________________________________________________________________________________
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- 실습 문제 001
select first_name, title, grade from students s join papers p on s.id = p.student_id order by grade desc;

-- 실습 문제 002
select first_name, title, grade from students s left join papers p on s.id = p.student_id;

-- 실습 문제 003
select first_name, ifnull(title, 'MISSING') title, ifnull(grade, 0) grade from students s left join papers p on s.id = p.student_id;

-- 실습 문제 004
select first_name, ifnull(avg(grade), 0) average from students s left join papers p on s.id = p.student_id group by s.id order by average desc;

-- 실습 문제 005
select first_name, ifnull(avg(grade), 0) average, if(avg(grade) >= 75, 'PASSING', 'FAILING') passing_status from students s left join papers p on s.id = p.student_id group by s.id order by average desc;
-- 또는
select first_name, ifnull(avg(grade), 0) average, case when avg(grade) >= 75 then 'PASSING' else 'FAILING' end passing_status from students s left join papers p on s.id = p.student_id group by s.id order by average desc;

-- foreign key가 바인딩 되어있는 테이블이기 때문에 삭제할 수 없음.
delete from students where id = 1;

-- 삭제하려면 Foreign Keys탭에서 Foreign Key Options의 On Delete를 CASCADE로 변경해주어야 한다.
delete from students where id = 1;
select * from students; -- 이제 삭제 됨.

-- 실습 문제 ___________________________________________________________________________________________

INSERT INTO series (title, released_year, genre) VALUES
   ('Archer', 2009, 'Animation'),
   ('Arrested Development', 2003, 'Comedy'),
   ("Bob's Burgers", 2011, 'Animation'),
   ('Bojack Horseman', 2014, 'Animation'),
   ("Breaking Bad", 2008, 'Drama'),
   ('Curb Your Enthusiasm', 2000, 'Comedy'),
   ("Fargo", 2014, 'Drama'),
   ('Freaks and Geeks', 1999, 'Comedy'),
   ('General Hospital', 1963, 'Drama'),
   ('Halt and Catch Fire', 2014, 'Drama'),
   ('Malcolm In The Middle', 2000, 'Comedy'),
   ('Pushing Daisies', 2007, 'Comedy'),
   ('Seinfeld', 1989, 'Comedy'),
   ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
   ('Thomas', 'Stoneman'),
   ('Wyatt', 'Skaggs'),
   ('Kimbra', 'Masters'),
   ('Domingo', 'Cortes'),
   ('Colt', 'Steele'),
   ('Pinkie', 'Petit'),
   ('Marlon', 'Crafford');
  
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
   (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
   (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
   (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
   (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
   (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
   (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
   (7,2,9.1),(7,5,9.7),
   (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
   (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
   (10,5,9.9),
   (13,3,8.0),(13,4,7.2),
   (14,2,8.5),(14,3,8.9),(14,4,8.9);

select * from reviewers;
select * from series;
select * from reviews;

-- 실습 문제 001
select title, rating from series s join reviews r on s.id = r.series_id;

-- 실습 문제 002
select title, avg(rating) avg_rating from series s join reviews r on s.id = r.series_id group by s.id order by avg_rating asc;

-- 실습 문제 003
select first_name, last_name, rating from reviewers rv join reviews r on rv.id = r.reviewer_id;

-- 실습 문제 004
select title unreviewed_series from series s left join reviews r on s.id = r.series_id where rating is null;

-- 실습 문제 005
select genre, avg(rating) avg_rating from series s join reviews r on s.id = r.series_id group by genre;

-- 실습 문제 006
select first_name, last_name, count(r.id) COUNT, ifnull(min(rating), 0) MIN, ifnull(max(rating), 0) MAX, ifnull(avg(rating), 0) AVG, if(rating is null, 'INACTIVE', 'ACTIVE') STATUS from reviewers rv left join reviews r on rv.id = r.reviewer_id group by rv.id;

-- 실습 문제 007
select title, rating, concat_ws(' ', first_name, last_name) reviewer from reviews r join series s on r.series_id = s.id join reviewers rv on r.reviewer_id = rv.id order by s.id;