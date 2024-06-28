from re import T
import pyxel, sys
import numpy as np

sys.setrecursionlimit(10 ** 6)

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
                x, y = np.random.randint(10, self.width - 1), np.random.randint(10, self.height - 1)
        elif self.difficulty == 2:
            for _ in range(int(self.width * self.height * 0.1)):
                x, y = np.random.randint(1, self.width - 1), np.random.randint(1, self.height - 1)


class App:
    def __init__(self, difficulty):
        self.difficulty = difficulty + 1
        if difficulty == 2:
            self.difficulty += 1
        self.pixel_size = int(5 / self.difficulty)
        self.player_x, self.player_y = 0, 0
        if difficulty == 0:
            width, height = 30, 20
            self.goal_x, self.goal_y = 145, 95
        elif difficulty == 1:
            width, height = 75, 50
            self.goal_x, self.goal_y = 148, 98
        else:
            width, height = 150, 100
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
        next_x = self.player_x
        next_y = self.player_y

        if pyxel.btnp(pyxel.KEY_LEFT, hold=2, repeat=1):
            next_x -= move_distance
        if pyxel.btnp(pyxel.KEY_RIGHT, hold=2, repeat=1):
            next_x += move_distance
        if pyxel.btnp(pyxel.KEY_UP, hold=2, repeat=1):
            next_y -= move_distance
        if pyxel.btnp(pyxel.KEY_DOWN, hold=2, repeat=1):
            next_y += move_distance

        map_x = next_x // self.pixel_size
        map_y = next_y // self.pixel_size

        if 0 <= map_x < self.maze.shape[0] and 0 <= map_y < self.maze.shape[1] and self.maze[map_x, map_y] == 0:
            self.player_x = next_x
            self.player_y = next_y

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
        pyxel.init(150, 100, title='Maze', fps=8)
        pyxel.load("main.pyxres")
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
        pyxel.blt(10, 15, 0, 0, 0, 150, 16)
        pyxel.text(50, 40, "Select Difficulty:", 7)
        difficulties = ["Easy", "Normal", "Hard"]
        for i, difficulty in enumerate(difficulties):
            color = pyxel.COLOR_LIGHT_BLUE if i == self.difficulty else pyxel.COLOR_WHITE
            pyxel.text(50, 50 + i * 10, difficulty, color)


Start()
