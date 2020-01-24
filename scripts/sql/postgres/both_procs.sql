-- Procedure to insert a new user
DROP FUNCTION IF EXISTS agencyuser.add_RA(var_email VARCHAR,fname VARCHAR, mname VARCHAR, lname VARCHAR);
commit;

CREATE OR REPLACE FUNCTION agencyuser.add_RA(var_email VARCHAR,fname VARCHAR, mname VARCHAR, lname VARCHAR)
   RETURNS void AS $$
 DECLARE
   existing_user_id INTEGER;
   new_user_id INTEGER;
   new_auth_id INTEGER;
BEGIN
   IF (NOT EXISTS(SELECT 1 from agencyuser.agency_user where (agency_id=0 AND user_name=var_email and user_type='RA'))) THEN

       SELECT agency_user_id into STRICT new_user_id FROM agencyuser.agency_user ORDER BY agency_user_id DESC LIMIT 1;
       SELECT authentication_id into STRICT new_auth_id FROM agencyuser.authentication ORDER BY authentication_id DESC LIMIT 1;
       new_user_id = new_user_id + 1;
       new_auth_id = new_auth_id + 1;
       INSERT INTO agencyuser.agency_user(agency_user_id,agency_id,user_name,email,agency_user_role_id,first_name,middle_name,
                                    last_name,terms_and_cond_accepted_flag,terms_and_cond_accepted_ts,email_verified_flag,
                                    email_verified_ts,soft_lockout_count,emergency_lockout_flag,status,created_ts,
                                    modified_ts,brand_id,initialized,user_type)
        VALUES (new_user_id,0,var_email,var_email,3,fname,mname,lname,'t',now(),'t',now(),'0','f','A',now(),now(),'0','t','RA');

        INSERT INTO agencyuser.authentication(authentication_id, agency_user_id, password, password_salt, last_login_ts,last_failed_login_ts, status, created_ts, modified_ts)
        VALUES (new_auth_id, new_user_id, 'password', '', now(),null, 'A', now(), now());

  END IF;

END;
$$ LANGUAGE plpgsql;
commit;

DROP FUNCTION IF EXISTS agencyuser.add_TA(var_email VARCHAR,fname VARCHAR, mname VARCHAR, lname VARCHAR, in_agency_id INTEGER);
commit;

CREATE OR REPLACE FUNCTION agencyuser.add_TA(var_email VARCHAR,fname VARCHAR, mname VARCHAR, lname VARCHAR, in_agency_id INTEGER)
   RETURNS void AS $$
 DECLARE
   existing_user_id INTEGER;
   new_user_id INTEGER;
   new_auth_id INTEGER;
   brand INTEGER;
BEGIN


   IF (in_agency_id = 6) THEN
     brand := 2;
   ELSEIF (in_agency_id = 4) THEN
     brand := 1;
   ELSE
      RAISE NOTICE 'Invalid agency id: %', in_agency_id;
      RETURN;
   END IF;

   RAISE NOTICE 'Agency id: %', in_agency_id;
   RAISE NOTICE 'Brand id: %', brand;

   IF (NOT EXISTS(SELECT 1 from agencyuser.agency_user where (agency_id=in_agency_id AND user_name=var_email and user_type='TA'))) THEN

     SELECT agency_user_id into STRICT new_user_id FROM agencyuser.agency_user ORDER BY agency_user_id DESC LIMIT 1;
     SELECT authentication_id into STRICT new_auth_id FROM agencyuser.authentication ORDER BY authentication_id DESC LIMIT 1;
      new_user_id = new_user_id + 1;
      new_auth_id = new_auth_id + 1;
     INSERT INTO agencyuser.agency_user(agency_user_id,agency_id,user_name,email,agency_user_role_id,first_name,middle_name,
                                    last_name,terms_and_cond_accepted_flag,terms_and_cond_accepted_ts,email_verified_flag,
                                    email_verified_ts,soft_lockout_count,emergency_lockout_flag,status,created_ts,
                                    modified_ts,brand_id,initialized,user_type)
     VALUES (new_user_id,in_agency_id,var_email,var_email,3,fname,mname,lname,'t',now(),'t',now(),'0','f','A',now(),now(),brand,'t','TA');

     INSERT INTO agencyuser.authentication(authentication_id, agency_user_id, password, password_salt, last_login_ts,last_failed_login_ts, status, created_ts, modified_ts)
     VALUES (new_auth_id, new_user_id, 'password', '', now(),null, 'A', now(), now());

END IF;

END;
$$ LANGUAGE plpgsql;
commit;
