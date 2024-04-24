#import "../../../lib/conf.typ": conf, come, desc, ce, light
#import "@preview/codelst:2.0.1": 
#import "@preview/pintorita:0.1.1"
#show raw.where(lang: "pintora"): it => pintorita.render(it.text)
#show: doc => conf(
  title: [情報システム 1学期中間],
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

= 序章
== 情報システムの定義

#desc("情報システムとは")[
  データ処理システム及び装置であって情報処理を行うもの。\
  事務機器、通信装置などを含む
]

#light("今までになかった")情報の処理の伝達などをおこなうプロセスを作ること。

== 情報システム開発の目的と目標

== 情報システムのライフサイクル

#image(
  "./img/1_1_1.drawio.png"
)

== 情報システムの種類とプロジェクト

*種類*

#table(
  columns: 2,

    [システム名],[説明],
    [生産管理システム],[製品の生産計画や生産ラインの管理を行うシステム],
    [原材料調達システム],[必要な原材料の調達や在庫管理を行うシステム],
    [製造管理システム],[製品の製造工程や品質管理を行うシステム],
    [在庫管理システム],[製品や資材の在庫管理を行うシステム],
    [運送管理システム],[製品の配送や物流管理を行うシステム],
    [販売管理システム],[製品の販売計画や顧客管理を行うシステム],
    [財務会計システム],[企業の財務情報や会計処理を管理するシステム]
)

#pagebreak()

*利用形態*

#image(
  "./img/1_1_2.drawio.png"
)

Government(行政)\
Business(企業)\
Consumer(個人)

G to C 住民表やパスポートの発行サービスなど\
B to G 電子入札システム \
B to B 基幹系業務システム\
B to C 通販サイト\
C to C フリマやオークション\

*プロジェクト体制図例*

```pintora
mindmap
@param layoutDirection TB
+ PM プロジェクトマネージャー
++ PL プロジェクトリーダー
+++ Aチーム リーダー
++++ A1 メンバー
++++ A2 メンバー
+++ Bチーム リーダー
++++ B1 メンバー
++++ B2 メンバー
```

#desc("QCD")[
  プロジェクトを適切に進めるために適切さを評価する指標\
  Quality(品質)\
  Cost(コスト)\
  Delivery(納期)
]

#desc("ステークホルダー")[
  利害関係者\
  プロジェクトにかかわる企業の経営者や部門の責任者、現場の利用者を指す。\
  プロジェクト内の「決定権を持つ人」の意味で用いられることもある。
]