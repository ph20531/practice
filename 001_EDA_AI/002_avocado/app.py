import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import random
import seaborn as sns
from prophet import Prophet
from PIL import Image

def settings():
    # st.set_page_config(layout="wide")
    pass

def load_data():
    global avocado
    avocado = pd.read_csv(r'001_EDA_AI\data\avocado.csv')
    avocado['Date'] = pd.to_datetime(avocado['Date'])
    del avocado['Unnamed: 0']
    avocado.sort_values('Date', ascending=True, inplace=True)
    avocado.reset_index(drop = True, inplace=True)

def index():
    st.title('홈')
    
    img = Image.open(r'001_EDA_AI\002_avocado\avocado.png')
    st.image(img, use_column_width=True)
    
    st.header('대시보드')
    st.write('"이 페이지는 메타에서 개발한 Prophet 라이브러리를 활용하여 만들어진 데이터 분석 및 예측 웹 대시보드입니다. 이 대시보드는 아보카도 시장 데이터셋에 대한 통찰력을 제공하고 데이터 분석을 수행하며, Prophet 라이브러리가 제공하는 고급 예측 기법을 사용하여 예측을 생성합니다. 사용자는 대시보드와 상호작용하여 데이터 트렌드를 탐색하고 예측을 시각화하며 기본 데이터 패턴에 대한 가치 있는 통찰력을 얻을 수 있습니다."')
        
def DP():
    st.title('데이터 분석')
    
    st.header('일반 조회')
    options = ['기본 데이터', '데이터 분석', '데이터 타입']
    selected_option = st.radio("조회할 유형을 선택하세요.", options)
    
    if selected_option == '기본 데이터':
        st.write(avocado)
    elif selected_option == '데이터 분석':
        st.write(avocado.describe())
    elif selected_option == '데이터 타입':
        temp = []
        for column in avocado.columns:
            temp.append({'컬럼': column, '데이터 타입': avocado[column].dtype})
        temp = pd.DataFrame(temp)
        st.write(temp)
    
    st.header('컬럼별 조회')
    selected_columns = st.multiselect("조회할 컬럼을 선택하세요.", avocado.columns)
    if(len(selected_columns) > 0):
        st.write(avocado[selected_columns])
        
        for column in selected_columns:
            if avocado[column].dtype in ['int64']:
                st.header(f"{column}의 차트")
                st.line_chart(avocado[column], color='#558203')
            if avocado[column].dtype in ['float64']:
                st.header(f"{column}의 차트")
                st.line_chart(avocado[column], color='#558203')
            elif avocado[column].dtype in ['object']:
                st.header(f"{column}의 유니크")
                st.write(avocado[column].unique())
            elif avocado[column].dtype in ['datetime64[ns]']:
                st.header(f"{column}의 최소/최대 날짜")
                st.write(pd.DataFrame([{'최소 날짜':avocado[column].min(), '최대 날짜':avocado[column].max()}]))
    else:
        st.write('선택된 컬럼이 없습니다.')
        
    st.header('컬럼별 상관관계 조회')
    numerical_columns = avocado.select_dtypes(include=['float64', 'int64']).columns.tolist()
    selected_columns = st.multiselect("상관관계를 분석할 컬럼을 선택하세요.", numerical_columns)

    if len(selected_columns) > 0:
        correlation_matrix = avocado[selected_columns].corr()

        fig, ax = plt.subplots()
        sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f", ax=ax)
        st.pyplot(fig)
    else:
        st.write('선택된 컬럼이 없습니다.')

def ML():
    st.title('머신러닝')
    
    st.header('설정')
    x = st.text_input(label="x", value="avocado['region'] == 'West'")
    number_columns = avocado.select_dtypes(include='number').columns
    y = st.selectbox("y", number_columns, index=number_columns.get_loc("AveragePrice"))
    
    periods = st.number_input("예측 기간(일)", value=30)
    freq_options = ['D', 'W', 'M']
    freq = st.selectbox("빈도(D:일, W:주, M:월)", freq_options, index=0)
    
    if st.button('예측'):
        # 데이터 준비
        avocado_df_west = avocado[eval(x)]
        avocado_prophet_df_west = avocado_df_west[['Date', y]]
        avocado_prophet_df_west.rename(columns={'Date': 'ds', y: 'y'}, inplace=True)
        avocado_prophet_df_west.reset_index(drop=True, inplace=True)

        # Prophet을 이용한 예측 수행
        prophet = Prophet()
        prophet.fit(avocado_prophet_df_west)
        future = prophet.make_future_dataframe(periods=periods, freq=freq)
        forecast = prophet.predict(future)

        # 시각화
        st.header(f'조건이 {x}인 {y}에 대한 예측 결과')
        st.pyplot(prophet.plot(forecast))

        # trend, yearly
        st.header(f'트랜드와 연간 예측')
        st.pyplot(prophet.plot_components(forecast))

def main():
    settings()
    load_data()
    
    st.sidebar.title('아보카도')
    menu = st.sidebar.selectbox("대시보드", ["홈", "데이터 분석", "머신러닝"])
    
    if menu == "홈":
        index()
    elif menu == "데이터 분석":
        DP()
    elif menu == "머신러닝":
        ML()
    
if __name__ == '__main__':
    main()