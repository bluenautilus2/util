

select svi.information_type_id,svi.question_text, sv.version_name,  ser.screening_name, ser.company_id from screening_version_items svi
JOIN screening_versions sv ON svi.screening_version_id=sv.screening_version_id
JOIN screenings ser ON svi.screening_id=ser.screening_id
JOIN screening_languages sl ON (ser.screening_id=sl.screening_id AND sl.current_screening_version_id=sv.screening_version_id)

AND (svi.information_type_id in (710 ,302 ,288 ,293 ,570 ,229 ,337 ,696 ,286 ,139 ,444 ,445 ,27 ,289 ,142 ,28 ,29 ,30 ,33 ,24 ,36 ,204 ,40 ,68 ,287 ,143 ,246 ,247 ,248 ,252 ,253 ,254 ,349 ,478 ,477 ,258 ,259 ,260 ,350 ,264 ,265 ,266 ,272 ,273 ,274 ,280 ,281 ,282 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,404 ,596 ,713 ,562 ,537 ,228 ,144 ,205 ,210 ,213 ,216 ,221 ,222 ,300 ,342 ,449 ,420 ,422 ,547 ,296 ,297 ,471 ,563 ,472 ,473 ,474 ,475 ,476 ,480 ,481 ,571 ,559 ,553 ,555 ,560 ,558 ,588 ,628 ,630 ,644 ,645 ,646 ,647 ,657 ,711 ,697))
AND ((svi.question_type in ('F','T','A','1','2','3','4','5','6')) OR (svi.field_type_id in ('1','2','3','4','6','9','10','11','12')))










