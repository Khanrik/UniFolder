import json
import re
from pathlib import Path


# Common media file extensions supported by this script.
AUDIO_EXTENSIONS = {".mp3", ".wav", ".ogg", ".flac", ".m4a", ".aac"}
IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}

def collect_files(folder: Path, allowed_extensions: set[str]) -> dict[str, Path]:
	"""Collect files in a folder by lowercase stem for matching."""
	mapping: dict[str, Path] = {}
	if not folder.exists():
		return mapping

	for item in folder.iterdir():
		if not item.is_file():
			continue
		if item.suffix.lower() not in allowed_extensions:
			continue
		key = item.stem
		# Keep the first file for a stem to avoid unstable overwrites.
		mapping.setdefault(key, item)

	return mapping


def build_song_index(base_dir: Path) -> dict:
	"""Build the JSON-serializable songs structure from media folders."""
	audio_dir = base_dir / "songs" / "audio"
	image_dir = base_dir / "songs" / "images"

	audio_files = collect_files(audio_dir, AUDIO_EXTENSIONS)
	image_files = collect_files(image_dir, IMAGE_EXTENSIONS)

	all_stems = sorted(set(audio_files) | set(image_files))
	songs: dict[str, dict[str, str]] = {}

	for stem in all_stems:
		entry: dict[str, str] = {}

		if stem in audio_files:
			entry["audio_file"] = str(audio_files[stem].relative_to(base_dir)).replace("\\", "/")
		if stem in image_files:
			entry["image_file"] = str(image_files[stem].relative_to(base_dir)).replace("\\", "/")

		songs[stem] = entry

	return {"songs": songs}


def main() -> None:
	base_dir = Path(__file__).resolve().parent
	output_path = base_dir / "songs.json"

	data = build_song_index(base_dir)
	with output_path.open("w", encoding="utf-8") as file:
		json.dump(data, file, indent=4, ensure_ascii=False)

	song_count = len(data["songs"])
	print(f"Wrote {song_count} song entries to {output_path}")


if __name__ == "__main__":
	main()
