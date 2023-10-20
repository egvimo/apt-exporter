import os
from flask import Flask, Response
import apt_info

root_dir = os.environ.get("APT_ROOT_DIR", "/")

app = Flask(__name__)


@app.route("/metrics")
def metrics():
    data = apt_info.generate_metrics(root_dir=root_dir)
    return Response(data, mimetype='text/plain')
