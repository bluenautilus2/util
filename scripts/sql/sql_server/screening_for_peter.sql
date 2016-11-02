select pos.title, ccppt.* from company_candidate_position_position_types ccppt with(NOLOCK)
join position_position_types ppt with(NOLOCK) on (ccppt.Position_Position_Type_Id=ppt.Position_Position_Type_Id)
  join positions pos with(NOLOCK) on (ppt.position_id=pos.Position_Id)
where ccppt.company_candidate_id = 38046405


select  csv.Candidate_Screening_Version_Id, csv.Status, csv.num_points, csv.passed, screening_date, csv.last_updated_date, csv.has_resume, csv.has_cover_letter, csv.is_file_upload_pending,  sv.Screening_Version_Id, scr.Screening_Id, scr.screening_name, scr.is_universal_screening from candidate_screening_versions csv with(NOLOCK)
  join screening_versions sv  with(NOLOCK) on (sv.Screening_Version_Id=csv.Screening_Version_Id)
  join screenings scr  with(NOLOCK) on (scr.Screening_Id = sv.Screening_Id)
where csv.candidate_id = 29241834

