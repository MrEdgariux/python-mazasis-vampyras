import sqlite3, json, os, logging
from datetime import datetime


def is_folder_exist(path):
    return os.path.exists(path)

def create_folder(path):
    os.makedirs(path, exist_ok=True)

def code_check(code):
    return code == '7547'