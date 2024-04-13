#import "../../lib/conf.typ": conf, come, desc
#import "@preview/codelst:2.0.1": sourcecode
#show: doc => conf(
  title: [化学基礎 1学期中間],
  date: [2024年4月11日],
  doc,
)

= 中学校の復習

#grid(
  columns: (2fr, 1fr),
  column-gutter: 10pt,
  [
    *元素名⇄元素記号*

#table(  
  columns: 3,
  table.header(
    [元素名],[元素記号],[注意]
  ),
  [塩素],[Cl],[$"Cl"$ ※$"cl"$、$"C1"$と間違えない],
  [ナトリウム],[Na],[],
  [マグネシウム],[Mg],[],
  [カルシウム],[Ca],[],
  [鉄],[Fe],[],
  [亜鉛],[Mg],[],
  [銀],[Ag],[],
  [水素],[H],[],
  [酸素],[O],[],
  [窒素],[N],[],
  [炭素],[C],[],
  [硫黄],[S],[],
  [アルミニウム],[Al],[$"Al"$ ※$"A1"$と間違えない],
  [カリウム],[K],[],
  [銅],[Cu],[],
  [ナトリウムイオン],[Na#super([+])],[],
  [銅（Ⅱ）イオン],[Cu#super([2+])],[],
  [水酸化物イオン],[OH#super([-])],[],
  [塩化物イオン],[Cl#super([-])],[],
  [水素イオン],[H#super([+])],[],
)
  ],
  [
    *物質名⇄化学式*

#table(
  columns: 2,
  table.header(
    [元素名],[元素記号],
  ),
  [塩素],[Cl#sub([2])],
  [水素],[H#sub([2])],
  [二酸化炭素],[CO#sub([2])],
  [アンモニア],[NH#sub([3])],
  [塩化ナトリウム],[NaCl],
  [酸素],[O#sub([2])],
  [硫化鉄（Ⅱ）],[FeS],
  [水酸化ナトリウム],[NaHO],
  [窒素],[N#sub([2])],
  [硫化銅（Ⅱ）],[CuS],
  [酸化マグネシウム],[MgO],
  [酸化銅（Ⅱ）],[CuO],
  [塩化銅（Ⅱ）],[CuCl#sub([2])],
  [水],[H#sub([2])O],
  [塩化水素],[HCl],
)
  ]
)

#counter(heading).update( 0 )
= 元素記号

- 元素
物質を構成している基本的な成分。
現在約120種類が知られている

- 元素の周期表
元素を原子番号順（陽子の数）に並べ、似た性質の元素が同じ縦の列に並ぶように配列した表

= 化学と人間生活

== 人間生活の中の化学

- #desc("金属")[
  自然に産出していたのものをそのまま使うもの（例：金・銀）と、化合物から金属を単体として取り出す技術（製錬）を使うものがある
]
  - #desc("銅 Cu")[
    金属の中では銀に次いで2番目に電気をよく通す\
    銅にスズを混ぜた合金の青銅が得られるようになる\
    ※ 合金 … 金属にほかの金属などを融かし合わせて作られたもの
  ]
  - #desc("鉄 Fe")[
    天然で産出することが極めてすくない\
    技術の発達により製錬が可能となった金属で、炭素の含有量を調整することで硬く強い真ちゅうが得られる\
    例：ステンレス鋼（クロムとニッケルとの合金）・トタン（表面を亜鉛で覆ったもの）
  ]
  - #desc("アルミニウム Al")[
    非常に軽く、電気をよく伝える\
    合金としても多く用いられる\
    例：ジュラルミン（銅、マグネシウムなどとの合金）
  ]

#table(
  columns: 2,
  table.header(
    [合金],[主な成分]
  ),
  [青銅（ブロンズ）],[銅、スズ],
  [黄銅（真ちゅう、ブラス],[銅、亜鉛],
  [白銅],[銅、ニッケル],
  [ステンレス鋼],[鉄、クロム、ニッケル],
  [ニクロム],[ニッケル、クロム],
  [ジュラルミン],[アルミニウム、銅、マグネシウム],
  [はんだ],[スズ、鉛],
  [無鉛はんだ],[スズ、銀、銅],
)

#desc("セラミックス")[
  天然の無機物を高温で処理して得られる非金属材料\
  例：陶磁器・ガラス・ファインセラミックス
]
- プラスチック
  - #desc("熱可塑性樹脂")[
    熱を加えると軟らかくなって融け、冷えると再び固まる樹脂\
    例：ポリスチレン（PS）・ポリプロピレン（PP）・ポリエチレンテレフタレート（PET）
  ]
  - #desc("熱硬化性樹脂")[
    原材料に熱を加えて成形し、固まった後に加熱しても柔らかくならない樹脂。変形すると困るところに使われる
  ]
- 繊維
  - #desc("天然繊維")[
    生物が作った繊維\
    例：植物繊維（木綿：コットン・麻：リネン）・動物繊維（絹：シルク・羊毛：ウール）\
    #desc("レーヨン")[
      天然繊維の成分と同じ物質を取り出し、科学的に処理して再生した繊維
    ]
  ]
  - #desc("合成繊維")[
    人間が石油などから合成した繊維\
    #desc("ナイロン")[
      天然繊維を全く利用せずに合成された世界初の繊維。カロザースが初めて合成に成功した
    ]
  ]

