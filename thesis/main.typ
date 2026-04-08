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


#tableofcontents

#show: main-matter


#my-part("First part")

#include "chapters/ch_main.typ"

#part("Second part")

#show: appendix

#part("Appendix")  // TODO ...

#include "appendix/app_main.typ"

= some math

#figure(
  $ tau  $,
  kind: math.equation,
  caption: [hello]
)

- - -

#math.equation(
  alt: "a squared plus b squared equals c squared",
  block: true,
  $ a^2 + b^2 = c^2   tau $,
)

- - - -

#[

  #import "@preview/equate:0.3.2": equate

  #show: equate.with(breakable: true, sub-numbering: true)
  #set math.equation(numbering: "(1.1)")


  #math.equation(
    alt: "a squared plus b squared equals c squared",
    block: true,
    
    $ a^2 + b^2 = c^2 \ tau $,
  )

  $ a^2 + b^2 = c^2 \ tau $

]

- - - -

$ a^2 + b^2 = c^2 \ tau $


= code

#figure(
  kind: raw,
  caption: [python foo pass]
)[
```py
def foo(n: int) -> None:
  pass
```
]


#listoffigures

#listoftables

#outline(
  title: [List of Listings],
  target: figure.where(kind: raw),
  // indent: 10%, depth: 1,
)

#{
  show outline.entry: it => [
    #if it.prefix().fields().children.last().text.trim().len() > 0 [
      #link(it.element.location())[
        #it.prefix()
        // #it.indented(
        // #h(0.5em)
        #it.element.alt
        #box(width: 1fr, it.fill)
        #it.page() \
      ]
    ] else [ ] 
  ]

  // #heading(numbering: none)[List of Equations]
  outline(
    title: [List of Equations],
    target: math.equation  // .where(block: true),
    // depth: 1,
  )
}

// #bibliography("bibliography/sample.yml")
#bibliography("bibliography/sample.bib")


#back-cover(
  abstracts: ((title: [Abstracts], text: lorem(100)), ),
  logo: (
    align(left)[#muw-logo(width: 70%)],
    align(right)[#image("images/typst-logo.svg", width: 50%)]
  )
)
