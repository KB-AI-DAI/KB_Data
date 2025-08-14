## LangChain을 활용한 신용등급하락 조기예측 LLM

### **팀: 다이아닌데이🌻** 

### **가장 최신 브랜치: dev-ej**
**평가를 위하여 가장 최신 내용이 반영된 브랜치를 사용해주시길 바랍니다.**

---

🚀 이 프로젝트는 RAG를 사용하여 정기적으로 업데이트되는 재무제표와 실시간 뉴스데이터를 결합한 신용등급 하락 조기예측  LLM  모델을  개발하는  것을  목표로 합니다.

기존의  조기 경보 시스템는 갱신 주기와 평가 주기가 비실시간적이고, 내/외부 정형 데이터  위주로 설계되어 뉴스, 소셜, 법원 공시 등 비정형 실시간 데이터 반영에 제약이 있습니다. 이로 인해 산업위험, 사건사고, 평판리스크 등 즉시성 높은 위험신호를 제때 감지하지 못하는 구조적 한계가 존재합니다.

이에 본 연구는 LLM 기반 EWS에 스트리밍 뉴스 데이터를 결합하여, 재무제표뿐만 아니라 비정형 리스크까지 실시간 반영함으로써 등급 하락  조짐을  수주~ 수개월 앞서 탐지하는 것을 목표로 합니다.

궁극적으로, 거시/미시 지표와 대체데이터(뉴스 데이터 기반 산업, 기업 기반 분석)를 결합하여 전통적  지표로  포착하기  어려운  신용등급 하락 예측을 반영하는 신용등급 조기경보 모델을 제시합니다.

 **Keywords: Language models, Prompt engineering, Data mining, RAG(Retrieval-Augmented 
Generation), News data, Financial statements data, LangChain, Issuer credit rating EWS(Early 
Warning System)**

---
### 운영체제
Ubuntu 18.04.6 LTS  
### Database
Chroma 0.6.3  
### 설치 및 실행
1. 의존성 설치
```
$ pip install -r requirements.txt
```  

2. 프로젝트 루트에 .env.template의 내용을 복사하여 .env파일을 생성해주세요.
```
#.env
# chromadb setting
CHROMA_PORT=8000
CHROMA_HOST=kb-ai-db

# selenium driver path
DRIVER_PATH=/workspace/chromedriver-linux64/chromedriver
CHROME_PATH=/workspace/chrome-linux64/chrome
```
   
3. VectorDB 서버를 띄웁니다.
```
docker run -d --name <container_name> \
--network devnet \
-p <host port>:<내부port>  \ 
-v $(pwd)/data/chromadb:/chroma/chroma \ 
-e IS_PERSISTENT=TRUE \
 -e PERSIST_DIRECTORY=/chroma/chroma \
  -e PORT=<port> \
 chromadb/chroma:0.6.3
```
4. 다음 순서대로 파일을 실행합니다.
1) /src/data-preprocessing.ipynb
2) /src/extract_realtime_news_data.ipynb
3) /src/chromadb_setting.ipynb

4)  4-1. /src/company_creditrisk_LangChain.ipynb  
10번 째 셀 내의 kw_qurey 객체에 기업명을 바꾸어 원하는 기업의 실행 결과를 받아볼 수 있습니다.
  ```
  ########### company별 keyword 추출: topics_collection ############

  #추후 사용자의 질문에서 실제 회사명 키워드를 뽑아내는 작업이 필요함(자동화)
  #DB 업데이트 후 확인 필요(에스케이하이닉스)
  
  kw_query = '하이트진로' #컴퍼니 기준으로 키워드 찾기

  ```
  
  

---
### 구성원
| **엄지현** | **문서영** | **김은진 (Corresponding Ph.D)** | 
|:---:|:---:|:---:|
| <img src="https://avatars.githubusercontent.com/u/135002121?v=4" width="100" height="100"> | <img src="https://github.com/urielmun.png" width="100" height="100"> | <img src="https://github.com/gracetrue.png" width="100" height="100"> |
| <a href="mailto:luminous037@gmail.com"><img src="https://img.shields.io/badge/EMAIL-F0F0F0?style=flat-square&logo=Gmail&logoColor=orange&link=mailto:luminous037@gmail.com"/></a> | <a href="mailto:yungum0531@gmail.com"><img src="https://img.shields.io/badge/EMAIL-F0F0F0?style=flat-square&logo=Gmail&logoColor=orange&link=mailto:yungum0531@gmail.com"/></a> | <a href="mailto:dw0815@chungbuk.ac.kr"><img src="https://img.shields.io/badge/EMAIL-F0F0F0?style=flat-square&logo=Gmail&logoColor=orange&link=mailto:dw0815@chungbuk.ac.kr"/></a> |
| <a href="https://github.com/luminous037">GitHub</a> | <a href="https://github.com/urielmun">GitHub</a> | <a href="https://github.com/gracetrue">GitHub</a> |
