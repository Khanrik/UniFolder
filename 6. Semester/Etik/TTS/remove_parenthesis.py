import re
import sys
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
topic_path = BASE_DIR.parent / "Topic 5"

def remove_parenthetical(text: str) -> str:
    cleaned = str.replace(text, "�", "")
    cleaned = re.sub(r"\([^)]*\)", "", cleaned)
    # Remove spaces before punctuation (e.g. "word ." -> "word.")
    cleaned = re.sub(r" +([.,;:!?])", r"\1", cleaned)
    # Collapse multiple spaces into one
    cleaned = re.sub(r" {2,}", " ", cleaned)
    # Strip leading/trailing spaces on each line
    cleaned = "\n".join(line.strip() for line in cleaned.splitlines())
    return cleaned.strip()

def process_file(file_path: Path) -> None:
    text = file_path.read_text(encoding="utf-8")
    cleaned = remove_parenthetical(text)
    file_path.write_text(cleaned, encoding="utf-8")
    print(f"Done. Processed: {file_path.name}")

def find_text(dir: Path) -> Path:
    for file in dir.glob("*.txt"):
        return file
    raise FileNotFoundError(f"No txt files found in {dir}")

if __name__ == "__main__":
    process_file(find_text(topic_path))