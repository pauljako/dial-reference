#!/usr/bin/env python3

import flask
import flask_cors

app = flask.Flask(__name__)
flask_cors.CORS(app)

YT_OPEN: bool = True
PAIRING_CODE: str = ""


@app.route("/is_open")
def open_youtube():
    if YT_OPEN:
        return "1", 200
    return "0", 200


@app.route("/start")
def start_youtube():
    global PAIRING_CODE
    PAIRING_CODE = (
        "pairingCode="
        + flask.request.args.get("pairingCode")
        + "&additionalDataUrl="
        + flask.request.args.get("additionalDataUrl")
    )
    return "ok", 200


@app.route("/get_pairing_code")
def get_pairing_code():
    global PAIRING_CODE

    pairing_code = PAIRING_CODE

    PAIRING_CODE = ""

    if pairing_code != "":
        return pairing_code, 200
    return "", 404


@app.route("/set_open")
def set_open():
    global YT_OPEN
    YT_OPEN = flask.request.args.get("open") == "1"
    return "ok", 200


if __name__ == "__main__":
    app.run("127.0.0.1", 5440)
