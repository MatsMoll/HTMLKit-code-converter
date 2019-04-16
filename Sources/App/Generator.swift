//
//  Generator.swift
//  App
//
//  Created by Mats Mollestad on 07/02/2019.
//

import Foundation

class HTMLKitHTMLConverter {

    enum Errors: Error {
        case rootNotFound
    }

    let file: String

    var tabIndent: Int = 0
    private var output: String = ""

    init(file: String) {
        self.file = file
    }

    func convert() throws -> String {
        let document = try XMLDocument(xmlString: file, options: .documentTidyHTML)
        guard let root = document.rootElement() else {
            throw Errors.rootNotFound
        }
        try convert(root)
        return output
    }

    private func convert(_ node: XMLNode) throws {
        switch node.kind {
        case .text:
            if node.stringValue != "\n" && node.stringValue != " " {
                output += "\"\(node.stringValue?.replacingOccurrences(of: "\n", with: "") ?? "")\""
            } else {
                throw Errors.rootNotFound
            }
        case .comment:
            output += "comment(\"\(node.stringValue ?? "")\")"
        default:
            if let element = node as? XMLElement {
                guard let name = element.name else {
                    return
                }
                output += "\(name)"
                if let attributes = element.attributes {

                    for attribute in attributes {
                        output += ".\(attribute.name ?? "")"
                        if let value = attribute.stringValue {
                            output += "(\"\(value)\")"
                        }
                    }
                }


                if let children = node.children {
                    output += ".child("
                    tabIndent += 1
                    output += "\n" + String(repeating: "    ", count: tabIndent)
//                    output += "\n" + String(repeating: "    ", count: tabIndent)
                    for node in children {
                        do {
                            try convert(node)
                            output += ",\n" + String(repeating: "    ", count: tabIndent)
                        } catch { }
                    }
                    output.removeLast(4 * tabIndent + 2)
                    tabIndent -= 1
                    output += "\n" + String(repeating: "    ", count: tabIndent)
                    output += ")"
                }
//                output += "\n" + String(repeating: "    ", count: tabIndent)
            }
        }
    }
}
