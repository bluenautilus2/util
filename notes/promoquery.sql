select DISTINCT promotion.name, promotion.status, promotion.travel_start_date, promotion.travel_end_date,
  promotion.booking_start_date, promotion.booking_end_date, promotion.blackout_date_ranges, promotion.adjustment_rate_amount,
  promotion.adjustment_rate_unit, promotion.adjustment_rate_occupancy_type, promotion.adjustment_rate_interval_type,
  promotion.applicable_nights_type, promotion.applicable_nights_value,
  promotion.package_restriction, promotion.min_los, promotion.max_los, promotion.hotel_id,
  (select array_to_string(array_agg(b.name), ',') from standard.brand b
  join product.hotel_promotion_brand ab on ab.brand_id = b.brand_id
                                        and ab.hotel_promotion_id = promotion.hotel_promotion_id) brands
FROM product.hotel_promotion promotion
  JOIN product.hotel_promotion_rate_category promoratecat on promoratecat.hotel_promotion_id = promotion.hotel_promotion_id
  JOIN product.hotel_rate_category hotelratecat on hotelratecat.hotel_rate_category_id = promoratecat.hotel_rate_category_id
WHERE hotelratecat.hotel_rate_category_id = #{hotelRateId}