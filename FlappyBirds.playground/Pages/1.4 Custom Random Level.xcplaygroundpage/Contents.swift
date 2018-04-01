/*:
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play) \
 > [    - Example: Create Custom Level](1.1%20Custom%20Level) \
 > [    - Example: Add Custom Assets](1.2%20Custom%20Assets) \
 > [    - Example: Create Random Level](1.3%20Random%20Level) \
 > [    - Example: Create Randomized Custom Level](1.4%20Custom%20Random%20Level) 📌 \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture) \
 > [4 - Implementation](4%20-%20Implementation)
 
 */
//: # Example 4:
//: ### Automatically Generate Random Layouts for Your Custom Level

import PlaygroundSupport
import SpriteKit

// Define a custom level
class CustomLevelWithRandomLayout: Level {
    
    var basisSpeed: CGFloat = 2.0
    let player: PlayerAsset = PlayerAsset.pinkBird()
    let background: BackgroundAsset = BackgroundAsset.beachBackground()
    let floor: FloorAsset = FloorAsset.concreteFloor()
    
    var length: CGFloat
    let bottomPipes: [PipeBottomAsset]
    let topPipes: [PipeTopAsset]
    
    init(generator: LevelGenerator? = nil) {

        var levelGenerator: LevelGenerator!
        if generator == nil {
            // configure the level generator with default values, if not injected
            levelGenerator = LevelGenerator()
            levelGenerator.createTopAsset = PipeTopAsset.greyPipe
            levelGenerator.createBottomAsset = PipeBottomAsset.greyPipe
            levelGenerator.length = 1000.0
        } else {
            levelGenerator = generator
        }

        levelGenerator.generateLevel()

        self.length = levelGenerator.length
        self.bottomPipes = levelGenerator.bottomPipes
        self.topPipes = levelGenerator.topPipes
    }
    
}

// 🖥 set the view size of the scene
let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

//  ➡️ initiate the level
let selectedLevel =  CustomLevelWithRandomLayout()

// 🎮 let's play (just click on the view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Continue Reading](@next)

