import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Cats", "Breed", "Weight", "Fur color"]

def generate_row():

    return {
        "Cats": random.choice(["Barsik", "Murzik", "Vaska"]),
        "Breed": random.choice(["Maine Coon", "Scottish Fold", "Siamese"]),
        "Weight": random.randint(1, 10),
        "Fur color": random.choice(["Black", "White", "Orange"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
