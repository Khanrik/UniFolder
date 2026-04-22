import pygame
import json
import random
import os
from enum import Enum
from typing import Optional, List, Tuple

# Initialisér pygame
pygame.init()
pygame.mixer.init()

# Konstanter
SCREEN_WIDTH = 1200
SCREEN_HEIGHT = 700
FPS = 60
ROUND_TIME = 60  # 1 minut i sekunder
BUTTON_WIDTH = 200
BUTTON_HEIGHT = 60
EXAMPLE_SONG_TITLES = ["7 Years - Lukas Graham", "7 Years - Lukas Graham"]

# Farver
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
GRAY = (100, 100, 100)
DARK_GRAY = (50, 50, 50)
GREEN = (0, 200, 0)
RED = (200, 0, 0)
BLUE = (70, 130, 200)

class GameState(Enum):
    START_SCREEN = 1
    PLAYING = 2
    ROUND_END = 3
    GAME_OVER = 4

class SongManager:
    """Håndterer songs.json og tilfældig sang-valg"""
    
    def __init__(self, songs_file: str):
        with open(songs_file, 'r', encoding='utf-8') as f:
            self.all_songs = json.load(f)['songs']
        self.shown_songs = set()  # Songs der allerede er blevet vist
        self.current_song = None
        self.current_song_name = None
    
    def get_random_song(self) -> Tuple[str, dict]:
        """Returnerer en tilfældig sang der ikke er blevet vist før"""
        available_songs = [name for name in self.all_songs.keys() 
                          if name not in self.shown_songs]
        
        if not available_songs:
            # Hvis alle sange er vist, reset og start igen
            self.shown_songs.clear()
            available_songs = list(self.all_songs.keys())
        
        song_name = random.choice(available_songs)
        self.shown_songs.add(song_name)
        self.current_song_name = song_name
        self.current_song = self.all_songs[song_name]
        return song_name, self.current_song
    
    def load_audio(self, song_name: str):
        """Loader audio fil for given sang"""
        song_data = self.all_songs[song_name]
        audio_path = song_data['audio_file']
        if os.path.exists(audio_path):
            pygame.mixer.music.load(audio_path)
        else:
            print(f"Advarsel: Lyd fil ikke fundet: {audio_path}")
    
    def load_image(self, song_name: str) -> Optional[pygame.Surface]:
        """Loader billede for given sang"""
        song_data = self.all_songs[song_name]
        image_path = song_data['image_file']
        if os.path.exists(image_path):
            try:
                img = pygame.image.load(image_path)
                img = pygame.transform.scale(img, (444,320))
                return img
            except:
                print(f"Advarsel: Kunne ikke loade billede: {image_path}")
        else:
            print(f"Advarsel: Billede fil ikke fundet: {image_path}")
        return None

class Button:
    """Knap klasse"""
    
    def __init__(self, x: int, y: int, width: int, height: int, text: str):
        self.rect = pygame.Rect(x, y, width, height)
        self.text = text
        self.hovered = False
    
    def draw(self, surface: pygame.Surface, font: pygame.font.Font):
        """Tegner knappen"""
        color = GREEN if self.hovered else GRAY
        pygame.draw.rect(surface, color, self.rect)
        pygame.draw.rect(surface, WHITE, self.rect, 2)
        
        text_surf = font.render(self.text, True, BLACK)
        text_rect = text_surf.get_rect(center=self.rect.center)
        surface.blit(text_surf, text_rect)
    
    def is_clicked(self, pos: Tuple[int, int]) -> bool:
        """Check om knap blev klikket"""
        return self.rect.collidepoint(pos)
    
    def update(self, mouse_pos: Tuple[int, int]):
        """Update hover state"""
        self.hovered = self.rect.collidepoint(mouse_pos)

