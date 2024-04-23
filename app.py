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

def main():
    name = '장범근'
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

if __name__ == '__main__':
    main()