import streamlit as st

st.title("Input your files(audio)", anchor="False")
st.divider()


#from storage/directory
# eikhane amr storage er loction wise diteh hobe eikhane audio folder and welcome.mp3 oi folder er ekta file

#st.audio("audio/welcome.mp3",loop=True) # loop true korle audio baar baar run hobe.

st.divider()


audio_file = st.file_uploader("Enter your audio",
                 type=['mp3','ogg','flac'],
                 )



print(type(audio_file))

if audio_file:
    st.audio(audio_file)