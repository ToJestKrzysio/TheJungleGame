from datetime import datetime, timedelta


def get_timestamp():
    return (datetime.now() + timedelta(hours=2)).strftime("%y-%m-%d_%H:%M:%S")
