with
	race as (
		select
			 ri.year_type_date
			,ri.race_id
		from w_result_identifier ri
		where ri.year_type_date = '2026¤4wd¤2026-06-21'
	),
	fastes_lap as (
		select
			 r.year_type_date
			,r.race_id
			,rl.driver_id
			,rl.lap
			,rl.lap_time_dt
			,ROW_NUMBER() over (
				partition by /*r.race_id,*/ rl.driver_id
				order by /*r.race_id,*/ rl.driver_id, rl.lap_time_dt
			) as fastes
		from race r
			left join race_laps rl
				on r.race_id  = rl.race_id
		where rl.lap <> 0
/*		order by 2, 3, 4*/
	)
	select
			 year_type_date
			,driver_id
			,lap
			,lap_time_dt
		from fastes_lap
		where fastes=1
		order by 1, 4
;