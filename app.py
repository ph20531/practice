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
    option = st.radio("Choose an option", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", option)
    
    # 체크박스
    st.title('Checkbox Example')
    if st.checkbox("Check me"):
        st.write("You checked the box!")
    else:
        st.write("You didn't check the box.")
        
    # 선택상자
    option = st.selectbox("Choose an option", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", option)
    
    # 다중 선택상자
    options = st.multiselect("Choose multiple options", ["Option 1", "Option 2", "Option 3"])
    st.write("You selected:", options)
    
    # 슬라이더
    value = st.slider("Choose a value", min_value=0, max_value=10, step=1)
    st.write("You selected:", value)

if __name__ == '__main__':
    main()