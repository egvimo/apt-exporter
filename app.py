import os
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
import apt_info

root_dir = os.environ.get("APT_ROOT_DIR", "/")

app = FastAPI()


@app.get("/metrics", response_class=PlainTextResponse)
def metrics():
    data = apt_info.generate_metrics(root_dir=root_dir)
    return data
