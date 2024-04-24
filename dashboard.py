import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import random
import seaborn as sns
from prophet import Prophet

def index():
    st.title('홈')

def DP():
    st.title('데이터')
    st.header('데이터 검색')
    avocado = pd.read_csv(r'data\avocado.csv')
    avocado['Date'] = pd.to_datetime(avocado['Date'])
    st.write(avocado)
    
    st.header('컬럼별 유형')
    for column in avocado.columns:
        st.write(f'{column}, {avocado[column].dtype}')
    
    st.header('컬럼별 조회')
    selected_columns = st.multiselect("컬럼을 선택하세요.", avocado.columns)
    if(len(selected_columns) > 0):
        st.write(avocado[selected_columns])
        
        for column in selected_columns:
            if avocado[column].dtype in ['int64']:
                st.header(f"{column}의 차트")
                st.line_chart(avocado[column])
                st.write(avocado[column].dtype)
            if avocado[column].dtype in ['float64']:
                st.header(f"{column}의 차트")
                st.line_chart(avocado[column])
                st.write(avocado[column].dtype)
            elif avocado[column].dtype in ['object']:
                st.header(f"{column}의 유니크")
                st.write(avocado[column].unique())
                st.write(avocado[column].dtype)
            elif avocado[column].dtype in ['datetime64[ns]']:
                st.header(f"{column}의 최소/최고 날짜")
                st.write(avocado[column].min())
                st.write(avocado[column].max())
                st.write(avocado[column].dtype)
    else:
        st.write('선택된 컬럼이 없습니다.')

def ML():
    st.title('머신러닝')

def main():
    st.sidebar.title('아보카도')
    menu = st.sidebar.selectbox("대시보드", ["홈", "데이터", "머신러닝"])
    
    if menu == "홈":
        index()
    elif menu == "데이터":
        DP()
    elif menu == "머신러닝":
        ML()
    
if __name__ == '__main__':
    main()