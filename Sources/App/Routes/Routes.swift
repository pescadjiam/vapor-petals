import Vapor

extension Droplet {
    func setupRoutes() throws {

        post("flower") { request in
           
            let flower = Flower(request: request)
            FlowerService.flowers.append(flower)
            
            return try JSON(node: [
                "success" : "true",
                "data" : try flower.makeJSON()
            ])
        }
        
        get("flowers") { req in
            
            
            let rose = Flower(name: "Rose", description: "que flor", imageURL: "")
            let lantana = Flower(name: "Lantana", description: "que flor", imageURL: "")
            let purpleHearts = Flower(name: "Purple Hearts", description: "que flor", imageURL: "")
            
            if FlowerService.flowers.isEmpty {
                FlowerService.flowers.append(rose)
                FlowerService.flowers.append(lantana)
                FlowerService.flowers.append(purpleHearts)
            }
            
            return try FlowerService.flowers.makeJSON()
            
        }
        
    }
}
