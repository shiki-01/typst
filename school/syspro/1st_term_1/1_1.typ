#import "../../../lib/conf.typ": conf, come, desc, ce, light
#import "@preview/codelst:2.0.1": 
#import "@preview/pintorita:0.1.1"
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
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

= 情報システムの設計
== 情報システムの要求分析と定義

=== 要求分析と定義の意義

#desc("要件定義")[
  利用者側が実現したいことを明確にしてから「要件定義」として開発者側が作ろうとするものを定義する。
]

#diagram(
  node-stroke: .1pt,
  edge-stroke: .5pt,
  node((0,0), [要求分析と定義], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-1), [要件定義], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-2), [基本（外部）設計], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-3), [詳細（内部）設計], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-4), [製造（プログラム）], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-5), [テスト], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-6), [本番移行（リリース）], corner-radius: 2pt, extrude: (0, 3)),
  edge("->"),
  node((0,-7), [運用・保守], corner-radius: 2pt, extrude: (0, 3)),
)

=== 要求定義の活動

*意見交換・情報収集方法*
- 資料調査
- 観察調査
- ヒアリング

*共通理解を進める方法*
- 機能要求と非機能要求の確認
- ユースケース図の作成
- 機能改装図の作成

*要求定義に含まれるもの*
- 背景
- 課題
- 目的
- 概要
- 機能

*ユースケース図*

#table(
  columns: 2,
    [図記号],[説明],
    [ユースケース],[ユーザーがシステムに対して行う操作、機能],
    [アクター],[情報システムを利用する対象、対象の名称],
    [対象],[ユースケースを実現する対象],
)

対象内に記述されるユースケースは機能要求を表し、対象外に記述されるユースケースは非機能要求を表す。

P.18 問２

#image(
  "./img/1_1_3.drawio.svg"
)

*機能階層図*

#come("機能階層図","info")[
  情報システムが提供する機能にだけ着目し、図示するもの。
]

```pintora
mindmap
@param layoutDirection LR
+ システム名
++ 機能A
+++ 機能A1
+++ 機能A2
++ 機能B
+++ 機能B1
+++ 機能B2
```

ユースケース図において、明確になった情報システムが備えるべき機能について、さらに細分化した図を作成することができ、設計すべき情報システムのモジュールを明確にすることができる。

*要求定義*

#light[要求分析]を踏まえて#light[要求定義]を行う

#pagebreak()

*節末問題*

2

#image(
  "./img/1_1_4.drawio.svg"
)

```pintora
mindmap
@param layoutDirection LR
+ レビュー機能
++ レビュー一覧
+++ レビュー詳細
++++ リアクション
++++ 保存
+++ 検索
++++ 絞り込み
++ レビュー投稿
++++ レビュー編集
++++ 投稿の削除
```

