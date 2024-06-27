import pyxel
import numpy as np

class MazeGenerator:
    def __init__(self, width, height, difficulty):
        self.width = width
        self.height = height
        self.difficulty = difficulty
        self.maze = np.ones((width, height), dtype=np.int8)

    def generate_maze(self, x=0, y=0):
        directions = [(0, -2), (2, 0), (0, 2), (-2, 0)]
        np.random.shuffle(directions)
        for dx, dy in directions:
            nx, ny = x + dx, y + dy
            if 0 <= nx < self.width and 0 <= ny < self.height and self.maze[nx, ny]:
                self.maze[nx - dx // 2, ny - dy // 2] = 0
                self.maze[nx, ny] = 0
                self.generate_maze(nx, ny)

        self.adjust_maze_complexity()

    def adjust_maze_complexity(self):
        if self.difficulty == 0:
            for _ in range(int(self.width * self.height * 0.07)):
                x, y = np.random.randint(1, self.width - 1, size=2)
                if self.maze[x, y] == 1:
                    self.maze[x, y] = 0
        elif self.difficulty == 2:
            for _ in range(int(self.width * self.height * 0.15)):
                x, y = np.random.randint(1, self.width - 1, size=2)
                if self.maze[x, y] == 0:
                    self.maze[x, y] = 1

class App:
    def __init__(self, difficulty):
        self.difficulty = difficulty
        self.pixel_size = 5 + 1 * difficulty
        self.player_x, self.player_y = 0, 0
        if difficulty == 0:
            width, height = 30, 20
            self.goal_x, self.goal_y = 145, 95
        elif difficulty == 1:
            width, height = 40, 30
            self.goal_x, self.goal_y = 195, 145
        else:
            width, height = 50, 40
            self.goal_x, self.goal_y = 245, 195

        generator = MazeGenerator(width, height, difficulty)
        generator.generate_maze()
        self.maze = generator.maze
        self.maze[0][0] = 0
        self.maze[-2][-1] = 0
        self.maze[-1][-1] = 0
        pyxel.run(self.update, self.draw)

    def update(self):
        move_distance = self.pixel_size
        if pyxel.btnp(pyxel.KEY_LEFT) and self.player_x >= move_distance and self.maze[(self.player_x - move_distance) // move_distance, self.player_y // move_distance] == 0:
            self.player_x -= move_distance
        if pyxel.btnp(pyxel.KEY_RIGHT) and self.player_x <= pyxel.width - move_distance and self.maze[(self.player_x + move_distance) // move_distance, self.player_y // move_distance] == 0:
            self.player_x += move_distance
        if pyxel.btnp(pyxel.KEY_UP) and self.player_y >= move_distance and self.maze[self.player_x // move_distance, (self.player_y - move_distance) // move_distance] == 0:
            self.player_y -= move_distance
        if pyxel.btnp(pyxel.KEY_DOWN) and self.player_y <= pyxel.height - move_distance and self.maze[self.player_x // move_distance, (self.player_y + move_distance) // move_distance] == 0:
            self.player_y += move_distance

    def draw(self):
        pyxel.cls(0)
        pixel_size = self.pixel_size
        for y in range(self.maze.shape[1]):
            for x in range(self.maze.shape[0]):
                if self.maze[x, y] == 1:
                    pyxel.rect(x * pixel_size, y * pixel_size, pixel_size, pixel_size, 8)
        pyxel.rect(self.player_x, self.player_y, pixel_size, pixel_size, 10)
        pyxel.rect(self.goal_x, self.goal_y, pixel_size, pixel_size, 14)

class Start:
    def __init__(self):
        pyxel.init(150, 100, title='Maze')
        self.difficulty = 0
        pyxel.run(self.update_difficulty, self.draw_difficulty)

    def update_difficulty(self):
        if pyxel.btnp(pyxel.KEY_UP) and self.difficulty > 0:
            self.difficulty -= 1
        if pyxel.btnp(pyxel.KEY_DOWN) and self.difficulty < 2:
            self.difficulty += 1
        if pyxel.btnp(pyxel.KEY_SPACE):
            App(self.difficulty)

    def draw_difficulty(self):
        pyxel.cls(0)
        pyxel.text(50, 40, "Select Difficulty:", 7)
        difficulties = ["Easy", "Normal", "Hard"]
        for i, difficulty in enumerate(difficulties):
            color = pyxel.COLOR_LIGHT_BLUE if i == self.difficulty else pyxel.COLOR_WHITE
            pyxel.text(50, 50 + i * 10, difficulty, color)

Start()
