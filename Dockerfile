FROM python:3.11-bookworm as build

ENV PIPENV_VENV_IN_PROJECT=1

RUN apt update && \
    apt install -y libapt-pkg-dev && \
    pip install pipenv

WORKDIR /build

COPY Pipfile Pipfile.lock ./

RUN pipenv sync

FROM build

WORKDIR /app

COPY --from=build /build/.venv/ ./.venv/
COPY app.py apt_info.py ./

EXPOSE 8000

CMD ["/app/.venv/bin/uvicorn", "app:app", "--host", "0.0.0.0", "--no-access-log"]
