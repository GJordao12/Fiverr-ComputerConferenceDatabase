--Triggers File

--1 - Verify if payment date precedes the registration date
CREATE OR REPLACE TRIGGER trg_check_payment_date BEFORE
    INSERT ON payment
    FOR EACH ROW
DECLARE
    vregistrationdate DATE;
BEGIN
    SELECT
        registrationdate
    INTO vregistrationdate
    FROM
        participant
    WHERE
        id = :new.id;

    IF ( :new.paymentdate >= vregistrationdate ) THEN
        raise_application_error(-20001, 'ERROR: Payment Date must precedes the Participant Registration Date!');
    END IF;

END;
/

--2 - Verify if registration date precedes the conference date
CREATE OR REPLACE TRIGGER trg_check_registration_date BEFORE
    INSERT ON participant
    FOR EACH ROW
DECLARE
    vconferencedate DATE;
BEGIN
    SELECT
        conferencedate
    INTO vconferencedate
    FROM
        conference
    WHERE
        id = :new.conferenceid;

    IF ( :new.registrationdate >= vconferencedate ) THEN
        raise_application_error(-20001, 'ERROR: Registration Date must precedes the Conference Date!');
    END IF;

END;
/

--3 - Verify if date of the author's article precedes the conference date
CREATE OR REPLACE TRIGGER trg_check_article_date BEFORE
    INSERT ON articleauthor
    FOR EACH ROW
DECLARE
    vconfenreceid    INT;
    vconferencedate  DATE;
    varticledate     DATE;
BEGIN
    SELECT
        conferenceid
    INTO vconfenreceid
    FROM
        participant
    WHERE
        participant.id = :new.id;

    SELECT
        conferencedate
    INTO vconferencedate
    FROM
        conference
    WHERE
        id = vconfenreceid;

    SELECT
        datesubmission
    INTO varticledate
    FROM
        article
    WHERE
        id = :new.articleid;

    IF ( varticledate >= vconferencedate ) THEN
        raise_application_error(-20001, 'ERROR: Date of the Authors Article must precedes the Conference Date!');
    END IF;

END;
/

--4 - Verify if payment amount is greater than or equal to conference price
CREATE OR REPLACE TRIGGER trg_check_payment_amount BEFORE
    INSERT ON payment
    FOR EACH ROW
DECLARE
    vconfenreceid     INT;
    vconferenceprice  NUMBER;
BEGIN
    SELECT
        conferenceid
    INTO vconfenreceid
    FROM
        participant
    WHERE
        participant.id = :new.id;

    SELECT
        price
    INTO vconferenceprice
    FROM
        conference
    WHERE
        id = vconfenreceid;

    IF ( :new.amount < vconferenceprice ) THEN
        raise_application_error(-20001, 'ERROR: Payment Amount is less than the Conference Price!');
    END IF;

END;
/

--5 - Verify if the conference price is greater than 0
CREATE OR REPLACE TRIGGER trg_check_conference_price BEFORE
    INSERT ON conference
    FOR EACH ROW
BEGIN
    IF ( :new.price <= 0 ) THEN
        raise_application_error(-20001, 'ERROR: Conference Price must be greater than 0!');
    END IF;

END;
/