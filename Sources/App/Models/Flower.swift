//
//  Flower.swift
//  App
//
//  Created by Dengun on 09/04/2018.
//

import Vapor

struct Flower {
    var name : String
    var description : String
    var imageURL : String
    
    init(name : String, description : String, imageURL : String) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
    
    init(request : Request) {
        guard let name = request.data["name"]?.string,
            let description = request.data["description"]?.string,
            let imageURL = request.data["imageURL"]?.string else {
                fatalError("Parameters missing")
        }
        
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
   

}

extension Flower : JSONRepresentable {
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", self.name)
        try json.set("description", self.description)
        try json.set("imageURL", self.imageURL)
        return json
    }
}


