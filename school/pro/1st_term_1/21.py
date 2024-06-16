import os
import platform
import random
import time
import keyboard

def clear_terminal():
    if platform.system() == "Windows":
        os.system('cls')
    else:
        os.system('clear')

COLOR_MAP = {
    'R': '\033[91m●\033[0m',
    'G': '\033[92m●\033[0m',
    'B': '\033[94m●\033[0m',
    'Y': '\033[93m●\033[0m',
    None: ' '
}

ORIENTATIONS = [
    'up',
    'right',
    'down',
    'left'
]

BOARD_WIDTH = 6
BOARD_HEIGHT = 12

class PuyoPuyo:
    def __init__(self):
        self.board = [[None] * BOARD_WIDTH for _ in range(BOARD_HEIGHT)]
        self.fixed_puyos = [[None] * BOARD_WIDTH for _ in range(BOARD_HEIGHT)]
        self.current_puyo = None
        self.next_puyo()

    def next_puyo(self):
        self.current_puyo = {
            'position': [BOARD_HEIGHT - 1, BOARD_WIDTH // 2 - 1],
            'orientation': 'up',
            'colors': [random.choice(['R', 'G', 'B', 'Y']), random.choice(['R', 'G', 'B', 'Y'])]
        }
        self.update_board()

    def update_board(self):
        self.clear_board()
        row, column = self.current_puyo['position']
        if 0 <= row < BOARD_HEIGHT and 0 <= column < BOARD_WIDTH:
            self.board[row][column] = COLOR_MAP[self.current_puyo['colors'][0]]
            if self.current_puyo['orientation'] == 'up':
                self.board[row-1][column] = COLOR_MAP[self.current_puyo['colors'][1]]
            elif self.current_puyo['orientation'] == 'down':
                self.board[row-1][column] = COLOR_MAP[self.current_puyo['colors'][1]]
            elif self.current_puyo['orientation'] == 'left':
                self.board[row][column-1] = COLOR_MAP[self.current_puyo['colors'][1]]
            elif self.current_puyo['orientation'] == 'right':
                self.board[row][column+1] = COLOR_MAP[self.current_puyo['colors'][1]]
        self.merge_boards()

    def merge_boards(self):
        for i in range(BOARD_HEIGHT):
            for j in range(BOARD_WIDTH):
                if self.fixed_puyos[i][j] is not None:
                    self.board[i][j] = self.fixed_puyos[i][j]

    def clear_board(self):
        for row in range(BOARD_HEIGHT):
            for column in range(BOARD_WIDTH):
                if self.board[row][column] in COLOR_MAP.values() and (row, column) != tuple(self.current_puyo['position']):
                    self.board[row][column] = None

    def drop(self):
        old_row, old_column = self.current_puyo['position']
        if 0 <= old_row < BOARD_HEIGHT and 0 <= old_column < BOARD_WIDTH:
            if self.current_puyo['orientation'] == 'up' or self.current_puyo['orientation'] == 'down':
                if old_row > 1 and self.board[old_row-2][old_column] is None:
                    self.current_puyo['position'][0] -= 1
                    self.update_board()
                    return True
            elif self.current_puyo['orientation'] == 'left':
                if old_row > 0 and self.board[old_row-1][old_column] is None and self.board[old_row-1][old_column-1] is None:
                    self.current_puyo['position'][0] -= 1
                    self.update_board()
                    return True
            elif self.current_puyo['orientation'] == 'right':
                if old_row > 0 and self.board[old_row-1][old_column] is None and self.board[old_row-1][old_column+1] is None:
                    self.current_puyo['position'][0] -= 1
                    self.update_board()
                    return True
        return self.handle_drop_failure()

    def fix_current_puyo(self):
        row, column = self.current_puyo['position']
        self.fixed_puyos[row][column] = COLOR_MAP[self.current_puyo['colors'][0]]
        if self.current_puyo['orientation'] == 'up' or self.current_puyo['orientation'] == 'down':
            self.fixed_puyos[row-1][column] = COLOR_MAP[self.current_puyo['colors'][1]]
        elif self.current_puyo['orientation'] == 'left':
            self.fixed_puyos[row][column-1] = COLOR_MAP[self.current_puyo['colors'][1]]
        elif self.current_puyo['orientation'] == 'right':
            self.fixed_puyos[row][column+1] = COLOR_MAP[self.current_puyo['colors'][1]]
        self.drop_all_puyos()

    def drop_all_puyos(self):
        dropped = True
        while dropped:
            dropped = False
            for row in range(1, BOARD_HEIGHT):
                for column in range(BOARD_WIDTH):
                    if self.fixed_puyos[row][column] is not None and self.fixed_puyos[row-1][column] is None:
                        self.fixed_puyos[row-1][column] = self.fixed_puyos[row][column]
                        self.fixed_puyos[row][column] = None
                        dropped = True
                        self.update_board()
                        self.print_board()
                        time.sleep(0.1)
        self.remove_matched()
        self.update_board()

    def remove_matched(self):
        visited = [[False]*BOARD_WIDTH for _ in range(BOARD_HEIGHT)]
        for row in range(BOARD_HEIGHT):
            for column in range(BOARD_WIDTH):
                if self.fixed_puyos[row][column] is not None and not visited[row][column]:
                    stack = [(row, column)]
                    puyo_group = []
                    while stack:
                        current_row, current_column = stack.pop()
                        if not visited[current_row][current_column] and self.fixed_puyos[current_row][current_column] == self.fixed_puyos[row][column]:
                            visited[current_row][current_column] = True
                            puyo_group.append((current_row, current_column))
                            for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                                next_row, next_column = current_row + dr, current_column + dc
                                if 0 <= next_row < BOARD_HEIGHT and 0 <= next_column < BOARD_WIDTH:
                                    stack.append((next_row, next_column))
                    if len(puyo_group) >= 4:
                        for puyo_row, puyo_column in puyo_group:
                            self.fixed_puyos[puyo_row][puyo_column] = None
                        self.drop_all_puyos()

    def handle_drop_failure(self):
        self.fix_current_puyo()
        self.remove_matched()
        if self.current_puyo['position'][0] >= BOARD_HEIGHT - 1:
            print("Game Over")
            return "GameOver"
        else:
            self.next_puyo()
            return False

    def move_left(self):
        old_row, old_column = self.current_puyo['position']
        if old_column > 0 and self.board[old_row][old_column-1] is None:
            self.current_puyo['position'][1] -= 1
            self.update_board()

    def move_right(self):
        old_row, old_column = self.current_puyo['position']
        if old_column < BOARD_WIDTH - 1 and self.board[old_row][old_column+1] is None:
            self.current_puyo['position'][1] += 1
            self.update_board()

    def rotate_puyo(self, direction):
        old_row, old_column = self.current_puyo['position']
        old_orientation = self.current_puyo['orientation']
        old_index = ORIENTATIONS.index(old_orientation)

        if direction == 'right':
            new_index = (old_index + 1) % 4
        else:
            new_index = (old_index - 1) % 4

        new_orientation = ORIENTATIONS[new_index]

        can_rotate = self.check_rotation_feasibility(new_orientation, old_row, old_column)
        if can_rotate:
            self.current_puyo['orientation'] = new_orientation
            self.update_board()

    def check_rotation_feasibility(self, new_orientation, old_row, old_column):
        if new_orientation == 'left':
            return (0 <= old_column - 1 < BOARD_WIDTH) and (self.board[old_row][old_column - 1] is None)
        elif new_orientation == 'right':
            return (0 <= old_column + 1 < BOARD_WIDTH) and (self.board[old_row][old_column + 1] is None)
        elif new_orientation == 'up':
            return (0 <= old_row + 1 < BOARD_HEIGHT) and (self.board[old_row + 1][old_column] is None)
        elif new_orientation == 'down':
            return (0 <= old_row - 1 < BOARD_HEIGHT) and (self.board[old_row - 1][old_column] is None)


    def print_board(self):
        clear_terminal()
        top_border = '┌─' + '─'*(BOARD_WIDTH * 2 - 1) + '─┐'
        bottom_border = '└─' + '─'*(BOARD_WIDTH * 2 - 1) + '─┘'
        print(top_border)
        for row in self.board[::-1]:
            row_content = [' ' if cell is None else cell for cell in row]
            row_str = '│ ' + ' '.join(row_content) + ' │'
            print(row_str)
        print(bottom_border)
clear_terminal()
game = PuyoPuyo()

while True:
    game.print_board()
    while True:
        result = game.drop()
        if result == "GameOver":
            print("Game Over")
            break
        if keyboard.is_pressed('left'):
            game.move_left()
        elif keyboard.is_pressed('right'):
            game.move_right()
        elif keyboard.is_pressed('a'):
            game.rotate_puyo('left')
        elif keyboard.is_pressed('d'):
            game.rotate_puyo('right')
        elif keyboard.is_pressed('q'):
            result = "Quit"
            break

        game.print_board()
        if keyboard.is_pressed('down'):
            time.sleep(0.1)
        else:
            time.sleep(0.5)

    if result == "GameOver" or result == "Quit":
        break