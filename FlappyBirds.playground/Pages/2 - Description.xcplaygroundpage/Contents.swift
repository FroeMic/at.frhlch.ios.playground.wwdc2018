//: [Previous](@previous)

//: Game Architecture

//: Asset Creation
// Original Design (Sound / Images)
// Asset Protocol and Protocol extensions (POP)
// Collison bitmasks using (ENUMS)
// Adding new asset types by static factory functions (Extensibility)

//: Level Design
// Architecture (POP)
// Extensibility
// automatic level generation

import SpriteKit

class Test {
    
    var createBottomAsset: (CGFloat, CGFloat) -> PipeBottomAsset = PipeBottomAsset.greyPipe
    
    init() {
        createBottomAsset(10.0, 100.0)
    }
}


let t = Test()
//: [Next](@next)
