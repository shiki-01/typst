#import "../../../lib/conf.typ": conf, come, desc, ce, light
#import "@preview/codelst:2.0.1": 
#import "@preview/pintorita:0.1.1"
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#show raw.where(lang: "pintora"): it => pintorita.render(it.text)
#show: doc => conf(
  title: [情報システム 2学期],
  date: [2024年9月11日],
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
    } else {
      [#pad(
        top: 10pt, bottom: 5pt,
        [#it ]
      )]
    }
    #if it.level == 2 {line(length: 100%,stroke: rgb("#eee"))}
    #pad(bottom: -20pt, [])
    #if it.level == 3 {
      [#pad(bottom: 10pt,[])]
    } else if it.level == 2 {
      [#pad(bottom: -10pt,[])]
    }
]

= データ構造とアルゴリズム
== データの、型と列データ

=== 基本的なデータ型

==== 論理型

#table(
  columns: 8,
  table.cell(colspan: 2, align: center)[否定],
  table.cell(colspan: 3, align: center)[論理積],
  table.cell(colspan: 3, align: center)[論理和],
  [X],[NOT X],[X],[Y],[X AND Y],[X],[Y],[X OR Y],
  [偽],[真],[偽],[偽],[偽],[偽],[偽],[偽],
  [真],[偽],[偽],[真],[偽],[真],[偽],[真],
  [],  [],  [真],[偽],[偽],[真],[偽],[真],
  [],  [],  [真],[真],[真],[真],[真],[真],
)

==== 文字列型

#desc("Unicode")[
  文字をコンピュータで扱うための標準規格。\
  世界で使われる多くの文字を扱えるように策定されている Unicode が、文字集合（文字コード）として広く採用されている。
]

==== 数値型

- 実数型は、#light[浮動小数点数]で表現される。
- 2進法で限られたビット数によって表現するため、表現できる数値の範囲が限られる。

#pagebreak()

=== 文字列

#desc("文字列")[
  文字を一列に並べたもの。\
  文字列は、文字の配列として扱われることが多い。
]

#table(
  columns: 8,
  [C],[o],[m],[p],[u],[t],[e],[r],
  [0],[1],[2],[3],[4],[5],[6],[7],
)

#desc("文字列の長さ")[
  文字列の長さは、文字列に含まれる文字の数で表現される。\
  例えば、"Computer" は 8 文字の長さを持つ。\
  このとき、先頭の文字の添字は 0 であり、これを 0-origin という。
]

```python
>>> s = 'Computer'
>>> s
'Computer'

>>> s[2]
'm'

>>> type('AAA')
<class 'str'>
```

==== 2 つの文字列の連結

```python
>>> 'ABC' + 'DEF'
'ABCDEF'
```

==== 2 つの文字列の比較

```python
>>> 'ABC' < 'ABE' # 小さい方が先
True

>>> 'AB' < 'ABA'  # 長い方が大きい
True
```

==== 部分文字列の取得

```python
>>> 'ABCDEF'[2:4]
'CD'

>>> s = 'ABCDEF'
>>> s[2:4]
'CD'
```

=== 列データ構造

データ構造とはデータの集まりをコンピュータの中で効果的に扱うための形式のこと。

==== リスト

- リストは、複数のデータをまとめて扱うためのデータ構造。
- リストの要素は、インデックスを使ってアクセスできる。

==== 配列

- 配列は、同じ型のデータを連続したメモリ領域に格納するデータ構造。
- 配列の要素は、インデックスを使ってアクセスできる。

==== スタック

- スタックは、データを一時的に保存するためのデータ構造。
- データの追加や削除は、常に一方向から行われる。

```python
>>> data = [4, 1, 7, 3, 2]
>>> data.append(8)

>>> data
[4, 1, 7, 3, 2, 8]

>>> data[-1]
8

>>> data.pop()
8

>>> data
[4, 1, 7, 3, 2]
```

==== キュー

- キューは、データを一時的に保存するためのデータ構造。
- データの追加は一方向から行い、削除は反対方向から行う。


```python
>>> from collections import deque
>>> data = deque([4, 1, 7, 3, 2])

>>> data
deque([4, 1, 7, 3, 2])

>>> data.popleft()
4

>>> data
deque([1, 7, 3, 2])

>>> data.append(5)
>>> data
deque([1, 7, 3, 2, 5])

>>> data.appendleft(6)
>>> data
deque([6, 1, 7, 3, 2, 5])
```

=== レコード型と連想配列

==== レコード型

- レコード型は、複数のデータをまとめて扱うためのデータ構造。
- レコード型の要素は、フィールドと呼ばれる。

`フィールド名：値` の形式でデータを表現する。

==== 連想配列

- 連想配列は、キーと値のペアを格納するデータ構造。
- キーを使って値にアクセスできる。

`キー：値` の形式でデータを表現する。

\

P.62 問 6

図書館で貸し出す本をレコード型で合わすとすると、どのようなフィールドが昼用になるか考えてみよう。図書館を利用する人の情報をレコード型で表すとすると、どのようなフィールドが必要になるか考えてみよう。

#grid(
  columns: 2,
  gutter: 10em,
  [
    *貸し出す本*
    #table(
      columns: 2,
      [フィールド名],[型],
      [タイトル],[文字列],
      [著者],[文字列],
      [出版社],[文字列],
      [出版年],[整数],
      [貸出状況],[論理型],
    )
  ],
  [
    *利用者*
    #table(
      columns: 2,
      [フィールド名],[型],
      [氏名],[文字列],
      [住所],[文字列],
      [電話番号],[文字列],
      [貸出中],[リスト],
    )
  ]
)