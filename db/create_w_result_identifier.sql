DROP VIEW IF EXISTS w_result_identifier;
create view w_result_identifier as
SELECT  race_id,
		CONCAT(
            year(race_date), '¤',
            case race_name
                when '2wd' then race_name
                else '4wd'
            end, '¤',
            race_date, '¤',
            race_name
        ) AS year_type_date_race,
		CONCAT(
            year(race_date), '¤',
            case race_name
                when '2wd' then race_name
                else '4wd'
            end, '¤',
            race_date
        ) AS year_type_date,
		CONCAT(
            year(race_date), '¤',
            case race_name
                when '2wd' then race_name
                else '4wd'
            end
        ) AS year_type
	from race_info;