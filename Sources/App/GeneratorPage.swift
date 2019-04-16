//
//  GeneratorPage.swift
//  App
//
//  Created by Mats Mollestad on 16/04/2019.
//
// swiftlint:disable line_length nesting

import HTMLKit

/// A HTML Template
struct GeneratorPage: StaticView {

    /// The html template to render
    func build() -> CompiledTemplate {
        return [
            doctype(),
            html.child(

                head.child(
                    link.href("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css").rel("stylesheet"),
                    title.child("HTML-to-HTMLKit")
                ),

                body.onload("setupAutorezise()").child(

                    div.class("container").child(
                        img.src("https://github.com/vapor-community/HTMLKit/raw/master/htmlkit.png"),

                        h1.child("HTML-to-HTMLKit Converter"),

                        markdown(
                            """
NB! For some reason the `XMLDocument` implementation removes some tags like `i`, `button` and some non-standared attributes.
But still, it is a helpfull resource as converts most of the HTML.

If there are some issues, send an email [here](mailto:mem@mollestad.no) or on the git repo.
"""
                        ),

                        form.child(
                            div.child("form-group").child(
                                label.for("input").child("Input HTML:"),
                                textarea.id("html").class("form-control")
                            ),

                            button.class("mb-2 mt-2").type("button").onclick("generate();").child(
                                "Convert"
                            )
                        ),

                        form.child(
                            div.child("form-group").child(
                                label.for("input").child("HTMLKit:"),
                                textarea.id("generated").class("form-control")
                            )
                        )
                    ),

                    script.src("output.js")
                )
            )
        ]
    }
}
