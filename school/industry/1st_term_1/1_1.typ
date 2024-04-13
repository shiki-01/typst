#import "../../../lib/conf.typ": conf, come, desc
#import "@preview/codelst:2.0.1": sourcecode
#show: doc => conf(
  title: [情報産業と社会 1学期中間],
  date: [2024年4月11日],
  doc,
)

= 情報産業と社会
== 4章 1節「コンピュータの仕組み」

*ハードウェア*

#image("1_1_1.drawio.svg")

#table(
  columns: 2,
  table.header(
    [名前],[説明]
  ),
  [プログラムカウンタ],	[次に実行する命令が入ってくる番地を記憶しておくレジスタ],
  [命令レジスタ],[],
  [命令デコーダ],[],
  [汎用レジスタ]
)
#desc("レジスタ")[
  一時的に記憶する装置
]

#come("単位一覧","info")[
  - $"8bit"$ = $"1B"$\
  - $"1GHz"$($10^9$) = $"1ns"$
  - $"1MIPS"$ = $"1,000,000回/秒"$
]