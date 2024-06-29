from re import T
import pyxel, sys
import numpy as np

sys.setrecursionlimit(10 ** 6)

class MazeGenerator:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.maze = np.ones((width, height), dtype=np.int8)

    def generate_maze(self, x=0, y=0):
        directions = [(0, -2), (2, 0), (0, 2), (-2, 0)]
        np.random.shuffle(directions)
        for dx, dy in directions:
            nx, ny = x + dx, y + dy
            if 0 <= nx < self.width and 0 <= ny < self.height and self.maze[nx, ny]:
                self.maze[nx - dx // 2, ny - dy // 2] = 0
                self.maze[nx, ny] = 0


class GoalScreen:
    def __init__(self):
        pyxel.load("main.pyxres")
        pyxel.run(self.update, self.draw)

    def update(self):
        if pyxel.btnp(pyxel.KEY_SPACE):
            dificulty = 0
            Start()

    def draw(self):
        pyxel.cls(0)
        pyxel.blt(10, 10, 0, 0, 0, 150, 16)
        pyxel.text(25, 40, "Congratulations!", pyxel.frame_count % 16)
        pyxel.text(25, 50, "You have reached the goal!", 7)
        pyxel.text(25, 80, "Press SPACE to restart", 7)


class App:
    def __init__(self,):
        difficulty = difficulty + 1
        if difficulty == 2:
            difficulty += 1
        self.pixel_size = int(5 / difficulty)
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

        if self.player_x == self.goal_x and self.player_y == self.goal_y:
            GoalScreen()

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
        pyxel.load("main.pyxres")
        difficulty = 0
        pyxel.run(self.update_difficulty, self.draw_difficulty)

    def update_difficulty(self):
        if pyxel.btnp(pyxel.KEY_UP) and difficulty > 0:
            difficulty -= 1
        if pyxel.btnp(pyxel.KEY_DOWN) and difficulty < 2:
            difficulty += 1
        if pyxel.btnp(pyxel.KEY_SPACE):
            App(difficulty)

    def draw_difficulty(self):
        pyxel.cls(0)
        pyxel.blt(10, 15, 0, 0, 0, 150, 16)
        pyxel.text(35, 40, "Select Difficulty:", 7)
        difficulties = ["Easy", "Normal", "Hard"]
        for i, Fdifficulty in enumerate(difficulties):
            color = pyxel.COLOR_LIGHT_BLUE if i == Fdifficulty else pyxel.COLOR_WHITE
            pyxel.text(50, 50 + i * 10, Fdifficulty, color)



pyxel.init(150, 100, title='Maze', fps=8)
global difficulty
Start()