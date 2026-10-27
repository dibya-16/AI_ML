from google import genai
from dotenv import load_dotenv
import os

from gtts import gTTS

import io #to take space audio in ram not local storage



#loading the environment variable
load_dotenv()

my_api_key= os.getenv("gemini_api_key")

#initializing a client

client=genai.Client(api_key=my_api_key)


#note generator
def note_generator(images):
    prompt="""Summarize the pictures in note format at max 100 words,
      make sure to add necessary markdown to differentiate differnt section"""
    response = client.models.generate_content(
    model="gemini-3-flash-preview",
    contents=[images,prompt],
    )
    return response.text


# audio transcription generator
def audio_transcription(text):
    speech=gTTS(text,lang="en",slow=False)
    audio_buffer=io.BytesIO() # ram er moddhe automatically ekta jayga niye nibe.no need to store in local storage
    speech.write_to_fp(audio_buffer)
    return audio_buffer



# quiz generator
def quiz_generator(images,difficulty):
    prompt=f"Generate 3 quizes based on the {difficulty}. Make sure to add markdown to differentiate the option.Add correct asnwer too, after the quiz"
    response = client.models.generate_content(
    model="gemini-3-flash-preview",
    contents=[images,prompt],
    )
    return response.text

