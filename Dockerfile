FROM python:3.8
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app/ app/

ENTRYPOINT [ "python3", "-m", "awslambdaric" ]
CMD [ "app.lambda_function.lambda_handler" ]