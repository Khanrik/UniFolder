import tkinter as tk
from tkinter import ttk, messagebox
import json
import webbrowser
import os
import subprocess
import sys

class MusicQuizApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Music Quiz Launcher")
        self.root.geometry("500x300")
        
        # Load data from JSON
        self.load_data()
        
        # Create UI elements
        self.create_widgets()
    
    def load_data(self):
        """Load song data from JSON file"""
        try:
            with open('songs.json', 'r', encoding='utf-8') as f:
                self.data = json.load(f)
                self.songs = self.data.get('songs', {})
        except FileNotFoundError:
            # Create a sample JSON file if it doesn't exist
            self.create_sample_json()
            with open('songs.json', 'r', encoding='utf-8') as f:
                self.data = json.load(f)
                self.songs = self.data.get('songs', {})
        except json.JSONDecodeError:
            messagebox.showerror("Error", "Invalid JSON format in songs.json")
            self.songs = {}
    
    def create_sample_json(self):
        """Create a sample JSON file with song data"""
        sample_data = {
            "songs": {
                "Bohemian Rhapsody": {
                    "url": "https://www.youtube.com/watch?v=fJ9rUzIMcZQ",
                    "txt_file": "bohemian_rhapsody.txt"
                },
                "Imagine": {
                    "url": "https://www.youtube.com/watch?v=YkgkThdzX-8",
                    "txt_file": "imagine.txt"
                },
                "Hotel California": {
                    "url": "https://www.youtube.com/watch?v=09839DpTctU",
                    "txt_file": "hotel_california.txt"
                }
            }
        }
        
        with open('songs.json', 'w', encoding='utf-8') as f:
            json.dump(sample_data, f, indent=4, ensure_ascii=False)
        
        # Create sample txt files
        for song_title, song_data in sample_data['songs'].items():
            txt_file = song_data['txt_file']
            if not os.path.exists(txt_file):
                with open(txt_file, 'w', encoding='utf-8') as f:
                    f.write(f"Lyrics for {song_title}\n\n")
                    f.write("Add your lyrics here...")
    
    def create_widgets(self):
        """Create the UI widgets"""
        # Title label
        title_label = ttk.Label(
            self.root, 
            text="Music Quiz Launcher", 
            font=("Arial", 16, "bold")
        )
        title_label.pack(pady=20)
        
        # Frame for input
        input_frame = ttk.Frame(self.root)
        input_frame.pack(pady=10, padx=20, fill='x')
        
        # Song title label
        song_label = ttk.Label(input_frame, text="Song Title:", font=("Arial", 11))
        song_label.pack(side='left', padx=(0, 10))
        
        # Combobox for song selection (with autocomplete)
        self.song_var = tk.StringVar()
        self.song_combo = ttk.Combobox(
            input_frame, 
            textvariable=self.song_var,
            values=list(self.songs.keys()),
            font=("Arial", 10),
            width=30
        )
        self.song_combo.pack(side='left', fill='x', expand=True)
        
        # Button frame
        button_frame = ttk.Frame(self.root)
        button_frame.pack(pady=20)
        
        # Open URL button
        self.url_button = ttk.Button(
            button_frame,
            text="Open Website",
            command=self.open_url,
            width=15
        )
        self.url_button.grid(row=0, column=0, padx=5, pady=5)
        
        # Open text file button
        self.txt_button = ttk.Button(
            button_frame,
            text="Open Text File",
            command=self.open_txt,
            width=15
        )
        self.txt_button.grid(row=0, column=1, padx=5, pady=5)
        
        # Open both button
        self.both_button = ttk.Button(
            button_frame,
            text="Open Both",
            command=self.open_both,
            width=15
        )
        self.both_button.grid(row=1, column=0, columnspan=2, padx=5, pady=5)
        
        # Status label
        self.status_label = ttk.Label(
            self.root, 
            text="", 
            font=("Arial", 9),
            foreground="green"
        )
        self.status_label.pack(pady=10)
        
        # Info label
        info_label = ttk.Label(
            self.root,
            text=f"Available songs: {len(self.songs)}",
            font=("Arial", 9),
            foreground="gray"
        )
        info_label.pack(pady=5)
        
        # Bind Enter key to open both
        self.root.bind('<Return>', lambda e: self.open_both())
    
    def get_song_data(self):
        """Get the data for the selected song"""
        song_title = self.song_var.get().strip()
        
        if not song_title:
            messagebox.showwarning("Warning", "Please enter a song title")
            return None
        
        if song_title not in self.songs:
            messagebox.showerror("Error", f"Song '{song_title}' not found in database")
            return None
        
        return self.songs[song_title]
    
    def open_url(self):
        """Open the URL for the selected song"""
        song_data = self.get_song_data()
        if not song_data:
            return
        
        url = song_data.get('url')
        if url:
            webbrowser.open(url)
            self.status_label.config(text=f"Opened URL for '{self.song_var.get()}'")
        else:
            messagebox.showerror("Error", "No URL found for this song")
    
    def open_txt(self):
        """Open the text file for the selected song"""
        song_data = self.get_song_data()
        if not song_data:
            return
        
        txt_file = song_data.get('txt_file')
        if txt_file:
            if os.path.exists(txt_file):
                # Open with default text editor
                if sys.platform == 'win32':
                    os.startfile(txt_file)
                elif sys.platform == 'darwin':  # macOS
                    subprocess.run(['open', txt_file])
                else:  # linux
                    subprocess.run(['xdg-open', txt_file])
                self.status_label.config(text=f"Opened text file for '{self.song_var.get()}'")
            else:
                messagebox.showerror("Error", f"Text file '{txt_file}' not found")
        else:
            messagebox.showerror("Error", "No text file found for this song")
    
    def open_both(self):
        """Open both URL and text file"""
        song_data = self.get_song_data()
        if not song_data:
            return
        
        self.open_url()
        self.open_txt()

def main():
    root = tk.Tk()
    app = MusicQuizApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()