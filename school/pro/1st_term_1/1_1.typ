#import "../../../lib/conf.typ": conf, come, desc, ce, light
#import "@preview/codelst:2.0.1": sourcecode
#show: doc => conf(
  title: [実習 プログラミング実習 1学期中間],
  date: [2024年4月11日],
  doc,
)

#show heading: it => [
    #if it.level == 1 {
      [
        #set align(center)
        #set text(22pt)
        #pad(
          bottom: -70pt,
          [#it\ ]
        )
      ]
    } else if it.level == 2 {
      [
        #set align(left)
        #set text(18pt)
        #pad(
          top: 15pt,
          bottom: -70pt,
          [#it\ ]
        )
      ]
    } else if it.level == 3 {
      [
        #set align(left)
        #set text(15pt)
        #pad(
          bottom: -70pt,
          [#it\ ]
        )
      ]
    }
    #if it.level == 2 {line(length: 100%,stroke: rgb("#eee"))}
    #pad(bottom: -20pt, [])
    #if it.level == 3 {
      [#pad(bottom: 10pt,[])]
    } else if it.level == 2 {
      [#pad(bottom: -10pt,[])]
    }
]

= Pythonで何ができるの？

== Pythonって何だろう？

=== Pythonって何？

- 今から20年以上前につくられたプログラミング言語
- 人工知能（機械学習）やビックデータの解析などの研究によくつかわれる

=== Pythonの3つの特徴

*特徴１：シンプルなプログラム*\
プログラムの「処理のまとまり」を「インデント（字下げ）」を使って書くのが特徴

#sourcecode(
)[
  ```python
print(xxx, yyy)
if(a > b):
  print(xxx, yyy) #インデント
  print(zzz)      #インデント
def function():
  for d in list:  #インデント
    print(d)      #インデント * 2
print(xxx, yyy)
```]

*特徴２：ライブラリが豊富*\
数学モジュールや通信モジュールなどの#light[標準モジュール]以外にも、画像処理や機械学習などの#light[外部ライブラリ]といったものもある。

*特徴３：試行錯誤がしやすい*\
Pythonはプログラムを書いたらすぐに実行できる#light[インタープリタ言語]。\
試行錯誤がやりやすい言語だから、新しいものを生み出す開発者にも向いている。

それに対し、CやJavaなどは#light[コンパイラ言語]といってプログラムを実行ファイルに変換するので手間がかかるが、その分実行速度がはやいという利点がある。

#pagebreak()

= Pythonを触ってみよう

== アイドルで始めよう！
#come("IDLE（アイドル）","info")[
  手軽にPythonを実行するためのアプリ。起動すればすぐに使えるので、Pythonの動作確認をしたり初心者が勉強したりするのに向いている。
]

*命令を実行してみる*

#sourcecode[```python
# 書式 -> print()
print("値")
print("値1", "値2")
```]

#sourcecode[```python
>>> print(1 + 1)

# out -> 2
```]

*色々な演算子*
#table(
  align: center,
  columns: 2,
  table.header(
    [記号],[計算],
  ),
  [`+`],[足し算],
  [`-`],[引き算],
  [`*`],[掛け算],
  [`/`],[割り算],
  [`//`],[割り算（小数部分を切り捨て）],
  [`%`],[割り算のあまり]
)

== 文字も表示させてみよう

文字を表示するためには、#light[文字列の両側を「\`（シングルクォーテーション）」か「"（ダブルクォーテーション）」で囲んで記述する。]

#sourcecode[```python
>>> print("Hello!")

# out -> Hello!
```]

*文字列と数値の組み合わせ*

#sourcecode[```python
>>> print("答えは", 10+ 20)

# out -> 答えは 30
```]

*おみくじプログラム*

`omikuji.py`
#sourcecode[```python
import random
kuji = ["大吉", "中吉", "小吉"]
print(random.choice(kuji))

# out -> 大吉 or 中吉 or 小吉
```]

*BMI値計算プログラム*

`bmi.py`
#sourcecode[```python
h = float(input("身長何cmですか?")) / 100.0
w = float(input("体重何kgですか?"))
bmi = w / (h * h)
print("あなたのBMI1値は、", bmi, "です。")

# out -> 身長何cmですか?  171
#        体重何kgですか?  64
#        あなたのBMI値は、21.887076365377382です。
```]

== カメでお絵描きしてみよう

#sourcecode[```python
from turtle import * #turtleモジュールをインポート/読み込む
shape("turtle")      #カメの形にする
forward(100)         #100px前進
done()               #終了
```]

#image(
  width: 200pt,
  "./img/turtle1.png"
)

#sourcecode[```python
from turtle import *    #turtleモジュールをインポート/読み込む
shape("turtle")         #カメの形にする
for i in range(4):      #4回繰り返す
    forward(100)        #100px前進
    left(90)            #90度左に回転
