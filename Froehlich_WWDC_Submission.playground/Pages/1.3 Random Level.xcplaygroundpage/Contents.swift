/*:
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play) \
 > [    - Example: Create Custom Level](1.1%20Custom%20Level) \
 > [    - Example: Add Custom Assets](1.2%20Custom%20Assets) \
 > [    - Example: Create Random Level](1.3%20Random%20Level) 📌 \
 > [    - Example: Create Randomized Custom Level](1.4%20Custom%20Random%20Level) \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture) \
 > [4 - Implementation](4%20-%20Implementation)
 
 */
//: # Example 3:
//: ### Automatically Generate Random Layouts for the Futuristic Level

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

