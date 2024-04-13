#let comment(title, type, body) = {
  let color
  let acsent
  let icon
  let content
  let text_color
  if type == "info" {color = "#ccf1ff"; text_color = "#31708f"; acsent = "#54a2df"; icon = "../image/info.svg"}
  if type == "important" {color = "#ffdbdb"; text_color = "#a94442"; acsent = "#ff4d4d"; icon = "../image/exra.svg"}
  if type == "sucsess" {color = "#dff4cf"; text_color = "#3c763d"; acsent = "#67cb1b"; icon = "../image/check.svg"}
  if type == "comment" {color = "#fbf5e0"; text_color = "#8a6d3b"; acsent = "#ffce1f"; icon = "../image/comment.svg"}
  if title == "" {
    content = [
      #grid(
        columns: (30pt, 1fr),
        [
          #pad(
            right: 8pt,
            image(icon, width: 20pt),
          )
        ],
        [
          #pad(
            top: 6pt,
            bottom: 5pt,
            right: 2pt,
            text(fill: rgb(text_color))[#body]
          )
        ]
      )
    ]
  } else {
    content = [
      #grid(
        columns: (30pt, 1fr),
        [
          #pad(
            right: 8pt,
            image(icon, width: 20pt),
          )
        ],
        text(fill: rgb(text_color))[#align(horizon)[*#title*]]
      )
      #pad(
        top: 10pt,
        bottom: 10pt,
        left: 28pt,
        right: 28pt,
        text(fill: rgb(text_color))[#body]
      )
    ]
  }
  block(
    fill: rgb(color),
    inset: 15pt,
    radius: 4pt,
    stroke: 1pt + rgb(acsent),
    [#content]
  )
}