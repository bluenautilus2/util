
DROP FUNCTION IF EXISTS agencyuser.repair_data();
commit;
 
CREATE OR REPLACE FUNCTION agencyuser.repair_data()
   RETURNS void AS $$
 DECLARE
    id INTEGER;
   new_auth_id INTEGER;
   email VARCHAR;
   fname VARCHAR;
   mname VARCHAR;
   lname VARCHAR;
BEGIN

   FOR id, email, fname, mname, lname IN 
      SELECT agencyuser.agency_user.agency_user_id, agencyuser.agency_user.email, agencyuser.agency_user.first_name, agencyuser.agency_user.middle_name, agencyuser.agency_user.last_name
      FROM agencyuser.agency_user 
      WHERE (agency_id=4 and user_type='RA')
   LOOP
        RAISE INFO 'Deleting user id: %', email;
        DELETE FROM agencyuser.authentication where agencyuser.authentication.agency_user_id=id;
        RAISE INFO 'Deleting authentication row';
        DELETE FROM agencyuser.agency_user where agencyuser.agency_user.agency_user_id=id;
        RAISE INFO 'Deleting agency_user row';

        PERFORM agencyuser.add_RA(email,fname,mname,lname);
        PERFORM agencyuser.add_TA(email,fname,mname,lname,4);
   END LOOP;
 

 
END;
$$ LANGUAGE plpgsql;
commit;

SELECT agencyuser.repair_data();
 