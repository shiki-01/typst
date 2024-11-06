import streamlit as st
import datetime
import time

time_placeholder = st.empty()

while True:
    now = datetime.datetime.now().strftime('%H 時 %M 分 %S 秒')
    time_placeholder.text(f'現在の時刻：{now}')
    time.sleep(1)