class MusikQuiz:
    """Hovedklasse for musikquiz spillet"""
    
    def __init__(self):
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption("Musik Quiz")
        self.clock = pygame.time.Clock()
        self.font_large = pygame.font.Font(None, 60)
        self.font_medium = pygame.font.Font(None, 40)
        self.font_small = pygame.font.Font(None, 30)
        
        self.game_state = GameState.START_SCREEN
        self.song_manager = SongManager('songs.json')
        
        # Spil variabler
        self.round_time_left = ROUND_TIME
        self.current_song_image = None
        self.current_song_name = None
        self.has_used_skip = False
        self.song_history = []  # Historie af sange i denne runde
        self.song_history_index = 0
        self.is_playing = False
        self.song_position = 0  # Position i sekunder
        self.song_duration = 0
        self.song_start_offset = 0
        self.is_dragging_progress = False
        self.was_playing_before_drag = False
        self.volume = 1.0
        self.is_dragging_volume = False
        self.example_mode = False
        self.example_song_queue: List[str] = []

        # Progress bar område
        self.progress_rect = pygame.Rect(
            SCREEN_WIDTH // 2,
            SCREEN_HEIGHT // 2 - 50,
            500,
            20
        )

        # Volume slider område
        self.volume_rect = pygame.Rect(
            SCREEN_WIDTH // 2,
            SCREEN_HEIGHT // 2 + 20,
            500,
            20
        )

        pygame.mixer.music.set_volume(self.volume)
        
        # Knapper
        self.setup_buttons()
    
    def setup_buttons(self):
        """Setup alle knapper"""
        start_button_y = SCREEN_HEIGHT // 2 - BUTTON_HEIGHT // 2
        self.start_button = Button(
            SCREEN_WIDTH // 2 - BUTTON_WIDTH // 2,
            start_button_y,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "START"
        )

        self.example_start_button = Button(
            SCREEN_WIDTH // 2 - BUTTON_WIDTH // 2,
            start_button_y + BUTTON_HEIGHT + 20,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "EKSEMPEL"
        )
        
        self.play_button = Button(
            SCREEN_WIDTH // 4 - BUTTON_WIDTH // 2,
            SCREEN_HEIGHT - 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "AFSPIL/PAUSE"
        )
        
        self.skip_button = Button(
            SCREEN_WIDTH // 2 - BUTTON_WIDTH // 2,
            SCREEN_HEIGHT - 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "SKIP (1)"
        )
        
        self.back_button = Button(
            3 * SCREEN_WIDTH // 4 - BUTTON_WIDTH,
            SCREEN_HEIGHT - 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "GÅ TILBAGE"
        )

        self.forward_button = Button(
            3 * SCREEN_WIDTH // 4 - BUTTON_WIDTH,
            SCREEN_HEIGHT - 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "GÅ FREM"
        )
        
        self.stop_button = Button(
            SCREEN_WIDTH - 220,
            SCREEN_HEIGHT - 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "STOP RUNDE"
        )
        
        self.ready_button = Button(
            SCREEN_WIDTH // 2 + BUTTON_WIDTH // 2,
            SCREEN_HEIGHT // 2 + 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "KLAR"
        )

        self.menu_button = Button(
            SCREEN_WIDTH // 2 - BUTTON_WIDTH - 50,
            SCREEN_HEIGHT // 2 + 100,
            BUTTON_WIDTH, BUTTON_HEIGHT,
            "MAIN MENU"
        )
    
    def handle_events(self):
        """Handle input events"""
        mouse_pos = pygame.mouse.get_pos()
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
            
            if event.type == pygame.MOUSEMOTION:
                if self.game_state == GameState.PLAYING and self.is_dragging_progress:
                    self.song_position = self.get_song_position_from_x(mouse_pos[0])
                if self.game_state == GameState.PLAYING and self.is_dragging_volume:
                    self.set_volume_from_x(mouse_pos[0])
                self.update_button_states(mouse_pos)
            
            if event.type == pygame.MOUSEBUTTONDOWN:
                if self.game_state == GameState.START_SCREEN:
                    if self.start_button.is_clicked(mouse_pos):
                        self.example_mode = False
                        self.example_song_queue = []
                        self.start_new_round()
                    elif self.example_start_button.is_clicked(mouse_pos):
                        self.start_example_round()
                
                elif self.game_state == GameState.PLAYING:
                    if self.progress_rect.collidepoint(mouse_pos) and self.song_duration > 0:
                        self.is_dragging_progress = True
                        self.was_playing_before_drag = self.is_playing
                        if self.is_playing:
                            pygame.mixer.music.pause()
                            self.is_playing = False
                        self.song_position = self.get_song_position_from_x(mouse_pos[0])
                    elif self.volume_rect.collidepoint(mouse_pos):
                        self.is_dragging_volume = True
                        self.set_volume_from_x(mouse_pos[0])
                    elif self.play_button.is_clicked(mouse_pos):
                        self.toggle_play()
                    elif self.skip_button.is_clicked(mouse_pos) and not self.has_used_skip:
                        self.skip_song()
                    elif (
                        self.back_button.is_clicked(mouse_pos)
                        and self.has_used_skip
                        and self.song_history_index > 0
                    ):
                        self.go_back()
                    elif (
                        self.forward_button.is_clicked(mouse_pos)
                        and self.has_used_skip
                        and self.song_history_index < len(self.song_history) - 1
                    ):
                        self.go_forward()
                    elif self.stop_button.is_clicked(mouse_pos):
                        self.end_round()
                
                elif self.game_state == GameState.ROUND_END:
                    if self.ready_button.is_clicked(mouse_pos):
                        self.start_new_round()
                    elif self.menu_button.is_clicked(mouse_pos):
                        self.go_to_start_screen()

            if event.type == pygame.MOUSEBUTTONUP:
                if self.game_state == GameState.PLAYING and self.is_dragging_progress:
                    self.song_position = self.get_song_position_from_x(mouse_pos[0])
                    self.is_dragging_progress = False
                    self.seek_to_position(self.song_position, self.was_playing_before_drag)
                    self.was_playing_before_drag = False
                if self.game_state == GameState.PLAYING and self.is_dragging_volume:
                    self.set_volume_from_x(mouse_pos[0])
                    self.is_dragging_volume = False
        
        return True
    
    def update_button_states(self, mouse_pos: Tuple[int, int]):
        """Update hover state for alle knapper"""
        if self.game_state == GameState.START_SCREEN:
            self.start_button.update(mouse_pos)
            self.example_start_button.update(mouse_pos)
        elif self.game_state == GameState.PLAYING:
            self.play_button.update(mouse_pos)
            self.skip_button.update(mouse_pos)
            self.back_button.update(mouse_pos)
            self.forward_button.update(mouse_pos)
            self.stop_button.update(mouse_pos)
        elif self.game_state == GameState.ROUND_END:
            self.ready_button.update(mouse_pos)
            self.menu_button.update(mouse_pos)

    def go_to_start_screen(self):
        """Gå tilbage til startmenuen og reset rundetilstand."""
        pygame.mixer.music.stop()
        self.is_playing = False
        self.is_dragging_progress = False
        self.has_used_skip = False
        self.song_history = []
        self.song_history_index = 0
        self.example_mode = False
        self.example_song_queue = []
        self.game_state = GameState.START_SCREEN

    def get_example_songs(self) -> List[str]:
        """Find sangtitler til eksempel-tilstand baseret på ønskede navne."""
        matched_songs: List[str] = []
        song_names = list(self.song_manager.all_songs.keys())

        for wanted_title in EXAMPLE_SONG_TITLES:
            wanted_lower = wanted_title.lower()

            exact_match = next(
                (name for name in song_names if name.lower() == wanted_lower),
                None
            )
            if exact_match and exact_match not in matched_songs:
                matched_songs.append(exact_match)
                continue

            contains_match = next(
                (name for name in song_names if wanted_lower in name.lower()),
                None
            )
            if contains_match and contains_match not in matched_songs:
                matched_songs.append(contains_match)

        return matched_songs

    def get_next_song(self) -> Tuple[str, dict]:
        """Hent næste sang ud fra aktiv spiltilstand."""
        if self.example_mode:
            if not self.example_song_queue:
                self.example_song_queue = self.get_example_songs()

            if self.example_song_queue:
                song_name = self.example_song_queue.pop(0)
                song_data = self.song_manager.all_songs[song_name]
                self.song_manager.shown_songs.add(song_name)
                self.song_manager.current_song_name = song_name
                self.song_manager.current_song = song_data
                return song_name, song_data

            print("Advarsel: Kunne ikke finde eksempel-sangene. Bruger tilfældige sange i stedet.")

        return self.song_manager.get_random_song()

    def start_example_round(self):
        """Start spil i eksempel-tilstand med faste sange."""
        self.example_mode = True
        self.example_song_queue = self.get_example_songs()
        self.start_new_round()

    def load_song(self, song_name: str):
        """Loader billede, lyd og varighed for en bestemt sang"""
        song_data = self.song_manager.all_songs[song_name]
        self.current_song_name = song_name
        self.current_song_image = self.song_manager.load_image(song_name)
        self.song_manager.load_audio(song_name)

        try:
            sound = pygame.mixer.Sound(song_data['audio_file'])
            self.song_duration = sound.get_length()
        except Exception:
            self.song_duration = 0

        self.song_position = 0
        self.song_start_offset = 0
        self.is_dragging_progress = False
        pygame.mixer.music.play()
        self.is_playing = True

    def get_song_position_from_x(self, mouse_x: int) -> float:
        """Konverter musens x-position på progress bar til sang-position i sekunder"""
        if self.song_duration <= 0:
            return 0
        relative_x = max(0, min(mouse_x - self.progress_rect.x, self.progress_rect.width))
        ratio = relative_x / self.progress_rect.width
        return ratio * self.song_duration

    def seek_to_position(self, seconds: float, should_play: bool):
        """Seek til en bestemt position i sangen"""
        if self.song_duration <= 0:
            return

        target = max(0, min(seconds, self.song_duration))
        self.song_position = target
        self.song_start_offset = target

        try:
            pygame.mixer.music.play(start=target)
            if should_play:
                self.is_playing = True
            else:
                pygame.mixer.music.pause()
                self.is_playing = False
        except Exception:
            # Fallback hvis formatet ikke understøtter præcis seek
            self.is_playing = False

    def set_volume_from_x(self, mouse_x: int):
        """Sæt volume ud fra musens x-position på volume slider"""
        relative_x = max(0, min(mouse_x - self.volume_rect.x, self.volume_rect.width))
        self.volume = relative_x / self.volume_rect.width
        pygame.mixer.music.set_volume(self.volume)
    
    def update(self):
        """Update game state"""
        if self.game_state == GameState.PLAYING:
            self.round_time_left -= 1 / FPS
            
            # Update sang position
            if pygame.mixer.music.get_busy() and self.is_playing and not self.is_dragging_progress:
                elapsed = max(0, pygame.mixer.music.get_pos()) / 1000
                self.song_position = self.song_start_offset + elapsed
                if self.song_duration > 0:
                    self.song_position = min(self.song_position, self.song_duration)
            
            # Tjek om tiden er løbet ud
            if self.round_time_left <= 0:
                self.end_round()
    
    def start_new_round(self):
        """Start en ny runde"""
        # Hent ny sang
        song_name, song_data = self.get_next_song()
        self.song_history = [song_name]
        self.song_history_index = 0
        
        # Reset variabler
        self.round_time_left = ROUND_TIME
        self.has_used_skip = False
        self.game_state = GameState.PLAYING

        self.load_song(song_name)
    
    def skip_song(self):
        """Skip den aktuelle sang og load næste"""
        self.has_used_skip = True
        pygame.mixer.music.stop()
        self.is_playing = False
        
        # Hent ny sang
        song_name, song_data = self.get_next_song()
        self.song_history.append(song_name)
        self.song_history_index = 1
        self.load_song(song_name)
    
    def go_back(self):
        """Gå tilbage til forrige sang"""
        if self.has_used_skip and self.song_history_index > 0:
            self.song_history_index = 0
            pygame.mixer.music.stop()
            self.load_song(self.song_history[self.song_history_index])

    def go_forward(self):
        """Gå frem til den skippede sang igen"""
        if self.has_used_skip and self.song_history_index < len(self.song_history) - 1:
            self.song_history_index = 1
            pygame.mixer.music.stop()
            self.load_song(self.song_history[self.song_history_index])
    
    def toggle_play(self):
        """Pausér eller afspil sang"""
        if self.is_playing:
            pygame.mixer.music.pause()
            self.is_playing = False
        else:
            pygame.mixer.music.unpause()
            self.is_playing = True
    
    def end_round(self):
        """Afslut nuværende runde"""
        pygame.mixer.music.stop()
        self.is_playing = False
        self.is_dragging_progress = False
        self.game_state = GameState.ROUND_END
    
    def draw_start_screen(self):
        """Tegn startskærmen"""
        self.screen.fill(DARK_GRAY)
        
        title = self.font_large.render("MUSIK QUIZ", True, WHITE)
        title_rect = title.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 3))
        self.screen.blit(title, title_rect)
        
        self.start_button.draw(self.screen, self.font_medium)
        self.example_start_button.draw(self.screen, self.font_medium)
    
    def draw_playing_screen(self):
        """Tegn spil skærmen"""
        self.screen.fill(DARK_GRAY)
        
        # Timer
        timer_text = self.font_medium.render(
            f"Tid: {max(0, int(self.round_time_left))}s",
            True,
            RED if self.round_time_left < 10 else WHITE
        )
        self.screen.blit(timer_text, (20, 20))
        
        # Billede
        if self.current_song_image:
            img_x = SCREEN_WIDTH // 4 - 225
            img_y = SCREEN_HEIGHT // 2 - 150
            self.screen.blit(self.current_song_image, (img_x, img_y))
        
        # Sang titel
        title_text = self.font_medium.render(self.current_song_name, True, WHITE)
        title_rect = title_text.get_rect(center=(3 * SCREEN_WIDTH // 4, 100))
        self.screen.blit(title_text, title_rect)
        
        # Progress bar for sang
        if self.song_duration > 0:
            # Baggrund
            pygame.draw.rect(self.screen, GRAY, self.progress_rect)

            # Progress
            filled_width = int((self.song_position / self.song_duration) * self.progress_rect.width)
            filled_width = max(0, min(filled_width, self.progress_rect.width))
            filled_rect = pygame.Rect(
                self.progress_rect.x,
                self.progress_rect.y,
                filled_width,
                self.progress_rect.height
            )
            pygame.draw.rect(self.screen, GREEN, filled_rect)

            # Slider-håndtag
            handle_x = self.progress_rect.x + filled_width
            handle_x = max(self.progress_rect.x, min(handle_x, self.progress_rect.right))
            handle_y = self.progress_rect.centery
            pygame.draw.circle(self.screen, WHITE, (handle_x, handle_y), 10)

            # Tid display (aktuel / total)
            current_s = int(self.song_position)
            total_s = int(self.song_duration)
            time_text = self.font_small.render(
                f"{current_s // 60:02d}:{current_s % 60:02d} / {total_s // 60:02d}:{total_s % 60:02d}",
                True,
                WHITE
            )
            self.screen.blit(time_text, (self.progress_rect.x, self.progress_rect.y + 30))

        # Volume slider
        pygame.draw.rect(self.screen, GRAY, self.volume_rect)

        volume_fill_width = int(self.volume * self.volume_rect.width)
        volume_fill_rect = pygame.Rect(
            self.volume_rect.x,
            self.volume_rect.y,
            volume_fill_width,
            self.volume_rect.height
        )
        pygame.draw.rect(self.screen, BLUE, volume_fill_rect)

        volume_handle_x = self.volume_rect.x + volume_fill_width
        volume_handle_x = max(self.volume_rect.x, min(volume_handle_x, self.volume_rect.right))
        volume_handle_y = self.volume_rect.centery
        pygame.draw.circle(self.screen, WHITE, (volume_handle_x, volume_handle_y), 10)

        volume_text = self.font_small.render(
            f"Volume: {int(self.volume * 100)}%",
            True,
            WHITE
        )
        self.screen.blit(volume_text, (self.volume_rect.x, self.volume_rect.y + 30))
        
        # Knapper
        self.play_button.draw(self.screen, self.font_small)
        
        if not self.has_used_skip:
            self.skip_button.draw(self.screen, self.font_small)
        
        if self.has_used_skip and self.song_history_index > 0:
            self.back_button.draw(self.screen, self.font_small)

        if self.has_used_skip and self.song_history_index < len(self.song_history) - 1:
            self.forward_button.draw(self.screen, self.font_small)
        
        self.stop_button.draw(self.screen, self.font_small)
        
        # Afspil/Pausé status
        status = "PAUSET" if not self.is_playing else "AFSPILLER"
        status_text = self.font_small.render(status, True, GREEN if self.is_playing else RED)
        self.screen.blit(status_text, (20, SCREEN_HEIGHT - 80))
    
    def draw_round_end_screen(self):
        """Tegn end-of-round skærmen"""
        self.screen.fill(DARK_GRAY)
        
        message = self.font_large.render("RUNDE SLUTTEDE", True, WHITE)
        message_rect = message.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 3))
        self.screen.blit(message, message_rect)
        
        submessage = self.font_medium.render("Sangene var:", True, WHITE)
        submessage_rect = submessage.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 50))
        self.screen.blit(submessage, submessage_rect)
        
        # Vis sange historik
        for i, song in enumerate(self.song_history):
            song_text = self.font_small.render(f"{i + 1}. {song}", True, WHITE)
            self.screen.blit(song_text, (SCREEN_WIDTH // 2 - 300, SCREEN_HEIGHT // 2 + i * 40))
        
        self.ready_button.draw(self.screen, self.font_medium)
        self.menu_button.draw(self.screen, self.font_medium)
    
    def draw(self):
        """Tegn hele skærmen"""
        if self.game_state == GameState.START_SCREEN:
            self.draw_start_screen()
        elif self.game_state == GameState.PLAYING:
            self.draw_playing_screen()
        elif self.game_state == GameState.ROUND_END:
            self.draw_round_end_screen()
        
        pygame.display.flip()
    
    def run(self):
        """Main game loop"""
        running = True
        while running:
            running = self.handle_events()
            self.update()
            self.draw()
            self.clock.tick(FPS)
        
        pygame.quit()

if __name__ == "__main__":
    quiz = MusikQuiz()
    quiz.run()
