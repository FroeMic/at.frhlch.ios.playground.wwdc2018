//: [Previous](@previous) // [Next](@next)
//: # 1. Overview
/*:
 **Goal:** My goal was to familiarize myself with *SpriteKit* and build an simple game.
 
 **Secondary Goals:**
 * Extensibility: Adding new levels should be easy
 * Clean Code: Expressive and easy to understand code
 * Transfer Value: The playground can be used to teach *SpriteKit* basics to other students
 
 **Description:** The resulting project shows a simple "Flappy-Bird" inspired game.
 Given the 3-minute limit, I think the playground is best experienced by playing.
 For further information on the code, have a look at the subsequent playground pages.
 
 */
import PlaygroundSupport
import SpriteKit

let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

//let selectedLevel = BeachLevel()
//let selectedLevel = ForestLevel()
let selectedLevel = FuturisticLevel()

let gameDriver = GameDriver(view: sceneView, level: selectedLevel)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
