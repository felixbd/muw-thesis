#import "@preview/bookly:1.1.2": *

#let config-colors = (
  primary: rgb("#111D4E"),
  secondary: rgb("#dddddd").darken(15%)
)

#let muw-logo(..args) = image("./images/logo/MedUni-Wien.svg", ..args)

#show: bookly.with(
  author: "Author Name",
  
  theme: classic,  // classic fancy modern orly pretty

  // tufte: true,
  lang: "de",
  colors: config-colors,
  logo: muw-logo(),  
  
  // title-page: book-title-page(
  //   series: "Typst book series",
  //   institution: "Typst community",
  //   logo: image("images/typst-logo.svg"),
  //   cover: image("images/book-cover.jpg", width: 45%)
  // )

  title-page: include "cover.typ",

)

#show: front-matter

#include "front_matter/front_main.typ"

#show: main-matter

#tableofcontents

#listoffigures

#listoftables

#part("First part")

#include "chapters/ch_main.typ"

#part("Second part")

#show: appendix

#include "appendix/app_main.typ"

// #bibliography("bibliography/sample.yml")
#bibliography("bibliography/sample.bib")


#back-cover(
  resume: lorem(100),
  abstract: lorem(100),
  logo: (
    align(left)[#muw-logo(width: 70%)],
    align(right)[#image("images/typst-logo.svg", width: 50%)]
  )
)
