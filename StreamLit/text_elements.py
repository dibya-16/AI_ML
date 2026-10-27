# pip install streamlit

# terminal ah aager shob clean korte chaile sudhu clear likhe enter press korlei clean hoye jabe

import streamlit as st

st.write("Hello, I am Dibya")
st.title(":world_map: My first streamlit web App", anchor="False")

st.header("Main Header",divider=True)
st.subheader("Subheading of main header")


st.markdown(":red[**Hello**] *World*") # double star ah bold hoy. single star ah italic hoy

st.markdown(":red-background[:yellow[**Hello**] *World*] :world_map:") 


a=10
b=30
st.write(a,b)