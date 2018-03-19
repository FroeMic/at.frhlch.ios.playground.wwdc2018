import PlaygroundSupport
import SpriteKit


// MARK: Constants
let viewSize: CGSize = CGSize(width: 375, height: 667)

let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))
sceneView.ignoresSiblingOrder = false

let scene = FlappyBirdScene(size: viewSize)
scene.level = Level01()
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


