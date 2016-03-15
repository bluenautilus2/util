
declare @candidateid nvarchar(MAX);
declare @companycandidateid nvarchar(MAX);
select top 1 @candidateid=candidate_id, @companycandidateid=company_candidate_id from company_candidates where company_id=992 order by created_date desc ;

print @companycandidateid;
print @candidateid;

select csv.status,csv.is_file_upload_pending, scr.screening_name from candidate_screening_versions csv
join screening_versions sv on (csv.screening_version_id=sv.screening_version_id)
join screenings scr on (scr.screening_id=sv.screening_id)
where csv.candidate_id=@candidateid

select last_updated_date, is_deferred, screenings_result_code, post_screenings_result_code
from company_candidate_position_position_types where company_candidate_id=@companycandidateid




