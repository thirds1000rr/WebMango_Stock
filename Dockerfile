FROM python:3.8-slim

WORKDIR /app
ENV LANG C.UTF-8
RUN apt-get update
RUN apt-get install 'ffmpeg'\
    'libsm6'\ 
    'libxext6'  -y

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

# Make sure the environment is activated:
RUN echo "Make sure Torch and flask are installed:"
RUN python -c "import flask"



CMD gunicorn OnlineShop:app --bind 0.0.0.0:${PORT:-8000}