FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ARG BUILD_DATE=unknown
ARG GIT_SHA=unknown
ENV BUILD_DATE=$BUILD_DATE GIT_SHA=$GIT_SHA

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