#pagebreak()

== 科学とその役割

*食料、食品*

#desc("化学肥料")[
  作物の育成に不足しやすい成分である窒素（N）・リン（P）・カリウム（K）を補うための、化学薬品を主成分とする肥料
]
#desc("農薬")[
  農作物の収穫率を上げるために用いる薬品
]
#desc("食品添加物")[
  味や色をよくしたり、日持ちさせたりするために食品に添加されている物質\
  例：保存料・調味料・着色料・着香料・酸化防止剤など
]

*洗剤*

#desc("界面")[
  水と油の境目に当たるところ
]
#desc("界面活性剤")[
  水になじみやすい親水性と、油になじみやすい 親油性 / 疎水性 を併せ持っている
]
#desc("ミセル")[
  洗剤を水に溶かしてある濃度いじょうになったときに生じる球の塊のこと
]

*物質のメリットとデメリット*

#desc("有害性")[
  環境中に排出された物質が、生物の生息や生育に害を及ぼす性質
]
#desc("物質の有害性")[
  物質による有害性の可能性。有害性 × 摂取量 ＝ 環境リスクの関係で決められる
]

= 物質の成分と構成元素

== 純物質と混合物

#desc("純物質")[
  ほかの物質が混ざっていない単一の物質。化学式で書いたときに1個だけになるもの \
  例：鉄・ダイヤモンド・水素・水
]
- 融点・沸点・密度などが一定
- ろ過や蒸留などの方法でそれ以上分けられない

#desc("混合物")[
  何種類かの物質が混じり合った \
  例：お茶・海水・しょう油・空気・塩素
]
- 融点・沸点・密度などはその組成によって分けられる
- ろ過や蒸留などの方法で各成分を分けられる

#come("","comment")[
  塩酸 ＝ 塩化水素（ $"HCl"$ ）＋ 水（ $"H"#sub([2])"O"$ ）
]

== 物理変化と化学変化

#desc("物理変化")[
  その物質の状態だけが変わり、性質は変わらない変化
]
#desc("化学変化")[
  反応の前後で性質が異なる物質になる変化
]

== 混合物の分離

#desc("ろ過")[
  ろ紙などを用いて個体が混じっている液体を個体と液体に分離する操作\
  例：泥水を泥と水に分ける\
  ポイント：ガラス棒を伝わせる・ビーカーの側面にろうとを添わせる
]
#desc("蒸留")[
  物質の沸点の差を利用して混合物である溶液と溶媒に分離する操作\
  例：赤ワインを水とエタノールに分ける
]
#desc("分留")[
  蒸留の一種、2種類以上の液体の混合物を沸点の違いを利用して蒸留によって各成分に分離する操作\
  例：
]
#desc("昇華法")[
  個体が直接期待になる変化を利用して、分離・精製する方法\
  例：
]
#desc("抽出")[
  混合物に特定の溶媒を加えて、目的物質だけを溶かして分離する操作\
  例：
]
#desc("再結晶")[
  物質が溶媒に溶ける量が温度により異なることを利用して、少量の不純物を取り除く方法\
  例：
]
#desc("ペーパークロマトグラフィー")[
  混合物が溶媒とともに、ろ紙上を移動する速度の違いを利用して分離する操作\
  例：
]