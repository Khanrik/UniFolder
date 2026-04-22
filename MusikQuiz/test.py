from pathlib import Path
import shutil

current_dir = Path(__file__).parent
image_path = current_dir / "piano_template.png"

for path in (current_dir / "songs" / "audio").glob("*.mp3"):
    shutil.copy(image_path, current_dir / "songs" / "images" / f"{path.stem}.png")