done()
```]

#image(
  width: 200pt,
  "./img/turtle2.png"
)

#sourcecode[```python
from turtle import *                       #turtleモジュールをインポート/読み込む
shape("turtle")                                    #カメの形にする
col = ["orange", "limegreen", "gold", "plum", "tomato"]   #色のリスト
for i in range(5):                                     #5回繰り返す
    color(col[i])                                   #色を変える
    forward(200)                               #200px前進
    left(144)                              #144度左に回転
done()                               #終了
```]

#image(
  width: 200pt,
  "./img/turtle3.png"
)

#come("iについて","info")[
  `range(5) -> i`は、0から4までの5つの数字を生成する。
]

#sourcecode[```python
from turtle import *
shape("turtle")
col = ["orange", "limegreen", "gold", "plum", "tomato"]
for i in range(5):
    color(col[i])
    circle(100)
    left(72)
done()
```]

#image(
  width: 200pt,
  "./img/turtle4.png"
)

#pagebreak()

= プログラムって何ができるの？
.\

- プログラムは、どれだけ難しそうでも「順次」「分岐」「反復」の三つの組み合わせでできている。

== データは入れ物に入れて使う

#table(
  columns: 3,
  table.header(
    [分類],[データ型],[説明]
  ),
  [数値（ 整数型 ）],[int],[個数や順番に使う],
  [数値（ 浮動小数点型 ）],[float],[小数],
  [文字列型],[str],[文字（ 列 ）を扱うときに使う],
  [ブール型],[bool],[True（ 真 ）かFalse（ 偽 ）かの二択の時に使う],
)

== 文字列の操作を覚えよう

=== 文字数を調べる

#table(
  columns: 2,
  table.header(
    [メソッド],[説明]
  ),
  [`len()`],[文字列の長さを取得],
  [`count()`],[指定した文字列の出現回数を取得],
  [`find()`],[指定した文字列の位置を取得],
  [`replace()`],[指定した文字列を置換],
  [`split()`],[指定した文字列で分割],
)

=== 文字列の一部を取りだす

#table(
  columns: 2,
  table.header(
    [メソッド],[説明]
  ),
  [`[n]`],[n番目の文字を取得],
  [`[n:m]`],[n番目からm番目までの文字を取得],
  [`[n:]`],[n番目から最後までの文字を取得],
  [`[:m]`],[最初からm番目までの文字を取得],
)

#table(
  columns: 15,
  table.header(
    [こ],[ん],[に],[ち],[は],[。],[私],[は],[パ],[イ],[ソ],[ン],[で],[す],[。]
  ),
  [0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],
  [-15],[-14],[-13],[-12],[-11],[-10],[-9],[-8],[-7],[-6],[-5],[-4],[-3],[-2],[-1],
)

#sourcecode[```python
s = "こんにちは。私はパイソンです。"
print(s[0])   # こ
print(s[6:12]) # 私はパイソン
print(s[-3:])  # です。
```]

=== 文字列の途中で改行するには？

#sourcecode[```python
print("こ\nん\nに\nち\nは\n。")
```]

`\n`を使うことで、文字列の途中で改行することができる。

== データ型を変換する

=== データ型を変換する

#sourcecode[```python
a = "100"
print(a + 100) # エラー
print(int(a) + 100) # 200
```]

=== 変換できないときはエラーになる

#sourcecode[```python
a = "こんにちは"
print(int(a)) # エラー
```]

#come("書式：isinstance()","info")[
  `isinstance()`は、変数が指定したデータ型かどうかを調べる関数。
]

#sourcecode[```python
a = "100"
print(isinstance(a, int)) # False
print(isinstance(a, str)) # True
```]

== たくさんのデータはリストに入れて使う

=== リストの作り方

#sourcecode[```python
a = [1, 2, 3, 4, 5]
print(a) # [1, 2, 3, 4, 5]
```]

== もしも～なら実行する

#sourcecode[```python
a = 10
if a > 5:
    print("aは5より大きい")
else:
    print("aは5以下")
```]

#table(
  columns: 2,
  table.header(
    [比較演算子],[説明]
  ),
  [`==`],[等しい],
  [`!=`],[等しくない],
  [`>`],[より大きい],
  [`<`],[より小さい],
  [`>=`],[以上],
  [`<=`],[以下],
)

=== そうでないとき

#sourcecode[```python
a = 10
if a > 5:
    print("aは5より大きい")
elif a == 5:
    print("aは5")
else:
    print("aは5以下")
```]

== 繰り返し処理をする

*基本構造*
#sourcecode[```python
for i in range(5):
    print(i)
```]

#sourcecode[```python
a = [1, 2, 3, 4, 5]
for i in a:
    print(i)
```]


=== リストのすべての要素について繰り返す

#sourcecode[```python
a = [1, 2, 3, 4, 5]
for i in a:
    print(i)
```]