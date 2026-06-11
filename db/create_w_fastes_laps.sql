DROP VIEW IF EXISTS w_fastes_laps;
create view w_fastes_laps as
SELECT 
wri.year_type_date,
rl.driver_id,
rl.lap_time_dt,
ri.race_name,
rl.lap
FROM `race_laps` rl 
join w_result_identifier wri 
on rl.race_id=wri.race_id
join race_info ri
on rl.race_id=ri.race_id
where rl.lap>0
  /*
and wri.year_type_date='2026¤4wd¤2026-05-31'
*/
order by wri.year_type_date, lap_time_dt;
