import re
import tempfile
import wave
from pathlib import Path
from tqdm import tqdm
from piper import PiperVoice, SynthesisConfig

BASE_DIR = Path(__file__).resolve().parent

voice = PiperVoice.load(str(BASE_DIR / "en_US-libritts_r-medium.onnx"))

topic_path = BASE_DIR.parent / "Topic 4"
text_name = "RCoR Collaboration"

with open(topic_path / f"{text_name}.txt", "r", encoding="utf-8") as f:
    text = f.read()

# Split into sentence-like chunks so synthesis progress can be displayed.
chunks = [c.strip() for c in re.split(r"(?<=[.!?])\s+", text) if c.strip()]

with tempfile.TemporaryDirectory() as temp_dir:
    with wave.open(str(topic_path / f"{text_name}.wav"), "wb") as out_wav:
        for i, chunk in enumerate(tqdm(chunks, desc="Synthesizing", unit="chunk")):
            chunk_path = f"{temp_dir}/chunk_{i}.wav"

            # Let Piper create a valid WAV for this chunk.
            with wave.open(chunk_path, "wb") as chunk_wav:
                voice.synthesize_wav(chunk, chunk_wav, syn_config=SynthesisConfig(length_scale=0.5)) # 0.5 = Double speed

            # Read chunk audio and append only the PCM frames to final file.
            with wave.open(chunk_path, "rb") as chunk_wav:
                if i == 0:
                    out_wav.setnchannels(chunk_wav.getnchannels())
                    out_wav.setsampwidth(chunk_wav.getsampwidth())
                    out_wav.setframerate(chunk_wav.getframerate())

                out_wav.writeframes(chunk_wav.readframes(chunk_wav.getnframes()))