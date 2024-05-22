namae = input("主人公のなまえを入力してください: ")
print("*****", namae, "の冒険*****")

miti = int(input("お城をでた。どっちに進む？(1: ひだり, 2: みぎ, 3: まえ)"))
if miti == 1:
    print("敵が現れた！")
    teki = int(input("戦う？(1: はい, 2: いいえ)"))
    if teki == 1:
        print("戦うための武器を持っていない！")
        print(namae, "は10のダメージをうけた")
    else:
        print("無事に逃げ切れた")
elif miti == 2:
    print(namae, "は武器屋にたどり着いた")
    print("武器を購入した")
else:
    print("家に帰った")

print("次の日・・・")
print("今日はなにをしようかな？ (1: ご飯を食べる, 2: 町にでかける, 3: 森で戦う) ")
niti = int(input())
if niti == 1:
    print("ご飯を食べた")
elif niti == 2:
    print("町にでかけた")
else:
    print("森に行った")
    print("敵が現れた！")
    teki = int(input("戦う？(1: はい, 2: いいえ)"))
    if teki == 1:
        tekiHP = 10
        while tekiHP > 0:
            print("敵のHP: ", tekiHP)
            print("攻撃する？(1: はい, 2: いいえ)")
            atk = int(input("どれだけ攻撃する？(1~5)"))
            tekiHP -= atk
        print("敵を倒した！")
    else:
        print("無事に逃げ切れた")
print("冒険終了！")