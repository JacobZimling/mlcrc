import streamlit as st
from modules import raceinfo as race

# Initialize DB connection.
conn = race.db_connect()

# Read race information for select boxes from DB
races = race.get_race_info(conn)

# Select year
race_year = st.segmented_control(
    'År',
    races['race_year'].unique()[::-1]
    , label_visibility='collapsed'
    , default=races['race_year'].max()
)

if race_year:

    # Select race type (2wd/4wd)
    race_type = st.segmented_control(
        'Løbstype',
        races[races['race_year'] == race_year]['race_type'].unique()
        , label_visibility='collapsed'
        , default='4wd'
    )

    if race_type:
        venue_label = {}
        for index, venue_row in races[races['race_year'] == race_year].iterrows():
            venue_label[venue_row['race_date']] = venue_row['venue_label']

        race_date = st.segmented_control(
            'Løbsdag',
            races[races['race_year'] == race_year]['race_date'].unique(),
            format_func=lambda x: venue_label.get(x)
            , label_visibility='collapsed'
        )

        race_name = None
        if race_date:
            #st.write(f'Show lap times for {race_year}¤{race_type}¤{race_date}')
            fastes_laps = race.get_fastes_laps(conn, f'{race_year}¤{race_type}¤{race_date}')
            st.dataframe(
                fastes_laps,
                hide_index=True,
                height="content",
                width="content",
                column_order=('rank', 'driver_name', 'lap_time_dt', 'race_name', 'lap'),
                on_select='ignore',
                selection_mode="single-cell",
                column_config={
                    "rank": st.column_config.NumberColumn("Placering"),
                    "driver_name": st.column_config.TextColumn("Kører"),
                    "lap_time_dt": st.column_config.TimeColumn("Omgangstid", format='m:ss.SSS'),
                    "race_name": st.column_config.TextColumn("Løb"),
                    "lap": st.column_config.TextColumn("Omgang nr"),
                }
            )
