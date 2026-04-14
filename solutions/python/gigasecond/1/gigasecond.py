from datetime import datetime, timedelta


def add(moment: datetime) -> datetime:
    return moment.__add__(timedelta(seconds=1e9))
