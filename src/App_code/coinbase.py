import datetime
from typing import List, Dict, Optional, Any
import requests as rq
import sys
from App_code.utils.config import get_warehouse_creds
from App_code.utils.db import WarehouseConnection
import psycopg2.extras as p
import pandas as pd


def get_data_from_api() -> Any:
    url = "https://api.coincap.io/v2/exchanges"
    try:
        r = rq.get(url)
    except rq.ConnectionError as ce:
        print(f"There was an error with the request, {ce}")
        sys.exit(1)
    return r.json().get("data", [])


def update_timestamp(epoque_time: int) -> Optional[datetime.datetime]:
    return datetime.datetime.utcfromtimestamp(epoque_time / 1000)


def _get_exchange_insert_query() -> str:
    return """
    INSERT INTO bitcoin.exchange (
        id,
        name,
        rank,
        percenttotalvolume,
        volumeusd,
        tradingpairs,
        socket,
        exchangeurl,
        updated_unix_millis,
        updated_utc
    )
    VALUES (
        %(exchangeId)s,
        %(name)s,
        %(rank)s,
        %(percentTotalVolume)s,
        %(volumeUsd)s,
        %(tradingPairs)s,
        %(socket)s,
        %(exchangeUrl)s,
        %(updated_unix_millis)s,
        %(updated_utc)s
    );
    """


conn = WarehouseConnection(db_conn=get_warehouse_creds())
raw_data = get_data_from_api()
df = pd.DataFrame(raw_data)
df["updated_utc"] = df["updated"].map(lambda x: update_timestamp(x))
df["updated_unix_millis"] = df["updated"]
df["name"] = "Nana"
trans_data = df.to_dict("records")


# def run() -> None:
#     try:
#         with conn.managed_cursor() as curs:
#             p.execute_batch(curs, _get_exchange_insert_query(), trans_data[:5])
#             print("successfully written data")
#     except:
#         print(conn.conn_url)
#         raise


# if __name__ == "__main__":
#     run()

print(conn.conn_url)
