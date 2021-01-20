DROP DATABASE IF EXISTS meme_db;
CREATE USER IF NOT EXISTS 'memiarz'@'localhost' IDENTIFIED BY '1234';
GRANT INSERT, SELECT, DELETE, UPDATE ON *.* TO 'memiarz'@'localhost' IDENTIFIED BY '1234';
CREATE DATABASE IF NOT EXISTS meme_db CHARACTER SET utf8 COLLATE utf8_polish_ci;

FLUSH PRIVILEGES;


USE meme_db;

create table category
(
	category_id int auto_increment
		primary key,
	name varchar(30) null
);

create table image
(
	meme_id int auto_increment
		primary key,
	tag varchar(20) null,
	address varchar(300) null,
	name varchar(30) null,
	category_id int not null,
	constraint meme_category_category_id_fk
		foreign key (category_id) references category (category_id)
);

create table user
(
	user_id int auto_increment,
	username varchar(30) not null,
	password varchar(300) not null,
	email varchar(40) not null,
	constraint User_user_id_uindex
		unique (user_id)
);


INSERT INTO meme_db.user (user_id, username, password, email) VALUES (1, 'akrason', '$2y$12$F.3uE0rc1uZqVtAKtbh9jePiaITGErCJmMdg34j8SeAtJKhJJ52aK', 'akrason@mail.pl');
INSERT INTO meme_db.user (user_id, username, password, email) VALUES (2, 'kkusik', '$2y$12$uqLZ9IRqfszjL5BMWLh3G.K23ARvy946X4at1TVXIKxhBVqGH4Woy', 'karolkusik@mail.pl');
INSERT INTO meme_db.user (user_id, username, password, email) VALUES (3, 'patrykp', '$2y$12$ngNY8SjNxwcptyMaVOoKPuqOWuJZQCMrvFalF5c6Kgj3CHbSwt/O.', 'patryczek@gmail.com');
INSERT INTO meme_db.user (user_id, username, password, email) VALUES (4, 'sadpepefrog', '$2y$12$LPLTOYshKjZKBTrSnUBEV.l7eLVV36CL8xqmoDk5OfWCJMxwANZg2', 'lambdadelta@onet.pl');

INSERT INTO meme_db.category (category_id, name) VALUES (1, 'other');
INSERT INTO meme_db.category (category_id, name) VALUES (2, 'think');
INSERT INTO meme_db.category (category_id, name) VALUES (3, 'school');
INSERT INTO meme_db.category (category_id, name) VALUES (4, 'hide_the_pain_harold');
INSERT INTO meme_db.category (category_id, name) VALUES (5, 'food');
INSERT INTO meme_db.category (category_id, name) VALUES (6, 'animal');
INSERT INTO meme_db.category (category_id, name) VALUES (7, 'nosacz');
INSERT INTO meme_db.category (category_id, name) VALUES (8, 'job');
INSERT INTO meme_db.category (category_id, name) VALUES (9, 'health');
INSERT INTO meme_db.category (category_id, name) VALUES (10, 'child');
INSERT INTO meme_db.category (category_id, name) VALUES (11, 'popculture');
INSERT INTO meme_db.category (category_id, name) VALUES (12, 'christmas');
INSERT INTO meme_db.category (category_id, name) VALUES (13, 'shopping');
INSERT INTO meme_db.category (category_id, name) VALUES (14, 'flirting');

INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (1, 'dziecko', 'https://mojchorzow.pl/thumb/dzisiaj-obchodzimy-dzien-ojca-zobaczcie-najsmieszniejsze-memy/912004/1200/1200/i/jpg', 'dziecko za kierownicą', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (2, 'AI', 'https://www.tabletowo.pl/wp-content/uploads/2020/04/imgflip-meme-ai-5.jpg', 'sztuczna inteligencja', 2);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (3, 'rząd', 'https://nowe.memy.pl/show/big/uploads/Post/124175/14869902573900.jpg', 'członek rządu', 2);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (4, 'młotki', 'https://i.pinimg.com/originals/7c/b8/13/7cb813c8dd165745b14a90c102e8bf57.jpg', 'testowanie produktu', 4);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (5, 'szkoła', 'https://mojchorzow.pl/thumb/pierwszy-dzien-szkoly-nie-musi-byc-smutny-zobaczcie-memy-na-poprawe-humoru/904297/1200/1200/i/jpg', '1 września', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (6, 'piłka nożna', 'https://cdn.galleries.smcloud.net/t/galleries/gf-amDT-L6jh-Pkvo_polska-kolumbia-2018-memy-po-przegranym-meczu-na-ms-w-rosji-664x442-nocrop.jpg', 'nie wyjdziesz z grupy', 2);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (7, 'jedzenie', 'https://i.wpimg.pl/730x0/m.fotoblogia.pl/18-03-di-caprio-aa33b1ef5c68d30f.jpg', 'słoik bigosu', 5);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (8, 'szkoła', 'https://www.wprost.pl/_thumb/e6/ff/9d1e1d70b363c0c4a470dc067ffc.jpeg', 'najpiękniejsze słowa', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (9, 'szkoła', 'https://swiony.pl/thumb/matura-2020---zobaczcie-najsmieszniejsze-memy/912921/1200/1200/i/jpg', 'matura', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (10, 'poniedziałek', 'https://d-art.ppstatic.pl/kadry/k/r/1/71/ec/5da9a9c73d9d3_o_medium.jpg', 'poniedziałek', 6);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (11, 'piłka nożna', 'https://d-art.ppstatic.pl/kadry/k/r/1/b2/97/5bc3ab498ac8d_o_medium.jpg', 'janusz piłki', 7);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (12, 'praca', 'https://cdn-images.interviewme.pl/pages/nowa_praca_memy_2.jpg', 'praca zmienia', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (13, 'praca', 'https://cdn-images.interviewme.pl/pages/ciezka_praca_memy.jpg', 'leniwy pracownik', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (14, 'praca', 'https://wiadomosci.com/wp-content/uploads/2020/08/5f476fdc07b4f_osize610x0q70hfd562d.jpg', 'urlop w hiszpanii', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (15, 'szkoła', 'https://mojchorzow.pl/thumb/matura-2020-memy/911805/1200/1200/oww/jpg', 'uważaj', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (16, 'szkoła', 'https://spsiechnice.pl/wp-content/uploads/2020/05/statek.jpg', 'ortografia', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (17, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_praca_biurowa.jpg', '1 dzień wolnego', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (18, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_praca_biurowa_2.jpg', '7 godzin', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (19, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_praca_biurowa_3.jpg', 'głupi ludzie', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (20, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_o_pracy_w_korpo.jpg', 'równowaga w pracy', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (21, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_o_pracy_w_korpo_3.jpg', 'spotkanie w korpo', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (22, 'praca', 'https://cdn-images.interviewme.pl/pages/ciezka_praca_memy_2.jpg', 'sad pepe job', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (23, 'praca', 'https://cdn-images.interviewme.pl/pages/nowa_praca_memy.jpg', 'nadchodzi praca', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (24, 'praca', 'https://cdn-images.interviewme.pl/pages/sobota_w_pracy_memy_3.jpg', 'praca w sobotę', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (25, 'praca', 'https://cdn-images.interviewme.pl/pages/sobota_w_pracy_memy_2.jpg', 'praca w sobotę 2', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (26, 'praca', 'https://cdn-images.interviewme.pl/pages/weekend_w_pracy_memy.jpg', 'praca w weekend', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (27, 'nosacz', 'https://cdn-images.interviewme.pl/pages/nosacz_memy_praca_4.jpg', 'zatęsknisz pjoter', 7);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (28, 'praca', 'https://cdn-images.interviewme.pl/pages/memy_o_pracy_w_nocy.jpg', 'nocna zmiana', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (29, 'praca', 'https://cdn-images.interviewme.pl/pages/rozmowa_o_prace_memy.jpg', 'doświadczenie w pracy', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (30, 'poniedziałek', 'https://cdn-images.interviewme.pl/pages/poniedzialek_praca_memy_2.jpg', 'monday lisa', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (31, 'praca', 'https://cdn-images.interviewme.pl/pages/poniedzialek_praca_memy.jpg', 'weekend', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (32, 'pies', 'https://d-art.ppstatic.pl/kadry/k/r/1/87/b9/5f6a4249f195c_o_large.jpg', 'kredyt', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (33, 'zdrowie', 'https://d-art.ppstatic.pl/kadry/k/r/1/66/64/5e96e0ab758b8_o_medium.jpg', 'ludzie w masce', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (34, 'zdrowie', 'https://d-art.ppstatic.pl/kadry/k/r/1/07/55/5ebb12fe7851e_o_full.jpg', 'pielucha', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (35, 'internet', 'https://i.wpimg.pl/490x0/i.wp.pl/a/f/jpeg/36642/fe0e53636_jeszcze_jeden_mem_o_mnie.jpeg', 'skasuję internet', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (36, 'dziecko', 'https://d-pt.ppstatic.pl/k/r/1/2c/9a/5eb13484d61cf_p.jpg?1588785809', 'co widzi', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (37, 'dziecko', 'https://d-pt.ppstatic.pl/k/r/1/9f/24/5eb133f8681ba_p.jpg?1588671480', 'słodki bombelek', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (38, 'jedzenie', 'https://mojekatowice.pl/thumb/dzien-babci-i-dziadka-memy/883858/1200/1200/oww/jpg', 'schabowy u babci', 5);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (39, 'szkoła', 'https://d-art.ppstatic.pl/kadry/k/r/1/8c/50/5fa137bcb239c_o_medium.jpg', 'szkoła z wirusem', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (40, 'zdrowie', 'https://mojmikolow.pl/thumb/dzis-mezczyzni-obchodza-swoje-swieto-zobaczcie-najsmieszniejsze-memy/853849/1200/1200/i/jpg', 'mężczyzna nie choruje', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (41, 'jedzenie', 'https://mojekatowice.pl/thumb/dzien-babci-i-dziadka-memy/883867/1200/1200/oww/jpg', 'dokładka', 5);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (42, 'muzyka', 'https://podlaskie24.pl/wp-content/uploads/2020/07/podlaskie24.pl-memy-o-podlasiu-dlaczego-sa-tak-popularne-i-jaka-jest-ich-historia-53tuipjc5krimu9i-560x480.jpg', 'zenek', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (43, 'filmy', 'https://podlaskie24.pl/wp-content/uploads/2020/07/podlaskie24.pl-memy-o-podlasiu-dlaczego-sa-tak-popularne-i-jaka-jest-ich-historia-42d68392-67b3-4e24-a4cd-1d28ca1ba701.jpg', 'konon', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (44, 'szkoła', 'https://memy.pl/show/big/uploads/Post/327836/15928515668575.jpg', 'e-lekcje', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (45, 'szkoła', 'https://memy.pl/show/big/uploads/Post/316366/15862763035867.jpg', 'typowa e-lekcja', 3);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (46, 'kłótnia', 'https://i.pinimg.com/736x/52/07/f4/5207f42a113c4ba190ef2138bdef45f7.jpg', 'po kłótni', 2);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (47, 'filmy', 'https://podlaskie24.pl/wp-content/uploads/2020/07/podlaskie24.pl-memy-o-podlasiu-dlaczego-sa-tak-popularne-i-jaka-jest-ich-historia-5ae7055c6f6bc-o-original.jpg', 'bruce willis na podlasiu', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (48, 'święta', 'https://d-art.ppstatic.pl/kadry/k/r/1/dc/69/5faa521848530_o_large.jpg', 'grinch', 12);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (49, 'filmy', 'https://i.pinimg.com/736x/60/be/aa/60beaae8cb057618e92f5b0bcfb4188b.jpg', 'zdjęcie shreka', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (50, 'filmy', 'https://i0.wp.com/canfasdblog.com/wp-content/uploads/2020/04/covid4-1.jpg?fit=691%2C361&ssl=1', 'do you wanna drink', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (51, 'alkohol', 'https://i0.wp.com/canfasdblog.com/wp-content/uploads/2020/04/covid11.jpg?resize=720%2C665&ssl=1', 'pijana barbie', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (52, 'praca', 'https://www.iqmetrix.com/hs-fs/hubfs/Meme%202.jpg?width=400&name=Meme%202.jpg', 'mów mi więcej', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (53, 'zakupy', 'https://www.iqmetrix.com/hs-fs/hubfs/Meme%205.jpg?width=450&name=Meme%205.jpg', 'czarny piatek nadchodzi', 13);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (54, 'zakupy', 'https://www.iqmetrix.com/hs-fs/hubfs/Meme%207.jpg?width=400&name=Meme%207.jpg', 'niemiły klient', 13);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (55, 'spanie', 'https://i.pinimg.com/736x/dc/4b/10/dc4b101f7c86f29ed800bc44919028ae.jpg', 'upadek we śnie', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (56, 'dziecko', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-killa-baby-gun.jpg', 'ain''t a killa', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (57, 'samochód', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-pics-one-job-learn-park-helen-keller.jpg', 'naucz się parkować', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (58, 'zwierzę', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-penguin-skeleton-hanger.jpg', 'szkielet pingwina', 6);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (59, 'praca', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-work-discrimination-unemplyed-happy-people.jpg', 'dyskryminacja', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (60, 'pies', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-art-history-dogs-named-me.jpg', 'imiona', 6);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (61, 'dziecko', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-child-difficult-shower-bath-towel.jpg', 'niegrzeczne dziecko', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (62, 'zwierzę', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-giant-spider-car.jpg', 'pająk', 6);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (63, 'ortografia', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-signs-difference-their-there-theyre-your-bad-grammar.jpg', 'pisownia', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (64, 'jedzenie', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-garlic-wise-woman.jpg', 'więcej czosnku', 5);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (65, 'zdjęcie', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-wedding-pictures-after-reception.jpg', 'zdjęcia z wesela', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (66, 'filmy', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-trademark-lion-king-chewbacca.jpg', 'chewbacca', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (67, 'filmy', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-harry-potter-america-always-florida-alabama-california.jpg', 'wasza trójka w ameryce', 11);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (68, 'dziecko', 'https://teamjimmyjoe.com/wp-content/uploads/2019/06/funny-memes-girls-feel-like-look-like-dad.jpg', 'wygląda jak ojciec', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (69, 'zdrowie', 'https://www.wearethemighty.com/app/uploads/legacy/assets.rbl.ms/22884259/origin.png', 'kwarantanna na co dzień', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (70, 'praca', 'https://www.wearethemighty.com/app/uploads/legacy/assets.rbl.ms/22884149/origin.png', 'praca z domu', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (71, 'zdrowie', 'https://www.wearethemighty.com/app/uploads/legacy/assets.rbl.ms/22884170/origin.png', 'papier toaletowy', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (72, '2020', 'https://www.wearethemighty.com/app/uploads/legacy/assets.rbl.ms/22884183/origin.png', 'rok 2020', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (73, 'zdrowie', 'https://www.wearethemighty.com/app/uploads/legacy/assets.rbl.ms/22884199/origin.png', 'koronawirus jako osoba', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (74, 'zdrowie', 'https://voicesofmontereybay.org/wp-content/uploads/2020/05/blink.jpg', '35. dzień kwarantanny', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (75, 'podryw', 'https://akns-images.eonline.com/eol_images/Entire_Site/2016813/rs_600x600-160913131825-600-hey-girl2.jpg', 'materiał na chłopaka', 14);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (76, 'zdrowie', 'https://cached.imagescaler.hbpl.co.uk/resize/scaleWidth/815/cached.offlinehbpl.hbpl.co.uk/news/SUC/MEMAYY-20200316081851159.jpg', 'kaszel w samolocie', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (77, 'poniedziałek', 'https://assets.vogue.com/photos/58913a68736d5f2410e373bd/master/w_1600%2Cc_limit/08-chrissy-teigen-monday-morning.jpg', 'poniedziałek rano', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (78, 'zdrowie', 'https://content.api.news/v3/images/bin/ca8c6c1fc8eded3ee5f4ac76b5f79295?width=1280', 'przeklinanie za maseczką', 9);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (79, 'praca', 'https://invisionmag.com/wp-content/uploads/2020/02/spongebob-manager.jpg', 'manager', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (80, 'święta', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/santa-judging-christmas-meme-1543507756.jpg?crop=1.00xw:0.990xh;0', 'pracuje jeden dzień', 12);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (81, 'praca', 'https://i.pinimg.com/originals/d7/1b/cd/d71bcd63e932623e4d3dd06ef79d8b70.jpg', 'praca w IT', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (82, 'praca', 'https://external-preview.redd.it/g3F4Ew2tcRNKyIp4G4CGUX_0lBemMonfK_dWkEQxVGg.png?auto=webp&s=cb597b83feda3ecbaa7ce815963603b1781bb2b7', 'programowanie', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (83, 'internet', 'https://www.techadvisor.co.uk/cmsdata/slideshow/3634008/funny_tech_memes_16_thumb800.jpg', 'internet explorer', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (84, 'technologia', 'https://www.imagesmonkey.com/images/memesmonkey/04/042e5c86f7b80bdf9f49dd5f6ee4e91f.jpeg', 'skanowanie komputera', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (85, 'internet', 'https://www.askideas.com/media/48/Firefox-Has-Encountered-An-Unexpected-Problem-With-Windows-Funny-Technology-Meme-Image.jpg', 'firefox vs windows', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (86, 'zwierzę', 'https://i.chzbgr.com/full/1766063360/h717E6379/info-tech-kitteh-iz-taking-a-nap', ' kotek w IT', 6);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (87, 'praca', 'https://www.nairaland.com/attachments/2420911_awesomemoment_jpege5bb9b045c3eecdd408549d2fce5419c', 'jak to działa', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (88, 'praca', 'https://www.nairaland.com/attachments/2420912_backenddeveloper_jpegd8407c4defdd3d2dcb21b49d46e9b1de', 'back end', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (89, 'technologia', 'https://www.nairaland.com/attachments/2420914_cloudstorage_jpegb7ad7215e8145a83b490ba6984298324', 'chmura', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (90, 'problem', 'https://www.nairaland.com/attachments/2420930_flowchart_jpegb7e118dad70caa52d84ccd296c10557c', 'wielb boga', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (91, 'dziecko', 'https://www.nairaland.com/attachments/2420931_hungrybaby_jpeg0cc2a8c9df951ec98f72cd55423b8bdc', 'if else', 10);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (92, 'technologia', 'https://www.nairaland.com/attachments/2420938_momentofsilence_jpege4588da6d0783ba177276464c87b0c37', 'java (script)', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (93, 'technologia', 'https://www.nairaland.com/attachments/2424269_newerror_jpegef63be768587b22ec3e8355538e3e3c2', 'nowy błąd', 1);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (94, 'praca', 'https://www.nairaland.com/attachments/2424325_programmerspillow_jpegdae4323ea2163ac39b45e364e3b8e0d4', 'programowanie na spanie', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (95, 'praca', 'https://www.nairaland.com/attachments/2424326_programmerproblem_pngd7613162afaa323216085386c91efb61', 'java problemy', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (96, 'praca', 'https://www.nairaland.com/attachments/2424366_inmovies_jpegf140ca32c511063d3b2a2a7075a7faee', 'programiści w filmach', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (97, 'praca', 'https://www.nairaland.com/attachments/2424401_outputofaprogramme_jpeg1c7ea45e6fbec28efd24aa86b966f4ae', 'góra lodowa', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (98, 'praca', 'https://www.askideas.com/media/48/My-Code-Doesnt-Work-I-Have-No-Idea-Why-Funny-Technology-Meme-Image.jpg', 'kod (nie) działa', 8);
INSERT INTO meme_db.image (meme_id, tag, address, name, category_id) VALUES (99, 'technologia', 'https://tr4.cbsistatic.com/hub/i/r/2017/05/30/05270c4b-931c-4371-86f6-9ebde138b734/resize/1200x900/658eab8267620ad0fda5f3808952f6d4/grumpy-cat-memegenerator.jpg', 'utrata danych', 1);


COMMIT;