FROM python:3.11-bookworm

RUN apt update && apt install -y \
    libapt-pkg-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt app.py apt_info.py ./

RUN pip install -r requirements.txt \
    && rm requirements.txt

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--no-access-log"]
