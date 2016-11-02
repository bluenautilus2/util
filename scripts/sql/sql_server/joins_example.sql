

select Company_Id, Company_name  from Companies where Company_Id in ('560','447', '469','369', '423', '428', '431', '460', '498', '507', '508', '518', '524', '529', '541', '561', '571', '829', '843', '844', '845', '872');


select Partner_Companies.Company_Id from Partner_Companies left join Companies on 
(Companies.Company_Id=Partner_Companies.Company_Id) where Companies.Company_Id IS NULL


select partner_position_position_types.position_position_type_id from partner_position_position_types 
left join position_position_types on (
partner_position_position_types.position_position_type_id=position_position_types.position_position_type_id) 
where position_position_types.position_position_type_id is null;
                                                                                                                                  
