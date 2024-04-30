import streamlit as st
import pandas as pd

def main():
    st.title('K-Means 클러스터링 앱')
    st.text('csv파일을 업로드하면 비슷한 유형의 데이터끼리 묶어주는 앱입니다.')
    
    file = st.file_uploader('CSV파일 업로드', type=['csv'])
    
    if file is not None:
        df = pd.read_csv(file)
        st.dataframe(df)
        
        st.subheader('각 컬럼별 Nan의 갯수입니다.')
        st.dataframe(df.isna().sum())
        
        st.info('Nan이 있으면 해당 데이터는 삭제합니다.')
        st.dataframe(df.dropna(inplace=True))
        
        st.info('dropna후에는 꼭 reset_index를 사용합니다.')
        st.dataframe(df.reset_index(inplace=True))
        
        st.subheader('클러스터링에 사용할 컬럼을 선택하세요.')
        selected_columns = st.multiselect('X로 사용할 컬럼을 선택하세요.', df.columns)
        
        if(len(selected_columns) >= 2):
            X = df[selected_columns]
            st.dataframe(X)
        else:
            st.write('2개 이상의 컬럼을 선택해주세요.')
        
        
        
    

if __name__ == '__main__':
    main()