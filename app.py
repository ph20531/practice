# streamlit | 데이터 분석용 라이브러리

# 001. 아나콘다 프롬프트
# 가상환경 만들고 실행하기
# $conda create -n 가상환경이름 python=3.10 openssl numpy scipy matplotlib ipython scikit-learn pandas pillow jupyter seaborn
# $conda activate 가상환경이름

# 002. 비주얼 스튜디오 터미널
# streamlit run app.py

# 003. 브라우저
# 기본적인 호스트 주소 | http://localhost:8501/

import streamlit as st
import pandas as pd
from PIL import Image

def main():
    name = '장독대'
    st.title('웹 대시보드')
    st.write('내용')
    st.text(f'제 이름은 {name}입니다.')
    st.header('header')
    st.subheader('subheader')
    st.success('성공')
    st.warning('경고')
    st.error('에러')
    st.info('정보')
    print('프린트는 디버깅 용도')
    
    # pandas dataframe 표시하기
    df = pd.read_csv(r'C:\Users\406\Documents\GitHub\study\data\Data.csv')
    print(df)
    if(st.button('확인하기')):
        st.dataframe(df)
        
    # 라디오 버튼
    st.title('Radio Button Example')
    option = st.radio("Choose an option", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", option)
    
    # 체크박스
    st.title('Check Box Example')
    if st.checkbox("Check me"):
        st.write("You checked the box!")
    else:
        st.write("You didn't check the box.")
        
    # 선택상자
    st.title('Select Box Example')
    option = st.selectbox("Choose an option", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", option)
    
    # 다중 선택상자
    st.title('Multi Select Example')
    options = st.multiselect("Choose multiple options", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", options)
    
    # 슬라이더
    st.title('Slider Example')
    value = st.slider("Choose a value", min_value=0, max_value=10, step=1)
    st.write("You selected:", value)
    
    # 활용하기
    st.title('활용하기')
    options = st.multiselect("컬럼을 선택하세요.", df.columns)
    if(len(options) == 0):
        st.text('선택된 컬럼이 없습니다.')
    else:
        st.dataframe(df[options])
        
    value = st.slider("나이를 입력하세요.", min_value=0, max_value=100, step=1)
    st.text(f"당신의 나이는 {value}세 입니다.")
    
    # 로컬 이미지
    st.title('로컬 이미지')
    img = Image.open(r'C:\Users\406\Documents\GitHub\study\data\사과.jpg')
    st.image(img)
    st.image(img, width=500)
    st.image(img, use_column_width=True)
    
    # 서버 이미지
    st.title('서버 이미지')
    url = 'https://img.seoul.co.kr/img/upload/2023/08/27/SSC_20230827144801_O2.jpg'
    st.image(url)
    
    # 로컬 비디오
    # st.title('로컬 비디오')
    # video = open('path', 'rb')
    # st.video(video)
        
    # 서버 비디오
    st.title('서버 비디오')
    url = 'https://www.youtube.com/watch?v=Ql75dfk0Cbk'
    st.video(url)
    
    # 로컬 오디오
    st.title('로컬 오디오')
    url = open(r'C:\Users\406\Documents\GitHub\study\data\no-copyright-for-her-chill-upbeat-summel-travel-vlog-and-ig-music-202298.mp3', 'rb')
    st.audio(url)
    
    # 서버 오디오
    # st.title('서버 오디오')
    # audio = open('path')
    # st.audio(audio)
    
    # 인풋
    ti = st.text_input('텍스트 인풋')
    st.text(ti)
    
    dti = st.date_input('데이트 인풋')
    st.text(dti)
    st.text(dti.weekday())
    st.text(dti.strftime('%A'))
    
    tmi = st.time_input('타임 인풋')
    st.text(tmi)
    st.text(tmi.strftime('%H:%M'))
    
    cmi = st.camera_input('카메라 인풋')
    st.text(cmi)
    
    nmi = st.number_input('넘버 인풋')
    st.text(nmi)
    
    chi = st.chat_input('챗 인풋')
    st.text(f'챗 인풋 | {chi}')
    
    # 멀티 텍스트
    tar = st.text_area('텍스트 에어리어')
    st.text(tar)
    
    # 컬러 피커
    cpk = st.color_picker('색상 선택')
    st.write(cpk)
    

if __name__ == '__main__':
    main()