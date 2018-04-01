//: # Example: Create your own custom Level

import PlaygroundSupport
import SpriteKit

public class CustomLevel: Level {

    public var basisSpeed: CGFloat = 2.0
    public let length: CGFloat = 1250.0
    public let player: PlayerAsset = PlayerAsset.pinkBird()
    public let background: BackgroundAsset = BackgroundAsset.beachBackground()
    public let floor: FloorAsset = FloorAsset.concreteFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        // add more pipes as you like
    ]
    public let topPipes: [PipeTopAsset] = [
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

