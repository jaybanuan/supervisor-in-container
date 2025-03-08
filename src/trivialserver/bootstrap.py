import os
import threading

from logging import getLogger

from fastapi import FastAPI


# Logger
logger = getLogger(__name__)


# ASGI app
app = FastAPI()


# functions
@app.get("/")
def root():
    value = {
        'process-id': os.getpid(),
        'thread-id': threading.get_ident(),
        'current-working-directory': os.getcwd(),
        'environments': {
            'SERVER_NAME': os.getenv('SERVER_NAME')
        },
    }

    logger.info(value)

    return value
