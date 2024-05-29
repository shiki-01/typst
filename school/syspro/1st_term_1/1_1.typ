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

== 情報システムのモデル化

=== システムのモデル化

#desc("モデル化")[
  データの処理の流れを図式化すること
]

例）
- データフロー図（Data Flow Diagram: DFD）
- 実体関連図（Entity Relationship Diagram: ERD）
- 状態遷移図

=== データフロー図（DFD）

#desc("DFD")[
  データの流れを図式化したもの。主に#light[データフロー]、#light[データストア]、#light[外部実体]、#light[プロセス]の４つの図記号を使って表現される。
]

#table(
  columns: 3,
    [名前],[図記号],[説明],
    [データフロー],
    [
      #diagram(
        node-stroke: .1pt,
        edge-stroke: .5pt,
        edge("-|>"),
        )
    ],
    [データの流れを表す],
    [データストア],
    [
      #diagram(
        node-stroke: .1pt,
        edge-stroke: .5pt,
        node((0,0), [データストア], corner-radius: 2pt, extrude: (0, 3))
        )
    ],
    [データの保管場所を表す],
    [外部実体],
    [
      #diagram(
        node-stroke: .1pt,
        edge-stroke: .5pt,
        edge("-|>"),
        node((0,0), [外部実体],stroke:auto, corner-radius: 2pt, extrude: (0, 3))
        )
    ],
    [システム外部のデータの流れを表す],
    [プロセス],
    [
      #diagram(
        node-stroke: .1pt,
        edge-stroke: .5pt,
        node((0,0), [プロセス], corner-radius: 2pt, extrude: (0, 3),radius: 2em)
        )
    ],
    [データの加工を表す],
)

#pagebreak()

例）図書管理システムにおける「図書の予約」のデータフロー図

#table(
  columns: 2,
  table.cell(
    align: center,
    colspan: 2
  )[図書の予約],
  [外部実体（発生源、出力先）],[利用者],
  [データフロー],[予約申請情報、返却情報、予約情報、在庫情報、貸出案内、利用者情報],
  [データストア],[利用者台帳、貸出台帳、蔵書台帳],
  [プロセス],[予約],
)

#image(
  "./img/1_1_5.drawio.svg"
)

例）図書管理システムにおける「新規図書の購入」のデータフロー図

#table(
  columns: 2,
  table.cell(
    align: center,
    colspan: 2
  )[新規図書の購入],
  [外部実体（発生源、出力先）],[図書館職員],
  [データフロー],[購入リスト、購入候補図書],
  [データストア],[購入図書候補台帳],
  [プロセス],[図書購入],
)

#pagebreak()

#table(
  columns: 2,
  table.cell(
    align: center,
    colspan: 2
  )[図書の検索],
  [外部実体（発生源、出力先）],[利用者],
  [データフロー],[書籍名・著者名、在庫情報、登録なし（在庫登録なし）],
  [データストア],[蔵書台帳、購入図書候補台帳],
  [プロセス],[検索],
)

#table(
  columns: 2,
  table.cell(
    align: center,
    colspan: 2
  )[図書の予約],
  [外部実体（発生源、出力先）],[利用者],
  [データフロー],[予約申請情報、返却情報、予約情報、在庫情報、貸出情報、登録なし（在庫登録なし）、利用者情報],
  [データストア],[利用者台帳、貸出台帳、蔵書台帳],
  [プロセス],[予約],
)

#image(
  "./img/1_1_6.drawio.svg"
)

#pagebreak()

#desc("実体関連図(ERD)")[
  データ構造を実体（エンティティ）とその間の関係（リレーションシップ）で表現したもの。
]

#table(
  columns: 2,
  [名前],[説明],
  [実体],[データのまとまりを表す。記号の中に実体名を記述する。],
  [関連],[実体同士の関連を示す。記号の中に関連名を記述する。],
  [属性],[実体が持つ属性情報を表す。記号の中に実体名と属性情報を記述する],
  [カーディナリティ],[関連情報の詳細を表す。],
)

#table(
  columns: 2,
  [名前],[説明],
  [1 : 1],[ひとつのAに対してBは一つ存在し、逆に一つのBに対してAが存在する関係を表す],
  [1 : n],[ひとつのAに対して複数のBが存在し、逆に一つのBに対してAが存在する関係を表す],
  [n : m],[複数のAに対して複数のBが存在する関係を表す],
)

*現行の図書管理システムにおける実体関連図を作成する*

1. 実体と関連を洗い出す
2. 実体と関連のカーディナリティを洗い出す
3. 実体の属性を洗い出す

#table(
  columns: 2,
  [実体],[関連],
  table.cell(
    rowspan: 2
  )[利用者と図書],[貸出],[返却],
  [図書館職員と図書],[登録],
)

#pagebreak()

p31 問５

- ひとつの実体Cに対して実体Bは複数存在し、逆に複数の実体Bに対しては実体Cが一つしか存在しない。実体Cと実体Bの関連は「関連b」とする。
- 複数の実体Aに対して実体Cは複数存在し、逆に複数の実体Cに対しても実体Aは複数存在する。実体Aと実体Cの関連は「関連a」とする。

#image(
  "./img/1_1_7.drawio.svg"
)

p36 ③

次の実体関連図について、それぞれの実体と関連がどのようになっているか説明しなさい。

#image(
  "./img/1_1_8.drawio.svg"
)

- ひとつの実体Aに対して実体Bは複数存在し、逆に複数の実体Bに対して実体Aは一つしか存在しない。実体Aと実体Bの館関連は「関連a」とする
- ひとつの実体Bに対して実体Cは複数存在し、逆に複数の実体Cに対しても実体Bは複数存在する。実体Bと実体Cの関連は「関連b」とする
- ひとつの実体Cに対して実体Aはひとつだけ存在し、逆にひとつの実体Aに対しても実体Cはひとつだけ存在する。実体Cと実体Aの関連は「関連c」とする

#desc("状態遷移図")[
  システムの状態遷移を表す図。状態の移り変わるきっかけ（イベント）とその時に実行する動作（アクティビティ）を合わせて表現する。主に#light[状態]、#light[遷移]、#light[開始状態]、#light[終了状態]の４つの図記号を使って表現される。
]

#table(
  columns: 3,
  [名前],[図記号],[意味],
  [状態],
  [
    #diagram(
      node-stroke: .1pt,
      edge-stroke: .5pt,
      node((0,0), [状態], corner-radius: 2pt, extrude: (0, 3))
      )
  ],[開始状態、終了状態、状態],
  [遷移],
  [
    #diagram(
      node-stroke: .1pt,
      edge-stroke: .5pt,
      edge("-|>"),
      )
  ],
  [状態間の移り変わりを表す],
  [開始状態],
  [
    ●
  ],
  [状態遷移図の開始を表す],
  [終了状態],
  [
    ⦿
  ],
  [状態遷移図の終了を表す],
)

状態遷移表を作成することによって、情報システムの設計を進めるときに、テストの段階などで修正のリスクを回避することができる。

p36 問６

「図書の検索」処理の端末における入出力時のメニュー画面の状態遷移図を「状態」「遷移（イベント / アクティビティ）」を考えて作成しなさい。

#image(
  "./img/1_1_9.drawio.svg"
)