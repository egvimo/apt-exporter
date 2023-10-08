from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
import apt_info

app = FastAPI()


@app.get("/metrics", response_class=PlainTextResponse)
def metrics():
    data = apt_info._main()  # pylint: disable=protected-access
    return data
