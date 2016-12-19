//
//  RoutingHandlers.swift
//  SwiftToyApp
//
//  Created by zhangzhiyong-pd@360.cn on 16/12/16.
//
//

import Foundation
import PerfectHTTP

func makeURLRoutes() -> Routes{
    var routes = Routes()
    
    routes.add(method: .get, uri: "/api/v1/user/{id}", handler: getUser)
    routes.add(method: .post, uri: "/api/v1/user", handler: addUser)
    routes.add(method: .post, uri: "/raw", handler: rawPOSTHandler)
    return routes
}

func getUser(request: HTTPRequest, _ response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    do {
       try response.setBody(json: ["name":"aa"])
    } catch {

    }
    response.completed()
}

func addUser(request: HTTPRequest, _ response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    do {
        try response.setBody(json: ["code":"0"])
    } catch {
        
    }
    response.completed()
}

func rawPOSTHandler(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>Raw POST handler: You POSTED to path \(request.path) with content-type \(request.header(.contentType)) and POST body \(request.postBodyString)</body></html>")
    response.completed()
}
