--Create Tables File

--Delete All Tables
BEGIN
    FOR r IN (
        SELECT
            'drop table '
            || table_name
            || ' cascade constraints' cmd
        FROM
            user_tables
        ORDER BY
            table_name
    ) LOOP
        EXECUTE IMMEDIATE ( r.cmd );
    END LOOP;
END;
/

--Create Table Conferene
CREATE TABLE conference (
    id              INT
        CONSTRAINT pk_conference PRIMARY KEY,
    conferencedate  DATE
        CONSTRAINT nn_conference_conference_date NOT NULL,
    price           NUMBER
        CONSTRAINT ck_conference_price CHECK ( price > 0 )
);

--Create Table Participant
CREATE TABLE participant (
    id                INT
        CONSTRAINT pk_participant PRIMARY KEY,
    conferenceid      INT
        CONSTRAINT fk_participant_conference
            REFERENCES conference ( id ),
    firstname         VARCHAR(50)
        CONSTRAINT nn_participant_first_name NOT NULL,
    lastname          VARCHAR(50)
        CONSTRAINT nn_participant_last_name NOT NULL,
    email             VARCHAR(50)
        CONSTRAINT ck_participant_email CHECK ( email LIKE '%@%.com'
                                                OR email LIKE '%@%.pt' )
        CONSTRAINT un_participant_email UNIQUE,
    registrationdate  DATE
        CONSTRAINT nn_participant_registration_date NOT NULL
);

--Create Table ConferenceParticipant
CREATE TABLE conferenceparticipant (
    id INT
        CONSTRAINT pk_conference_participant PRIMARY KEY
        CONSTRAINT fk_participant_conference_participant
            REFERENCES participant ( id )
);

--Create Table Payment Type
CREATE TABLE paymenttype (
    id           INT
        CONSTRAINT pk_payment_type PRIMARY KEY,
    designation  VARCHAR(30)
        CONSTRAINT nn_payment_type_designation NOT NULL
);

--Create Table Payment
CREATE TABLE payment (
    id             INT
        CONSTRAINT pk_payment PRIMARY KEY
        CONSTRAINT fk_participant_payment
            REFERENCES participant ( id ),
    paymenttypeid  INT
        CONSTRAINT fk_payment_payment_type
            REFERENCES paymenttype ( id ),
    amount         NUMBER
        CONSTRAINT ck_payment_amount CHECK ( amount > 0 ),
    paymentdate    DATE
        CONSTRAINT nn_payment_payment_date NOT NULL
);

--Create Article
CREATE TABLE article (
    id              INT
        CONSTRAINT pk_article PRIMARY KEY,
    title           VARCHAR(50)
        CONSTRAINT nn_article_title NOT NULL,
    datesubmission  DATE
        CONSTRAINT nn_article_date_submission NOT NULL
);

--Create Table Article Author
CREATE TABLE articleauthor (
    id         INT
        CONSTRAINT pk_article_author PRIMARY KEY
        CONSTRAINT fk_participant_article_author
            REFERENCES participant ( id ),
    articleid  INT
        CONSTRAINT fk_article_author_article
            REFERENCES article ( id )
);

--Create Table Type Opinion
CREATE TABLE typeopinion (
    id           INT
        CONSTRAINT pk_type_opinion PRIMARY KEY,
    designation  VARCHAR(20)
        CONSTRAINT ck_type_opinion_designation CHECK ( upper(designation) LIKE 'FAVORABLE'
                                                       OR upper(designation) LIKE 'UNFAVORABLE' )
        CONSTRAINT un_type_opinion_designation UNIQUE
);

--Create Table User
CREATE TABLE useer (
    code      INT
        CONSTRAINT pk_useer PRIMARY KEY,
    password  VARCHAR(20)
        CONSTRAINT nn_useer_password NOT NULL
);

--Create Table Administrator
CREATE TABLE administrator (
    code INT
        CONSTRAINT pk_administrator PRIMARY KEY
        CONSTRAINT fk_administrator_useer
            REFERENCES useer ( code )
);

--Create Table Member Role
CREATE TABLE memberrole (
    id           INT
        CONSTRAINT pk_member_role PRIMARY KEY,
    designation  VARCHAR(20)
        CONSTRAINT nn_member_role_designation NOT NULL
        CONSTRAINT un_member_role_designation UNIQUE
);

--Create Table Member Committe
CREATE TABLE membercommitte (
    code  INT
        CONSTRAINT pk_member_committe PRIMARY KEY
        CONSTRAINT fk_member_committe_useer
            REFERENCES useer ( code ),
    id    INT
        CONSTRAINT fk_member_committe_member_role
            REFERENCES memberrole ( id )
);

--Create Table Article Review
CREATE TABLE articlereview (
    id                    INT
        CONSTRAINT fk_article_review_article
            REFERENCES article ( id ),
    code                  INT
        CONSTRAINT fk_article_review_member_committe
            REFERENCES membercommitte ( code ),
    typeopinionid         INT
        CONSTRAINT fk_article_review_type_opinion
            REFERENCES typeopinion ( id ),
    opinionjustification  VARCHAR(255)
        CONSTRAINT nn_article_review_opinion_justification NOT NULL,
    CONSTRAINT pk_article_review PRIMARY KEY ( id,
                                               code )
);

--sequences
--select * from user_sequences;
DECLARE
    v_cmd VARCHAR(2000);
BEGIN
    FOR r IN (
        SELECT
            sequence_name
        FROM
            user_sequences
    ) LOOP
        v_cmd := 'drop sequence ' || r.sequence_name;
        EXECUTE IMMEDIATE ( v_cmd );
    END LOOP;
  --
                                                          FOR r IN (
        SELECT
            table_name
        FROM
            user_tables
    ) LOOP
        v_cmd := 'create sequence seq_' || r.table_name;
        EXECUTE IMMEDIATE ( v_cmd );
    END LOOP;

END;
/

COMMIT;