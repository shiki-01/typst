#let description(name, body) = [
  #underline[#name]\
  #pad(
    top: -5pt,
    bottom: 5pt,
    [
      #grid(
        columns: 2,
        […],
        [#body]
      )
    ]
  )
]