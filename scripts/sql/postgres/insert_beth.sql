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
   IF (EXISTS(SELECT 1 from agencyuser.agency_user where (agency_id=4 AND user_name=var_email))) THEN
      	SELECT agency_user_id into STRICT existing_user_id from agencyuser.agency_user where (agency_id=4 AND user_name=var_email);   
     	RAISE INFO 'Found user: %', existing_user_id;
        DELETE FROM agencyuser.authentication where agencyuser.authentication.agency_user_id=existing_user_id;
     	RAISE INFO 'Deleting authentication row: %', existing_user_id;
     	DELETE FROM agencyuser.agency_user where agencyuser.agency_user.agency_user_id=existing_user_id;
     	RAISE INFO 'Deleting agency_user row: %', existing_user_id;
   END IF;
  
   IF (EXISTS (SELECT 1 from agencyuser.agency_user)) THEN
   		SELECT agency_user_id into STRICT new_user_id FROM agencyuser.agency_user ORDER BY agency_user_id DESC LIMIT 1;
   ELSE 
      new_user_id := 1;
   END IF;
   
   IF (EXISTS (SELECT 1 from agencyuser.authentication)) THEN
   		SELECT authentication_id into STRICT new_auth_id FROM agencyuser.authentication ORDER BY authentication_id DESC LIMIT 1;
   ELSE 
      new_auth_id := 1;
   END IF;
   
   
   new_user_id = new_user_id + 1;
   new_auth_id = new_auth_id + 1;
   INSERT INTO agencyuser.agency_user(agency_user_id,agency_id,user_name,email,agency_user_role_id,first_name,middle_name,
                                    last_name,terms_and_cond_accepted_flag,terms_and_cond_accepted_ts,email_verified_flag,
                                    email_verified_ts,soft_lockout_count,emergency_lockout_flag,status,created_ts,
                                    modified_ts,brand_id,initialized,user_type)
   VALUES (new_user_id,4,var_email,var_email,3,fname,mname,lname,'t',now(),'t',now(),'0','f','A',now(),now(),'0','t','RA');

   INSERT INTO agencyuser.authentication(authentication_id, agency_user_id, password, password_salt, last_login_ts,last_failed_login_ts, status, created_ts, modified_ts)
   VALUES (new_auth_id, new_user_id, 'password', '', now(),null, 'A', now(), now());
   
END;
$$ LANGUAGE plpgsql;
commit;

SELECT agencyuser.add_RA('estevens@applelg.net', 'Beth','','Stevens');

commit;
