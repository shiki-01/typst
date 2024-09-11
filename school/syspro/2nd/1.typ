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