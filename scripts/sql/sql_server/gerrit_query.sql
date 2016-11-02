
select q.*
from business_units bu
inner join (
select
c.Company_Name as Name,
c.Company_Id as Company_Identifier,
c.Status as Wheee
from companies c
) as q
on q.Company_Identifier = bu.Company_Id
where q.Wheee = 1


http://gitpa.infor.com:8080/#/c/1091/




select distinct changes.change_id, changes.dest_branch_name, changes.subject, changes.last_updated_on, accounts.full_name, CONCAT('http://gitpa.infor.com:8080/#/c/',changes.change_id,'/') as url
 from changes
inner join accounts on changes.owner_account_id=accounts.account_id

  left join patch_set_approvals on ( patch_set_approvals.change_id = changes.change_id)  where (changes.owner_account_id=patch_set_approvals.account_id and patch_set_approvals.category_id='Code-Review');

 select distinct changes.change_id, changes.dest_branch_name, changes.subject, changes.last_updated_on, accounts.full_name, CONCAT('http://gitpa.infor.com:8080/#/c/',changes.change_id,'/') as url  from changes inner join accounts on changes.owner_account_id=accounts.account_id    left join patch_set_approvals on ( patch_set_approvals.change_id = changes.change_id)  where (changes.owner_account_id=patch_set_approvals.account_id and patch_set_approvals.category_id='Code-Review' and changes.last_updated_on between '2014-06-25 00:00:00' and '2014-10-10 00:00:00');





