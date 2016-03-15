select  csv.candidate_id,
  csv.candidate_screening_version_id,
  csv.has_resume,
  svi.information_type_id,
  svi.question_type,
  csvif.screening_version_item_id,
  scr.screening_name
from candidate_screening_versions csv
 join screenings scr on (csv.screening_id = scr.screening_id -- AND scr.company_id=465)
    )
 join screening_version_items svi on (svi.screening_version_id=csv.screening_version_id AND svi.information_type_id=2)
left join candidate_screening_version_items_file csvif on (csvif.screening_version_item_id = svi.screening_version_item_id)
where (csv.has_resume='Y' AND csvif.screening_version_item_id IS NULL)

