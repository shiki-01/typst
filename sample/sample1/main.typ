#import "../../lib/conf.typ": conf
#import "../../lib/component/comment.typ": come
#import "@preview/codelst:2.0.1": sourcecode
#show: doc => conf(
  title: [情報システム],
  date: [2024年4月11日],
  doc,
)


#let dummy = [
  私は今度とにかくその相違児というのの以上で連れなでし。てんで近頃を参考らはいったいこの衰弱たなまでが云いでいるですをは攻撃かかるないんて、少々には払っででなけれた。社会でいうないことももし今がまあたたた。
]

= タイトル１

#come( "こめんとのたいとるだよー", "info" )[
  #dummy
]
#come("","comment")[
  #dummy
]
#come("","important")[いんぽーたんとだよん]
#come("","sucsess")[*せいこうだよ！*]
= タイトル
ああああああ
== タイトル
ああああああ

こんな風に色々かくのはたのしいぞい！
でもまあ\
　これが\
 こんな風にかけるのはいいことだよね\　
 #dummy

#pagebreak()

= taitoru

#sourcecode()[```js
let str = "hello world!";

function sample(lang:test) {
  let n = 1
  if (str.lenght = n) {
    n = 3;
  }
}
```]