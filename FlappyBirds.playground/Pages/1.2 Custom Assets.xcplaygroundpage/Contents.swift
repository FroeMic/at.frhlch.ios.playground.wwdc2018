//: # Example: Add your custom assets to the game

import PlaygroundSupport
import SpriteKit

// Add static factory functions for custom assets as extension
extension PipeBottomAsset {
    public class func orangePipe(offsetX: CGFloat, height: CGFloat) -> PipeBottomAsset {
        return PipeBottomAsset(assetUrl: "pipe_bottom_orange.png", offsetX: offsetX, height: height)
    }
}

extension PipeTopAsset {
    public class func orangePipe(offsetX: CGFloat, height: CGFloat) -> PipeTopAsset {
        return PipeTopAsset(assetUrl: "pipe_top_orange.png", offsetX: offsetX, height: height)
    }
}

// Define a custom level
class CustomLevelWithOrangePipes: Level {
    
    var basisSpeed: CGFloat = 2.0
    let length: CGFloat = 1250.0
    let player: PlayerAsset = PlayerAsset.pinkBird()
    let background: BackgroundAsset = BackgroundAsset.beachBackground()
    let floor: FloorAsset = FloorAsset.concreteFloor()
    let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.orangePipe(offsetX: 700.0, height: 100.0),
        PipeBottomAsset.orangePipe(offsetX: 1200.0, height: 100.0),
        // add more pipes as you like
    ]
    let topPipes: [PipeTopAsset] = [
        PipeTopAsset.orangePipe(offsetX: 700.0, height: 200.0),
        PipeTopAsset.orangePipe(offsetX: 800.0, height: 250.0),
        PipeTopAsset.orangePipe(offsetX: 900.0, height: 300.0),
        PipeTopAsset.orangePipe(offsetX: 1000.0, height: 300.0),
        PipeTopAsset.orangePipe(offsetX: 1100.0, height: 250.0),
        PipeTopAsset.orangePipe(offsetX: 1200.0, height: 200.0),
        // add more pipes as you like
    ]
}

// 🖥 set the view size of the scene
let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

//  ➡️ initiate the level
let selectedLevel = CustomLevelWithOrangePipes()

// 🎮 let's play (just click on the view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Continue Reading](@next)

