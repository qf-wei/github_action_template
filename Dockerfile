FROM python:3.8
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app/ app/

ENTRYPOINT [ "/usr/bin/python3.8", "-m", "awslambdaric" ]
CMD [ "lambda_function.lambda_handler" ]