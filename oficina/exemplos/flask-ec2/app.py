"""Aplicação de demonstração da oficina DevOps do EPIC."""

import os

from flask import Flask, jsonify


def create_app() -> Flask:
    app = Flask(__name__)

    @app.get("/")
    def index():
        return jsonify(
            project="EPIC DevOps",
            message=os.getenv("MESSAGE", "Uma entrega reproduzível."),
            version=os.getenv("APP_VERSION", "1.0"),
        )

    @app.get("/health")
    def health():
        return jsonify(status="ok", version=os.getenv("APP_VERSION", "1.0"))

    return app


if __name__ == "__main__":
    create_app().run(host="0.0.0.0", port=5000)
