
# demo for convert from text to audio
from gtts import gTTS

import streamlit as st

import io #to take space audio in ram not local storage

text="Helo, I am Dibya"

speech=gTTS(text,lang="en",slow=False)
#speech.save("hello.mp3") # save in local storage. but we will not save in locally.so skip this way

audio_buffer=io.BytesIO() # ram er moddhe automatically ekta jayga niye nibe
speech.write_to_fp(audio_buffer)
st.audio(audio_buffer)

