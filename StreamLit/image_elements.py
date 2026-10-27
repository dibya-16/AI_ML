import streamlit as st

st.title("Input your files(image)", anchor="False")
st.divider()

#storage
#st.image("images/Thesis Track.png") # eikhane amr storage er loction wise diteh hobe

#url
st.image("https://cdn.pixabay.com/photo/2015/04/19/08/32/flower-729510_1280.jpg")




st.divider()

images= st.file_uploader("Enter your images (at max 2)",
                         type=['jpg','jpeg','png'],
                         accept_multiple_files=True)

print(type(images))
if images:
    #st.image(images)

    # to show in column
    if(len(images)>2):
        st.warning("You uploaded more than 2 images")

    col= st.columnn(len(images))

    for i, per_image in enumerate(images):
        with col[i]:
            st.image(per_image)
        
        
        



