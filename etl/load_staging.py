from dotenv import load_dotenv
load_dotenv()
import pandas as pd
from sqlalchemy import create_engine
import os 
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")
db = os.getenv("DB_NAME")

connection_string = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{db}'
engine = create_engine(connection_string)

from pathlib import Path
here = Path(__file__).parent          # folder this .py lives in
data_file = here.parent / "data" / "DataCoSupplyChainDataset.csv"   # go up one, into data/

df = pd.read_csv(data_file, encoding='latin-1')


stg_orders = df.to_sql("stg_orders",con=engine, if_exists='replace', index=False)
print(stg_orders)