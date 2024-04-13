#let head(title, date, body) = [
  #set page (
    header: context {
      if counter(page).get().first() == 1 {
        (
          [
            #align(right)[#title]
            #align(right)[#date]
          ]
        )
      }
    }
  )
  #body
]