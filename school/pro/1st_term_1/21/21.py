import pyxel

class App:
    def __init__(self):
        pyxel.init(288, 304, title="Dot Picture")
        self.canvas = [[0 for _ in range(16)] for _ in range(16)]
        self.current_color = 7
        pyxel.mouse(True)
        pyxel.load("main.pyxres")
        pyxel.run(self.update, self.draw)

    def update(self):
        if pyxel.btnp(pyxel.MOUSE_BUTTON_LEFT):
            x = (pyxel.mouse_x // 16) - 1
            y = (pyxel.mouse_y // 16) - 1

            if 0 <= x < 16 and 0 <= y < 16:
                self.canvas[y][x] = self.current_color
            elif x < 15 and y == 17:
                self.current_color = x + 1
            elif x == 16 and y == 16:
                self.save_canvas()
            elif x == 16 and y == 17:
                self.load_canvas()
            elif x == 15 and y == 17:
                self.clear_canvas()

    def save_canvas(self):
        with open('dot_picture.txt', 'w') as f:
            for row in self.canvas:
                f.write(' '.join(map(str, row)) + '\n')

    def load_canvas(self):
        try:
            with open('dot_picture.txt', 'r') as f:
                for y, line in enumerate(f):
                    self.canvas[y] = list(map(int, line.strip().split(' ')))
        except FileNotFoundError:
            print("File not found.")

    def clear_canvas(self):
        self.canvas = [[0 for _ in range(16)] for _ in range(16)]

    def draw(self):
        pyxel.cls(1)
        for j, row in enumerate(self.canvas):
            for i, col in enumerate(row):
                pyxel.rect(i * 16 + 16, j * 16 + 16, 16, 16, col)
        for i in range(16):
            pyxel.rect(i * 16, 256 + 32, 16, 16, i)
        pyxel.blt(272, 256 + 16, 0, 16, 0, 16, 16, 0)
        pyxel.blt(272, 256 + 32, 0, 32, 0, 16, 16, 0)
        pyxel.blt(256, 256 + 32, 0, 48, 0, 16, 16, 0)
        pyxel.blt(self.current_color * 16, 256 + 32, 0, 0, 0, 16, 16, 0)

App()