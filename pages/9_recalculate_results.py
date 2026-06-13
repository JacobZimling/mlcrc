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
    ,label_visibility = 'collapsed'
)

if race_year:
    # Update race result data
    with st.spinner('Updating race result data...', show_time=True):
        race.update_race_result_data(conn, race_year)
    st.success('Race result data updated')
