import streamlit as st
import datetime

st.title('Webserver test')
now = datetime.datetime.now().strftime('%H 時 %M 分 %S 秒')
st.text(f'現在の時刻：{now}')