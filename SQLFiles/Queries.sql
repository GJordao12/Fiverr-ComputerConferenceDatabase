--Queries File

--1 - See all conferences
SELECT
    *
FROM
    conference;
    
--2 - See all conferences participants and their respective conference
SELECT
    conference.id     AS conference_id,
    conference.conferencedate,
    participant.id    AS participant_id,
    participant.firstname,
    participant.lastname,
    participant.email,
    participant.registrationdate
FROM
         participant
    INNER JOIN conference ON conference.id = participant.conferenceid
ORDER BY
    conference.id,
    participant.id;
    
--3 - See all conferences participants of conference with id 1
SELECT
    id,
    firstname,
    lastname,
    email,
    registrationdate
FROM
    participant
WHERE
    conferenceid = 1
ORDER BY
    id;

--4 - See all payments 
SELECT
    payment.id        AS payment_id,
    paymenttype.designation,
    payment.amount,
    payment.paymentdate,
    participant.id    AS participant_id,
    participant.firstname,
    participant.lastname,
    participant.email,
    participant.registrationdate
FROM
         participant
    INNER JOIN payment ON payment.id = participant.id
    INNER JOIN paymenttype ON paymenttype.id = payment.paymenttypeid
ORDER BY
    participant.id;
    
--5 - See all payments of conference with id 2
SELECT
    payment.id        AS payment_id,
    paymenttype.designation,
    payment.amount,
    payment.paymentdate,
    participant.id    AS participant_id,
    participant.firstname,
    participant.lastname,
    participant.email,
    participant.registrationdate
FROM
         participant
    INNER JOIN payment ON payment.id = participant.id
    INNER JOIN paymenttype ON paymenttype.id = payment.paymenttypeid
WHERE
    participant.conferenceid = 2
ORDER BY
    participant.id;

--6 - See all payments made by article authors
SELECT
    payment.id        AS payment_id,
    paymenttype.designation,
    payment.amount,
    payment.paymentdate,
    participant.id    AS participant_id,
    participant.firstname,
    participant.lastname,
    participant.email,
    participant.registrationdate
FROM
         articleauthor
    INNER JOIN participant ON participant.id = articleauthor.id
    INNER JOIN payment ON payment.id = participant.id
    INNER JOIN paymenttype ON paymenttype.id = payment.paymenttypeid
ORDER BY
    participant.id;
    
--7 - See All Articles
SELECT
    *
FROM
    article;
    
--8 - See All Articles Reviews
SELECT
    article.id                 AS article_id,
    article.title,
    article.datesubmission,
    membercommitte.code        AS member_code,
    typeopinion.designation    opinion_designation,
    articlereview.opinionjustification
FROM
         articlereview
    INNER JOIN article ON article.id = articlereview.id
    INNER JOIN membercommitte ON membercommitte.code = articlereview.code
    INNER JOIN typeopinion ON typeopinion.id = articlereview.typeopinionid
ORDER BY
    articlereview.id;
    
--9 - See Articles Reviews of article with id 2
SELECT
    article.id                 AS article_id,
    article.title,
    article.datesubmission,
    membercommitte.code        AS member_code,
    typeopinion.designation    opinion_designation,
    articlereview.opinionjustification
FROM
         articlereview
    INNER JOIN article ON article.id = articlereview.id
    INNER JOIN membercommitte ON membercommitte.code = articlereview.code
    INNER JOIN typeopinion ON typeopinion.id = articlereview.typeopinionid
WHERE
    articlereview.id = 2;
    
--10 - See the amount of favorable and unfavorable opinions of each article
SELECT
    article.id    AS article_id,
    article.title,
    article.datesubmission,
    (
        SELECT
            COUNT(articlereview.id)
        FROM
            articlereview
        WHERE
                articlereview.id = article.id
            AND articlereview.typeopinionid = 1
    )             AS amount_favorable_opinions,
    (
        SELECT
            COUNT(articlereview.id)
        FROM
            articlereview
        WHERE
                articlereview.id = article.id
            AND articlereview.typeopinionid = 2
    )             AS amount_unfavorable_opinions,
    (
        SELECT
            COUNT(articlereview.id)
        FROM
            articlereview
        WHERE
            articlereview.id = article.id
    )             AS total_reviews
FROM
    article;