#streamlit run input_elements.py (for run in interminal)


import streamlit as st
st.title("Enter your information", anchor="False")
st.divider()

name=st.text_input("Enter your name")
# print(type(name))
# st.write("Your name is",name)

st.divider()

age=st.number_input("Enter your age",value=None,placeholder="Type ypur age")
# print(type(age))

# st.write("Your age is",age)

pressed=st.button("Confirm",type="primary") # type start with small letter


selected=st.selectbox("Choose your profession",("Student","Employee","Businessman"),index=None,accept_new_options=True)

print(type(selected))
st.write("You have chose", selected)

if pressed:
    st.write(f"Your name is {name} and age is {age}")






# password = st.text_input("Enter your password",type="password")

# print(type(password))

# st.write("Your password ",password)

