-- Insert data
drop function insert_hotel(integer,integer);
CREATE OR REPLACE FUNCTION insert_hotel (test_hotel_room_category_count INTEGER, test_hotel_rate_category_count INTEGER)
returns integer as $$
declare
	test_hotel_id integer;
	test_hotel_room_category_id_array integer[];
	test_hotel_room_category_id integer;
	test_hotel_inclusion_id integer;
	test_hotel_rate_category_id_array integer[];
	test_hotel_rate_category_id integer;
	r integer;
BEGIN
	-- Insert hotel into supplier table
	INSERT INTO product.supplier
		(supplier_type_id, created_by, modified_by, status, name, description, currency_id, accounting_currency_id, email, email_preferred_flag, phone, extension, fax, website, av_legacy_id, cc_legacy_id, ti_legacy_id, accounting_id, sales_manager_1, sales_manager_2, sales_manager_3, sales_manager_email_1, sales_manager_email_2, sales_manager_email_3, sales_manager_id_1, sales_manager_id_2, sales_manager_id_3, keywords, email_allotment_req, email_allotment_req_flag, mandatory_transfer_flag, bk_activities_rpt_manifest_1_flag, automated_electronic_mailbag_flag, bk_activities_rpt_new_flag, bk_activities_rpt_modified_flag, bk_activities_rpt_cancellations_flag, bk_activities_rpt_manifest_14_flag, bk_activities_rpt_manifest_7_flag, bk_activities_rpt_manifest_3_flag, bk_activities_rpt_cutoff_manifest_flag, bk_activities_rpt_stopsell_flag, reservation_id, bk_activities_rpt_supplement_add_on_flag)
		VALUES(2, 'TESTDATA', 'TESTDATA', 'A', 'Hotel Supply Test Hotel', NULL, 106, 106, '', false, '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, false, false, false, false, false, false, false, false, false, false, '', false)
		RETURNING supplier_id into test_hotel_id;

	-- Insert hotel
	INSERT INTO product.hotel
		( created_by, modified_by, status, hotel_chain_id, address1, address2, address3, neighborhood, city, county, state, postal_code, country_id, latitude, longitude, keywords, hotel_id, hotel_type_id, check_in, check_out, active_channel_manager_id, "name", hotel_chain_brand_id, adults_only, couples_only, all_inclusive, lgbt_friendly, hbsi_loader_run_ts, hbsi_supp_addon_rpt_run_ts, booking_activities_rpt_run_ts, default_markup, minimum_markup)
	VALUES('TESTDATA', 'TESTDATA', 'D', NULL, '2 Addison Circle', 'hotel address line 2', 'hotel address line 3', 'Addison', 'Dallas', NULL, NULL, '75001', 1, 42.833300, -96.8190227, NULL, test_hotel_id, NULL, NULL, NULL, NULL, 'HBSI Hotel Supply ' || test_hotel_id, NULL, false, false, false, false, '2016-08-01 21:31:48.000', NULL, NULL, NULL, NULL);

	INSERT INTO product.hotel_external_map
		(hotel_id, created_by, modified_by, status, channel_manager_id, external_id)
		VALUES(test_hotel_id, 'default', 'default', 'A', 26, 'THEX00' || test_hotel_id);

	-- Insert inclusions
	INSERT INTO product.hotel_inclusion
		( hotel_id, inclusion_type_cd, "name", description, inclusions_rate_code, restrictions, internal_notes, agent_advisory_notes, travel_advisory_notes, created_ts, created_by, modified_ts, modified_by, status, inclusion_attributes, batch_id, batch_source)
		VALUES(test_hotel_id, 'M', ' BP   Meal Plan Inclusion ', 'BREAKFAST PLAN DAILY', NULL, '{"inclusionRestrictionType":"PER_PERSON","inclusionRestrictionInterval":"PER_STAY","adultsOnly":false,"onlyAvailToGroup":false,"transferIncluded":false,"printedVoucherRequired":false}', 'BATCH_LOADED', NULL, NULL, '2016-11-18 03:18:27.000', 'TI_RATE_MIGRATION', '2016-11-18 03:18:27.000', 'default', 'A', '{"inclusionAttributes":{"hotel_meal_plan_id":"3208"}}', 533985, 'TI')
		RETURNING hotel_inclusion_id into test_hotel_inclusion_id;
	
	
	FOR r IN 1..test_hotel_room_category_count LOOP
		-- Insert room category
		INSERT INTO product.hotel_room_category
			(hotel_id,  created_by, modified_by, status, "name", description, pax_max, adult_min, adult_max, adult_max_with_child, junior_min, junior_max, junior_min_age, junior_max_age, child_min, child_max, child_min_age, child_max_age, child_rate_apply_after_adult_number, infant_min, infant_max, infant_min_age, infant_max_age, infant_count_as_pax_flag, minor_min, minor_max, minor_min_age, minor_max_age, ti_legacy_id, av_legacy_id, batch_id, batch_source, fixed_inventory_flag, flexible_inventory_flag, charter_inventory_flag, total_children_limits_flag, non_adult_min, non_adult_max, pax_min)
			VALUES(test_hotel_id, 'default', 'default', 'A', 'Hotel Supply Test room category ' || test_hotel_id || ' room cat ' || r, 'HBSi hotel test room category', 4, 1, 4, 4, 0, 0, -1, -1, 0, 0, -1, -1, 1, 0, 0, -1, -1, true, 0, 0, -1, -1, NULL, NULL, NULL, NULL, false, true, false, false, -1, -1, 1)
			RETURNING hotel_room_category_id into test_hotel_room_category_id;
		--test_hotel_room_category_id_array[r] := test_hotel_room_category_id;

		INSERT INTO product.hotel_room_category_inclusion
			(hotel_room_category_id, hotel_inclusion_id, created_by, modified_by, status)
			VALUES(test_hotel_room_category_id, test_hotel_inclusion_id, 'TESTDATA', 'TESTDATA', 'A');
		
		-- Insert inventories
		INSERT INTO ari.hotel_room_allotment
			(hotel_id, hotel_room_category_id, travel_date, predecessor_id, successor_id, bucket, allotment, created_ts, created_by, modified_ts, modified_by, status)
			VALUES(test_hotel_id, test_hotel_room_category_id, '2017-01-01', NULL, NULL, 'C', to_json('{"hotel": {"id": ' || test_hotel_id || '}, "state": "OPEN", "status": "ACTIVE", "successor": {}, "travelDate": "2017-01-01", "predecessor": {}, "sellingRule": "NOT_APPLICABLE", "roomCategory": {"id": 62849}, "inventoryRules": {"cutoff": 0, "stopSell": false, "minimumLengthOfStay": 1}, "inventoryBucket": "CHARTER"}'), '2016-09-01 14:53:57.000', 'default', '2016-09-01 14:53:57.000', 'default', 'A');
		
		-- Insert room allotment external mapping
		INSERT INTO product.hotel_room_category_external_map
			(hotel_room_category_id, created_by, modified_by, status, channel_manager_id, external_id, hotel_id, approved_flag, enabled_flag, approved_ts, approved_by, notified_ts)
			VALUES( test_hotel_room_category_id, 'TESTDATA', 'TESTDATA', 'A', 2, 'TESTH' || test_hotel_id || 'C' || test_hotel_room_category_id , test_hotel_id, true, false, '2016-11-13 22:52:23.000', 'testharness', NULL);


	END LOOP;
	
	--for r in 1..array_length(test_hotel_room_category_id_array, 1) LOOP
	--end loop;
	
	FOR r IN 1..test_hotel_rate_category_count LOOP
	-- Insert rates
		INSERT INTO product.hotel_rate_category
			(hotel_id, created_by, modified_by, status, "name", description, booking_start_date, booking_end_date, booking_start_relative_days, booking_end_relative_days, rate_occupancy_type, arrival_days_mask, valid_days_mask, type_of_stay, length_of_stay_min, length_of_stay_max, infant_count_as_pax_flag, external_product_id, booking_window_type, free_nights_mask, free_nights_cumulative, free_nights_cap, rate_plan_restrictions, rates_include_taxes, rates_include_fees, notes, combinability_options, requires_pre_payment, batch_id, batch_source, av_legacy_id, gateways, cancellation_policy, linkage_rules, linked_hotel_rate_category_id, forward_min_stay, markup_percent, min_markup_percent)
			VALUES(test_hotel_id, 'TESTATA', 'TESTDATA', 'A', 'Hotel Supply Test Rate - H'|| test_hotel_id || 'R' || r, 'Hotel Supply Test Rate - H' || test_hotel_id, '2015-04-21', '2017-02-28', 9999, 0, 'R', 127, 127, 'N', 1, 99, true, 'HSTEST', 'F', 127, false, 0, 'N', false, false, NULL, 'C', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
			RETURNING hotel_rate_category_id INTO test_hotel_rate_category_id;

		INSERT INTO product.hotel_rate_category_external_map
			(hotel_rate_category_id, created_ts, created_by, modified_ts, modified_by, status, channel_manager_id, external_id, hotel_id, approved_flag, enabled_flag, approved_ts, approved_by, notified_ts)
			VALUES( test_hotel_rate_category_id, '2016-08-18 01:00:31.000', 'default', '2016-11-07 13:15:11.000', 'default', 'A', 2, 'HSTESTH' || test_hotel_id || 'C' || r, test_hotel_id, true, false, NULL, NULL, NULL);

	END LOOP;
	
return test_hotel_id;
END; $$
LANGUAGE plpgsql;

-- Cleanup data
CREATE OR REPLACE FUNCTION delete_hotel (test_hotel_id INTEGER)
returns integer as $$
declare
	r integer;
begin
	delete from product.hotel_rate_category where hotel_id=test_hotel_id;
	delete from product.hotel_rate_category_external_map where hotel_id=test_hotel_id;
	delete from product.hotel_room_category_external_map where hotel_id=test_hotel_id;
	delete from ari.hotel_room_allotment where hotel_id=test_hotel_id;
	delete from product.hotel_room_category_inclusion where hotel_room_category_id in (select hotel_room_category_id from product.hotel_room_category where hotel_id=test_hotel_id);
	delete from product.hotel_room_category where hotel_id=test_hotel_id;
	delete from product.hotel_inclusion where hotel_id=test_hotel_id;
	delete from product.hotel_external_map where hotel_id=test_hotel_id;
	delete from product.hotel where hotel_id=test_hotel_id;
	delete from product.supplier where supplier_id=test_hotel_id;
	
	return 1;
end; $$
LANGUAGE plpgsql;


create cast (text as jsonb) without function as implicit;

select delete_hotel(2723);
select insert_hotel(3, 3);
