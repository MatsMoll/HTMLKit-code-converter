import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // "It works" page
    router.get { req in
        return try req.view().render("base")
    }
    
    // Says hello
    router.post { req -> String in
        guard let htmlData = req.http.body.data,
            let html = String(data: htmlData, encoding: .utf8) else {
            throw Abort(.badRequest)
        }
        return try SafeleafHTMLConverter(file: html).convert()
    }
}

struct GenerateContent: Content {
    let html: String
}
