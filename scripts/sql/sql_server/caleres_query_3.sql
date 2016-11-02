
Screenings where the CSV says there's no resume but there is totally a resume

select csv.has_resume, csvif.file_name from candidate_screening_versions csv
join screening_version_items svi on (svi.screening_version_id=csv.screening_version_id AND svi.information_type_id=2)
join candidate_screening_version_items_file csvif on (csvif.screening_version_item_id=svi.screening_version_item_id)
where csv.has_resume='N';

same for cover letter

select csv.has_cover_letter, csvif.file_name from candidate_screening_versions csv
join screening_version_items svi on (svi.screening_version_id=csv.screening_version_id AND svi.information_type_id=1)
join candidate_screening_version_items_file csvif on (csvif.screening_version_item_id=svi.screening_version_item_id)
where csv.has_cover_letter='N';

---------------------------------------------------

select csv.has_cover_letter, csv.candidate_screening_version_id from candidate_screening_versions csv
join screening_version_items svi on (svi.screening_version_id=csv.screening_version_id AND svi.information_type_id=1)
left join candidate_screening_version_items_file csvif on (csvif.screening_version_item_id = svi.screening_version_item_id)
where (csv.has_cover_letter='Y' AND csvif.screening_version_item_id IS NULL)

select csv.has_resume, csv.candidate_screening_version_id from candidate_screening_versions csv
join screening_version_items svi on (svi.screening_version_id=csv.screening_version_id AND svi.information_type_id=2)
left join candidate_screening_version_items_file csvif on (csvif.screening_version_item_id = svi.screening_version_item_id)
where (csv.has_resume='Y' AND csvif.screening_version_item_id IS NULL)



