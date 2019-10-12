FROM python:3.6

COPY requirements.txt  /
COPY listener.py  /

RUN pip install --upgrade pip && pip install -r requirements.txt
RUN chmod +x listener.py
