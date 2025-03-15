-- create a new database
create database hotel;
use hotel;
-- import the uncleaned dataset
select * from hotelbookings;
-- create a backup table before performing any data cleaning(in case of data deletion by mistake)
create table backup like hotelbookings;
insert into backup select * from hotelbookings;
-- delete the columns which are not necessary 
alter table hotelbookings drop column lead_time, drop column arrival_date_week_number; 
alter table hotelbookings 
drop column arrival_date_day_of_month,
drop column meal,
drop column is_repeated_guest,
DROP COLUMN previous_bookings_not_canceled,  
DROP COLUMN reserved_room_type,  
DROP COLUMN assigned_room_type,  
DROP COLUMN booking_changes,  
DROP COLUMN deposit_type,  
DROP COLUMN agent,   
DROP COLUMN days_in_waiting_list,  
DROP COLUMN required_car_parking_spaces,  
DROP COLUMN total_of_special_requests,  
DROP COLUMN reservation_status,  
DROP COLUMN reservation_status_date;
-- rename the country column to iso_code
alter table hotelbookings rename column country to iso_code;
-- check the dataset
select * from hotelbookings;
-- add country names for all the iso code
select distinct(iso_code) from hotelBookings;
alter table hotelbookings add column Country varchar(30) first;
-- insert values into country column and update with corresponding country names
UPDATE hotelbookings
SET country = CASE iso_code
    WHEN 'PRT' THEN 'Portugal'
    WHEN 'GBR' THEN 'United Kingdom'
    WHEN 'USA' THEN 'United States'
    WHEN 'ESP' THEN 'Spain'
    WHEN 'IRL' THEN 'Ireland'
    WHEN 'FRA' THEN 'France'
    WHEN 'ROU' THEN 'Romania'
    WHEN 'NOR' THEN 'Norway'
    WHEN 'OMN' THEN 'Oman'
    WHEN 'ARG' THEN 'Argentina'
    WHEN 'POL' THEN 'Poland'
    WHEN 'DEU' THEN 'Germany'
    WHEN 'BEL' THEN 'Belgium'
    WHEN 'CHE' THEN 'Switzerland'
    WHEN 'CN' THEN 'China'
    WHEN 'GRC' THEN 'Greece'
    WHEN 'ITA' THEN 'Italy'
    WHEN 'NLD' THEN 'Netherlands'
    WHEN 'DNK' THEN 'Denmark'
    WHEN 'RUS' THEN 'Russia'
    WHEN 'SWE' THEN 'Sweden'
    WHEN 'AUS' THEN 'Australia'
    WHEN 'EST' THEN 'Estonia'
    WHEN 'CZE' THEN 'Czech Republic'
    WHEN 'BRA' THEN 'Brazil'
    WHEN 'FIN' THEN 'Finland'
    WHEN 'MOZ' THEN 'Mozambique'
    WHEN 'BWA' THEN 'Botswana'
    WHEN 'LUX' THEN 'Luxembourg'
    WHEN 'SVN' THEN 'Slovenia'
    WHEN 'ALB' THEN 'Albania'
    WHEN 'IND' THEN 'India'
    WHEN 'CHN' THEN 'China'
    WHEN 'MEX' THEN 'Mexico'
    WHEN 'MAR' THEN 'Morocco'
    WHEN 'UKR' THEN 'Ukraine'
    WHEN 'SMR' THEN 'San Marino'
    WHEN 'LVA' THEN 'Latvia'
    WHEN 'PRI' THEN 'Puerto Rico'
    WHEN 'SRB' THEN 'Serbia'
    WHEN 'CHL' THEN 'Chile'
    WHEN 'AUT' THEN 'Austria'
    WHEN 'BLR' THEN 'Belarus'
    WHEN 'LTU' THEN 'Lithuania'
    WHEN 'TUR' THEN 'Türkiye'
    WHEN 'ZAF' THEN 'South Africa'
    WHEN 'AGO' THEN 'Angola'
    WHEN 'ISR' THEN 'Israel'
    WHEN 'CYM' THEN 'Cayman Islands'
    WHEN 'ZMB' THEN 'Zambia'
    WHEN 'CPV' THEN 'Cape Verde'
    WHEN 'ZWE' THEN 'Zimbabwe'
    WHEN 'DZA' THEN 'Algeria'
    WHEN 'KOR' THEN 'South Korea'
    WHEN 'CRI' THEN 'Costa Rica'
    WHEN 'HUN' THEN 'Hungary'
    WHEN 'ARE' THEN 'United Arab Emirates'
    WHEN 'TUN' THEN 'Tunisia'
    WHEN 'JAM' THEN 'Jamaica'
    WHEN 'HRV' THEN 'Croatia'
    WHEN 'HKG' THEN 'Hong Kong'
    WHEN 'IRN' THEN 'Iran'
    WHEN 'GEO' THEN 'Georgia'
    WHEN 'AND' THEN 'Andorra'
    WHEN 'GIB' THEN 'Gibraltar'
    WHEN 'URY' THEN 'Uruguay'
    WHEN 'JEY' THEN 'Jersey'
    WHEN 'CAF' THEN 'Central African Republic'
    WHEN 'CYP' THEN 'Cyprus'
    WHEN 'COL' THEN 'Colombia'
    WHEN 'GGY' THEN 'Guernsey'
    WHEN 'KWT' THEN 'Kuwait'
    WHEN 'NGA' THEN 'Nigeria'
    WHEN 'MDV' THEN 'Maldives'
    WHEN 'VEN' THEN 'Venezuela'
    WHEN 'SVK' THEN 'Slovakia'
    WHEN 'FJI' THEN 'Fiji'
    WHEN 'KAZ' THEN 'Kazakhstan'
    WHEN 'PAK' THEN 'Pakistan'
    WHEN 'IDN' THEN 'Indonesia'
    WHEN 'LBN' THEN 'Lebanon'
    WHEN 'PHL' THEN 'Philippines'
    WHEN 'SEN' THEN 'Senegal'
    WHEN 'SYC' THEN 'Seychelles'
    WHEN 'AZE' THEN 'Azerbaijan'
    WHEN 'BHR' THEN 'Bahrain'
    WHEN 'NZL' THEN 'New Zealand'
    WHEN 'THA' THEN 'Thailand'
    WHEN 'DOM' THEN 'Dominican Republic'
    WHEN 'MKD' THEN 'North Macedonia'
    WHEN 'MYS' THEN 'Malaysia'
    WHEN 'ARM' THEN 'Armenia'
    WHEN 'JPN' THEN 'Japan'
    WHEN 'LKA' THEN 'Sri Lanka'
    WHEN 'CUB' THEN 'Cuba'
    WHEN 'CMR' THEN 'Cameroon'
    WHEN 'BIH' THEN 'Bosnia and Herzegovina'
    WHEN 'MUS' THEN 'Mauritius'
    WHEN 'COM' THEN 'Comoros'
    WHEN 'SUR' THEN 'Suriname'
    WHEN 'UGA' THEN 'Uganda'
    WHEN 'BGR' THEN 'Bulgaria'
    WHEN 'CIV' THEN 'Ivory Coast'
    WHEN 'JOR' THEN 'Jordan'
    WHEN 'SYR' THEN 'Syria'
    WHEN 'SGP' THEN 'Singapore'
    WHEN 'BDI' THEN 'Burundi'
    WHEN 'SAU' THEN 'Saudi Arabia'
    WHEN 'VNM' THEN 'Vietnam'
    WHEN 'PLW' THEN 'Palau'
    WHEN 'QAT' THEN 'Qatar'
    WHEN 'EGY' THEN 'Egypt'
    WHEN 'PER' THEN 'Peru'
    WHEN 'MLT' THEN 'Malta'
    WHEN 'MWI' THEN 'Malawi'
    WHEN 'ECU' THEN 'Ecuador'
    WHEN 'MDG' THEN 'Madagascar'
    WHEN 'ISL' THEN 'Iceland'
    WHEN 'UZB' THEN 'Uzbekistan'
    WHEN 'NPL' THEN 'Nepal'
    ELSE 'Others'
END;
-- check the data and import it to powerbi using code
select * from hotelBookings;
