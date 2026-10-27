# Note Summary and QUiz Generator using streamlit and gemini api.
# upload photos,select difficulty level of quiz and submit.
#get note summary, audio description, quiz questions and answer


# python -m venv project1venv # virtual environment create hoise.name project1venv. you can give any name
# virtual environment create kora hoy. jaate amra oikhane amader proyojonio package gula just oikhane install kore rakhtepari. no extra package
# source project1venv/bin/activate # activate virtual environment
# pip install streamlit 
# pip install google-genai
# pip install python-dotenv
# pip freeze > requirements.txt # eta help kore j j pcakage gula install hoise oita requirements.txt file ah note hishabe rakha hoise
# pip list # eta diye amr ki ki package install hoise oita check kora jaay
# pip install gtts # help to convert from text to audio

# code localhost ah ache. eta kono ekta jaygay deploy korte hobe.kono ekta cloud ah rakhte hobe. so amra github ah rakhte pari. then streamlit ah deploy korte pari from github

import streamlit as st
from api_calling import note_generator,audio_transcription,quiz_generator

from PIL import Image # pillow naame j package ache oita theke mainly import.help to convert image from one formato to pil image forma.it comes with streamlit installation




st.title("Note Summary and Quiz Generator")
st.markdown("Upload upto 3 images to generate Note Summary & Quizzes")
st.divider()

with st.sidebar: # multiple kaaj korle amra with use kori
    st.header("Controls")

    #image
    images=st.file_uploader("Upload photos of your note",type=["jpg","jpeg","png"],
                            accept_multiple_files=True)
    

    pil_images=[]
    for img in images:
        pil_img=Image.open(img)
        pil_images.append(pil_img)
    
    if images:
        if(len(images)>3):
            st.error("Upload at max 3 photos")

        else:

            st.subheader("Uploaded photos")


            col=st.columns(len(images))

            for i,img in enumerate(images):
                with col[i]:
                    st.image(img)    

    #difficulty selection

    selected_option=st.selectbox("Enter the difficulty level of your quiz",
                               ("Easy","Medium","Hard"), #tuple er jaygay list o use kora jaay
                               index=None)
    
    # if selected_option:
    #     st.markdown(f"You selected **{selected_option}** as the difficulty level of your quiz")
    # else:
    #     st.error("Please select a difficulty level")

    pressed=st.button("Click here to initiate AI",type="primary")       

if pressed:
    if not images:
        st.error("You must upload at least 1 photo")
    if not selected_option:
        st.error("You must select the difficulty level of your quiz") 

    if images and selected_option:

        #note

        with st.container(border=True):
            st.subheader("Your Note")

            with st.spinner("AI is writing notes for you"):
                generated_notes=note_generator(pil_images)
                st.markdown(generated_notes)



        #audio transcript

        with st.container(border=True):
            st.subheader("Audio Transcription")

            with st.spinner("AI is generating audio transcription for you"):

                # clearing markdown. uporer text ah markdown er karone #, * etc extra ashe.eta replace nah korle audio teh egulao pronounce korbe. so cleared with replace. with space

                generated_notes=generated_notes.replace("#","")
                generated_notes=generated_notes.replace("*","")
                generated_notes=generated_notes.replace("-","")
                generated_notes=generated_notes.replace("'","")



                audio_transcripted=audio_transcription(generated_notes)
                st.audio(audio_transcripted)



            st.text("")



        #quiz  

        with st.container(border=True):
            st.subheader(f"Difficulty Level of Quiz: *{selected_option}**")

            with st.spinner("AI is generationg quiz for you"):

                quizes=quiz_generator(pil_images,selected_option)
                st.text(quizes) 


                    
    


