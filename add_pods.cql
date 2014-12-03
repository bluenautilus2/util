
use pa;


INSERT INTO pods (pod_number, architecture1_sub_domain, architecture2_sub_domain, web_services_sub_domain,  architecture1_port, architecture2_port, webservices_port, created_by, created_date, last_updated_by, last_updated_date) VALUES (1, '', '', '', 8443, 9443, 8443, '3', DATEOF(NOW()), '3', DATEOF(NOW()));


Then type:


SELECT * FROM pods;


