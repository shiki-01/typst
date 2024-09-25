#import "component/comment.typ": comment
#import "component/title.typ": head
#import "component/description.typ": description
#import "@preview/whalogen:0.1.0": ce as whalogen

#let come(title, type, body) =[ #comment(title, type, body) ]

#let desc(name, body) = [ #description(name, body) ]

#let ce(body) = [ $#whalogen(body)$ ]

#let light(body) = [
  #highlight(
    top-edge: "x-height",
    fill: rgb("#ffff00"),
    [*#body*]
  )
]

#let conf(
  title: none,
  date: none,
  doc,
) = {

  set heading(numbering: "1.")
  show heading: it => [
    #if it.level < 2 {pad(top: 0pt,[])}
    #pad(
      bottom: -40pt,
      [#it\ ]
    )
    #if it.level < 2 {line(length: 100%,stroke: rgb("#eee"))}
    #pad(bottom: -20pt, [])
    #if it.level >= 2 {
      [#pad(bottom: 10pt,[])]
    }
  ]

  set text(
    font: "M PLUS 1",
  )

  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    stroke: 0.7pt + rgb("#dddddd"),
    inset: 10pt,
    radius: 4pt,
  )
  show raw: set text(
    font: "M PLUS 1 Code",
  )

  set table(
    inset: 10pt,
    fill: (_, y) => if calc.even(y) and y != 0 { rgb("#f8f8f8") },
    stroke: 0.7pt + rgb("#dddddd")
  )
  show table.cell.where(y:0): strong

  import "@preview/quick-maths:0.1.0": shorthands
  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($|-$, math.tack),
    ($<=$, math.arrow.l.double) // Replaces '≤'
  )

  head(title, date)[
    #doc
  ]
}