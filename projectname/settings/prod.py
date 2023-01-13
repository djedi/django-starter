"""
Production Settings Overrides
"""
import os

# pylint: disable=wildcard-import, unused-import
from . import *

DEBUG = False

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("POSTGRES_NAME"),
        "USER": os.environ.get("POSTGRES_USER"),
        "PASSWORD": os.environ.get("POSTGRES_PASSWORD"),
        "HOST": "db",
        "PORT": 5432,
    }
}

ALLOWED_HOSTS = (
    "192.168.1.4",
    "django-starter.djedi.dev",
)
