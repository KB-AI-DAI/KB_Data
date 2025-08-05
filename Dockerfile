FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

RUN apt-get update && apt-get install -y \
        libgl1-mesa-glx libglib2.0-0 \
        git curl wget build-essential && \
        rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install faiss-gpu==1.7.2
RUN pip install bitsandbytes==0.43.0
RUN pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116
RUN apt update && apt install -y locales && \
    locale-gen ko_KR.UTF-8 && \
    update-locale LANG=ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

COPY requirements.txt .
RUN pip install -r requirements.txt
