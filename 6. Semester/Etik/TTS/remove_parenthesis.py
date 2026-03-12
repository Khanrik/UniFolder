import re
import sys
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
topic_path = BASE_DIR.parent / "Topic 4"
text_name = "RCoR Collaboration"

def remove_parenthetical(text: str) -> str:
    cleaned = re.sub(r"\([^)]*\)", "", text)
    # Remove spaces before punctuation (e.g. "word ." -> "word.")
    cleaned = re.sub(r" +([.,;:!?])", r"\1", cleaned)
    # Collapse multiple spaces into one
    cleaned = re.sub(r" {2,}", " ", cleaned)
    # Strip leading/trailing spaces on each line
    cleaned = "\n".join(line.strip() for line in cleaned.splitlines())
    return cleaned.strip()

def process_file(file_path: str) -> None:
    path = Path(file_path)
    text = path.read_text(encoding="utf-8")
    cleaned = remove_parenthetical(text)
    path.write_text(cleaned, encoding="utf-8")
    print(f"Done. Processed: {text_name}.txt")

process_file(str(topic_path / f"{text_name}.txt"))