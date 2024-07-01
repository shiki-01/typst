import pyxel
import calendar
import datetime

class App:
    def __init__(self):
        pyxel.init(160, 120)
        self.year = datetime.datetime.now().year
        self.month = datetime.datetime.now().month
        self.calendar_month = calendar.month(self.year, self.month).split('\n')
        self.color_selection = {}
        pyxel.mouse(True)

        pyxel.run(self.update, self.draw)

    def update(self):
        if pyxel.btnp(pyxel.KEY_LEFT) or (pyxel.btnp(pyxel.MOUSE_BUTTON_LEFT) and 10 <= pyxel.mouse_x <= 20 and 100 <= pyxel.mouse_y <= 110):
            self.month -= 1
            if self.month < 1:
                self.month = 12
                self.year -= 1
            self.calendar_month = calendar.month(self.year, self.month).split('\n')
        elif pyxel.btnp(pyxel.KEY_RIGHT) or (pyxel.btnp(pyxel.MOUSE_BUTTON_LEFT) and 130 <= pyxel.mouse_x <= 140 and 100 <= pyxel.mouse_y <= 110):
            self.month += 1
            if self.month > 12:
                self.month = 1
                self.year += 1
            self.calendar_month = calendar.month(self.year, self.month).split('\n')
        elif pyxel.btnp(pyxel.MOUSE_BUTTON_LEFT):
            if 40 <= pyxel.mouse_x <= 100 and 20 <= pyxel.mouse_y <= 60:
                pass

    def draw(self):
        pyxel.cls(7)
        y = 20
        for line in self.calendar_month:
            pyxel.text(40, y, line, 5)
            y += 8

        pyxel.rect(10, 100, 10, 10, 1)
        pyxel.text(13, 102, "<", 7)

        pyxel.rect(130, 100, 10, 10, 1)
        pyxel.text(134, 102, ">", 7)

App()