DROP VIEW IF EXISTS w_fastes_laps;
create view w_fastes_laps as
    SELECT
        wri.year_type_date,
        rl.driver_id,
        dn.driver_name,
        rl.lap_time_dt,
        case ri.race_name
        	when '2wd' then ri.race_name
        	else concat('Løb ', ri.race_name)
        end as race_name,
        rl.lap
    FROM `race_laps` rl
        join w_result_identifier wri
            on rl.race_id=wri.race_id
        join race_info ri
            on rl.race_id=ri.race_id
        join driver_name dn
        	on rl.driver_id=dn.driver_id
    where rl.lap>0
      /*
    and wri.year_type_date='2026¤4wd¤2026-05-31'
    */
    order by wri.year_type_date, lap_time_dt
;
