FROM python:3.4-alpine
ADD . /code
WORKDIR /code
ENV text "From The Dockerfile"
RUN pip install -r requirements.txt
CMD ["python", "app.py"]