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

#sourcecode[```python
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