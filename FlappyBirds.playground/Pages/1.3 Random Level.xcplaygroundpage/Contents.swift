//: # Example: Automatically Generate Random Layouts for the Futuristic Level

import PlaygroundSupport
import SpriteKit


// 🖥 set the view size of the scene
let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

//  ➡️ initiate and configure the level generator to generate a new layout
let levelGenerator = LevelGenerator()
levelGenerator.viewHeight = viewSize.height - 175.0 // take height of floor into account
levelGenerator.length = 15000.0
levelGenerator.minimumVerticalDistanceBetweenPipes = 180.0
let selectedLevel = FuturisticLevel(generator: levelGenerator)

// 🎮 let's play (just click on the view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Continue Reading](@next)

