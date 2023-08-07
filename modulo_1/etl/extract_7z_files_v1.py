import pandas as pd
import lzma

with lzma.open("RAIS_VINC_PUB_NORTE.7z", "r") as f:
    df = pd.read_csv(f, ...)