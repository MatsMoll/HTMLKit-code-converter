//
//  GeneratorPage.swift
//  App
//
//  Created by Mats Mollestad on 16/04/2019.
//
// swiftlint:disable line_length nesting

import BootstrapKit

/// A HTML Template
struct GeneratorPage: HTMLPage {

    var body: HTML {
        Document(type: .html5) {
            Head {
                Stylesheet(url: "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css")
                Title { "HTML-to-HTMLKit" }
            }
            Body {
                Container {
                    Img(source: "https://github.com/vapor-community/HTMLKit/raw/master/htmlkit.png")

                    Text {
                        "HTML-to-HTMLKit Converter"
                    }.style(.heading1)

                    Text {
                        "NB! For some reason the `XMLDocument` implementation removes some tags like `i`, `button` and some non-standared attributes."
                        "But still, it is a helpfull resource as converts most of the HTML."
                    }

                    Form {
                        FormGroup(label: "Input HTML") {
                            TextArea().id("html")
                        }

                        Button {
                            "Convert"
                        }
                        .margin(.two, for: .bottom)
                        .on(click: "generate();")
                        .type(.button)
                    }

                    Form {
                        FormGroup(label: "Generated") {
                            TextArea().id("generated")
                        }
                    }
                }
                Script().source("output.js")
            }
        }
    }
}
