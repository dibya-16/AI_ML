# pip install google-genai
# go to Googple AI Studio for create API key

#pip install python-dotenv
from google import genai
import os 
from dotenv import load_dotenv
import streamlit as st 

load_dotenv()
api_key = os.environ.get("gemini_api_key")
client = genai.Client(api_key=api_key)

# Gemini 3 flash preview(ei model tah niyechi)- get it from Google AI Studio
# ei model theke amra demo code niteh pari just oitar developer docs ah click korlei. then nijeder moto edit korbo.nicher code tah niye jemon edit kora hoyeche pore

response = client.models.generate_content(
    model="gemini-3-flash-preview", # eta amra oikhan theke copy korbo. doc er pashei copy option ache (for model name copy)
    contents="Give me an idea of Gemini API within 50 words",
)

#print(response.text)

st.markdown(response.text)


