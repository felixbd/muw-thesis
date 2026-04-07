#import "@preview/bookly:2.0.0": *

#import "./preamble.typ" as preamble
#include "./preamble.typ"

#import "preamble.typ": *
// #show: document => my-config(document)
#show: doc => my-config(
  is-draft: true,
  doc
)



#let config-colors = (
  primary: preamble.dunkelblau,
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

/*
#outline(
  title: [List of Figures Tables],
  target: figure.where(kind: table),
)
*/

// #listofequations
// #equate

#outline(
  title: [List of Equations],
  target: math.equation.where(block: true),
  depth: 1,
)

#outline(
  title: [List of math.equation figures],
  target: figure.where(kind: math.equation),
)

~

~

#figure(
  $ tau  $,
  kind: math.equation,
  caption: [hello]
)



#part("First part")

#include "chapters/ch_main.typ"

#part("Second part")

#show: appendix

#include "appendix/app_main.typ"

// #bibliography("bibliography/sample.yml")
#bibliography("bibliography/sample.bib")


#back-cover(
  abstracts: ((title: [Abstracts], text: lorem(100)), ),
  logo: (
    align(left)[#muw-logo(width: 70%)],
    align(right)[#image("images/typst-logo.svg", width: 50%)]
  )
)
