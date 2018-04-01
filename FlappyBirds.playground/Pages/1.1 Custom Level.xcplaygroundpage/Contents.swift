/*:
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play) \
 > [    - Example: Create Custom Level](1.1%20Custom%20Level) 📌 \
 > [    - Example: Add Custom Assets](1.2%20Custom%20Assets) \
 > [    - Example: Create Random Level](1.3%20Random%20Level) \
 > [    - Example: Create Randomized Custom Level](1.4%20Custom%20Random%20Level) \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture) \
 > [4 - Implementation](4%20-%20Implementation)
 
 */
//: # Example 1:
//: ### Create your own custom Level

import PlaygroundSupport
import SpriteKit

// Define a custom level
class CustomLevel: Level {

    var basisSpeed: CGFloat = 2.0
    let length: CGFloat = 1250.0
    let player: PlayerAsset = PlayerAsset.pinkBird()
    let background: BackgroundAsset = BackgroundAsset.beachBackground()
    let floor: FloorAsset = FloorAsset.concreteFloor()
    let bottomPipes: [PipeBottomAsset] = [
        // add more pipes as you like
    ]
    let topPipes: [PipeTopAsset] = [
        PipeTopAsset.yellowPipe(offsetX: 700.0, height: 200.0),
        PipeTopAsset.greenPipe(offsetX: 800.0, height: 250.0),
        PipeTopAsset.yellowPipe(offsetX: 900.0, height: 300.0),
        PipeTopAsset.greenPipe(offsetX: 1000.0, height: 300.0),
        PipeTopAsset.yellowPipe(offsetX: 1100.0, height: 250.0),
        PipeTopAsset.greenPipe(offsetX: 1200.0, height: 200.0),
        // add more pipes as you like
    ]

}

// 🖥 set the view size of the scene
let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

//  ➡️ initiate the level
let selectedLevel =  CustomLevel()

// 🎮 let's play (just click on the view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Continue Reading](@next)
