import csv

input_path = "all_metrics.txt"
output_path = "all_metrics.csv"

rows = []
with open(input_path, "r") as f:
    row = {}
    for line in f:
        line = line.strip()
        if line.startswith("Iteration:"):
            if row:
                rows.append(row)
                row = {}
            row["Iteration"] = int(line.split(":")[1].strip())
        elif line.startswith("Time:"):
            row["Time"] = float(line.split(":")[1].strip())
        elif ":" in line:
            key, value = line.split(":")
            row[key.strip()] = float(value.strip())
    if row:
        rows.append(row)

# ヘッダーを決定
headers = ["Iteration", "Time", "frame_precision", "frame_recall", "frame_f1",
           "note_precision", "note_recall", "note_f1"]

with open(output_path, "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=headers)
    writer.writeheader()
    for row in rows:
        writer.writerow(row)

print(f"CSVファイルを出力しました: {output_path}")