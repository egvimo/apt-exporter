FROM python:3.11-bookworm

RUN apt update && apt install -y libapt-pkg-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip install pipenv

WORKDIR /app

COPY Pipfile Pipfile.lock app.py apt_info.py ./

RUN pipenv install --deploy --ignore-pipfile

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "app:app", "--host", "0.0.0.0", "--no-access-log"]
