# Use AWS Lambda base image for Python 3.8
FROM public.ecr.aws/lambda/python:3.8

WORKDIR /app

# Copy dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install AWS Lambda Runtime Interface Client
RUN pip install --no-cache-dir awslambdaric

# Copy application code
COPY app/ app/

# Download AWS Lambda Runtime Interface Emulator (RIE)
ADD https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie /usr/local/bin/aws-lambda-rie
RUN chmod +x /usr/local/bin/aws-lambda-rie

# Set Lambda entry point using RIE
ENTRYPOINT [ "/usr/local/bin/aws-lambda-rie", "python3", "-m", "awslambdaric" ]
CMD [ "app.lambda_function.lambda_handler" ]
