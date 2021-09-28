--Inserts File

--Conference Inserts
INSERT INTO conference VALUES (seq_conference.nextval,TO_Date('2021-04-29 10:00:00','YYYY-MM-DD HH:MI:SS'),10.50);
INSERT INTO conference VALUES (seq_conference.nextval,TO_Date('2021-06-01 10:30:00','YYYY-MM-DD HH:MI:SS'),20);

--Participant Inserts
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','1','p1@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','2','p2@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','3','p3@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','4','p4@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','5','p5@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','6','p6@gmail.com',TO_Date('2021-04-28 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','7','p7@gmail.com',TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','8','p8@gmail.com',TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','9','p9@gmail.com',TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,1,'Participant','10','p10@gmail.com',TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));

INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','11','p11@gmail.com',TO_Date('2021-04-29 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','12','p12@gmail.com',TO_Date('2021-04-29 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','13','p13@gmail.com',TO_Date('2021-04-30 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','14','p14@gmail.com',TO_Date('2021-06-01 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','15','p15@gmail.com',TO_Date('2021-05-21 01:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','16','p16@gmail.com',TO_Date('2021-05-26 09:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','17','p17@gmail.com',TO_Date('2021-05-26 09:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','18','p18@gmail.com',TO_Date('2021-05-26 09:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','19','p19@gmail.com',TO_Date('2021-05-27 08:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO participant VALUES (seq_participant.nextval,2,'Participant','20','p20@gmail.com',TO_Date('2021-05-28 08:00:00','YYYY-MM-DD HH:MI:SS'));

--Conference Participant Inserts
INSERT INTO conferenceparticipant VALUES (1);
INSERT INTO conferenceparticipant VALUES (2);
INSERT INTO conferenceparticipant VALUES (3);
INSERT INTO conferenceparticipant VALUES (4);
INSERT INTO conferenceparticipant VALUES (5);
INSERT INTO conferenceparticipant VALUES (6);
INSERT INTO conferenceparticipant VALUES (7);

INSERT INTO conferenceparticipant VALUES (11);
INSERT INTO conferenceparticipant VALUES (12);
INSERT INTO conferenceparticipant VALUES (13);
INSERT INTO conferenceparticipant VALUES (14);
INSERT INTO conferenceparticipant VALUES (15);
INSERT INTO conferenceparticipant VALUES (16);
INSERT INTO conferenceparticipant VALUES (17);
INSERT INTO conferenceparticipant VALUES (18);
INSERT INTO conferenceparticipant VALUES (19);

--Payment Type Inserts
INSERT INTO paymenttype VALUES (seq_paymenttype.nextval,'Visa');
INSERT INTO paymenttype VALUES (seq_paymenttype.nextval,'Mastecard');
INSERT INTO paymenttype VALUES (seq_paymenttype.nextval,'Cash');
INSERT INTO paymenttype VALUES (seq_paymenttype.nextval,'Paypal');

--Payment Inserts
INSERT INTO payment VALUES (1,1,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (2,1,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (3,2,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (4,2,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (5,3,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (6,3,10.50,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (7,4,10.50,TO_Date('2021-04-26 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (8,4,10.50,TO_Date('2021-04-26 10:00:00','YYYY-MM-DD HH:MI:SS'));

INSERT INTO payment VALUES (11,1,20,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (12,1,20,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (13,2,20,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (14,2,20,TO_Date('2021-04-27 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (15,3,20,TO_Date('2021-05-19 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (16,3,20,TO_Date('2021-05-21 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (17,4,20,TO_Date('2021-05-20 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO payment VALUES (19,4,20,TO_Date('2021-05-19 10:00:00','YYYY-MM-DD HH:MI:SS'));

--Useer Inserts
INSERT INTO useer VALUES (seq_useer.nextval,'admin');
INSERT INTO useer VALUES (seq_useer.nextval,'member1');
INSERT INTO useer VALUES (seq_useer.nextval,'member2');
INSERT INTO useer VALUES (seq_useer.nextval,'member3');
INSERT INTO useer VALUES (seq_useer.nextval,'member4');
INSERT INTO useer VALUES (seq_useer.nextval,'member5');

--Administrator Inserts
INSERT INTO administrator VALUES (1);

--Member Role Inserts
INSERT INTO memberrole VALUES (seq_memberrole.nextval,'Leader');
INSERT INTO memberrole VALUES (seq_memberrole.nextval,'Sub');
INSERT INTO memberrole VALUES (seq_memberrole.nextval,'Helper');

--Member Committe Inserts
INSERT INTO membercommitte VALUES (2,1);
INSERT INTO membercommitte VALUES (3,3);
INSERT INTO membercommitte VALUES (4,2);
INSERT INTO membercommitte VALUES (5,2);
INSERT INTO membercommitte VALUES (6,3);

--Type Opinion Inserts
INSERT INTO typeopinion VALUES (seq_typeopinion.nextval,'Favorable');
INSERT INTO typeopinion VALUES (seq_typeopinion.nextval,'Unfavorable');

--Article Inserts
INSERT INTO article VALUES (seq_article.nextval,'Artifical Intelligence',TO_Date('2021-04-22 10:00:00','YYYY-MM-DD HH:MI:SS'));
INSERT INTO article VALUES (seq_article.nextval,'Robots',TO_Date('2021-05-19 10:00:00','YYYY-MM-DD HH:MI:SS'));

--Article Author Inserts
INSERT INTO articleauthor VALUES (8,1);
INSERT INTO articleauthor VALUES (9,1);
INSERT INTO articleauthor VALUES (10,1);

INSERT INTO articleauthor VALUES (20,2);

--Article Review Inserts
INSERT INTO articlereview VALUES (1,2,1,'A great article!');
INSERT INTO articlereview VALUES (1,3,1,'An excellent article!');
INSERT INTO articlereview VALUES (1,4,1,'Well structured with good topics!');
INSERT INTO articlereview VALUES (1,5,1,'Amazing topic!');
INSERT INTO articlereview VALUES (1,6,1,'I love this article!');

INSERT INTO articlereview VALUES (2,2,1,'A good article!');
INSERT INTO articlereview VALUES (2,3,1,'A great article!');
INSERT INTO articlereview VALUES (2,4,2,'It is not appropriate!');
INSERT INTO articlereview VALUES (2,5,2,'I didnt like it, little captivating!');
INSERT INTO articlereview VALUES (2,6,2,'A bad article!');

commit;
