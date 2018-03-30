//
//import SpriteKit
//import PlaygroundSupport
//
//class GS: SKScene {
//    override public func didMove(to view: SKView) {
//        backgroundColor = UIColor.white
//        setupPlayerNode()
//    }
//    
//    fileprivate func setupPlayerNode() {
//        let player = PlayerAsset.blueBird()
//        let playerNode = player.createSKNode()
//        playerNode.size.width = playerNode.size.width*3
//        playerNode.size.height = playerNode.size.height*3
//        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
//        addChild(playerNode)
//    }
//}
//
//let viewSize: CGSize = CGSize(width: 375, height: 667)
//let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))
//
//
//let gameScene = GS(size: viewSize)
//gameScene.scaleMode = .aspectFill
//
//sceneView.presentScene(gameScene)
//PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


//: [Previous](@previous) // [Next](@next)

//:  ## Asset Creation
/*:
 ### Asset Category
 To ensure extensibility and provide and easy interface to create new levels, the required games assets are categorized.
 For this game I identified 4 different `AssetCategories`, which are represented as an Enum in code.
 
 ```Swift
 public enum AssetCategory: UInt32 {
 
     case player     = 0b0001 // 0x1 << 0
     case pipe       = 0b0010 // 0x1 << 1
     case floor      = 0b0100 // 0x1 << 2
     case background = 0b1000 // 0x1 << 3
 
     public var categoryBitMask: UInt32 {
        return self.rawValue
     }
 
    // ...
 
 }
 ```
 
 * **.player:** The asset representing the game avatar the user is controlling
 * **.pipe:** A pipe which blocks the way of the player
 * **.floor:** The floor of level
 * **.background:** The background image of the level

 The raw value of the enum is an `UInt32` and as each case is represented by a bitmask this allows to define the *contactBitMasks* for each category.
 The *contactBitMask* are later used to tell the responsible *PhysicsDelegate* which objects should collide with each other. More on this later.
 
 ```Swift
 public enum AssetCategory: UInt32 {
 
    // ...

     public var contactTestBitMask: UInt32 {
         switch self {
         case .player:
            return AssetCategory.pipe.categoryBitMask | AssetCategory.floor.categoryBitMask
         case .pipe:
            return AssetCategory.player.categoryBitMask
         case .floor:
            return AssetCategory.player.categoryBitMask
         case .background:
            return 0
    }
 
 }
 ```

 */

/*:
 ### Asset Creation
 To create Assets I defined a protocol `Asset` which requires an `assetUrl` of type `String` to point to the respective image in the *Resources* folder and a `category` of type `AssetCategory`.
 
 Additionally, I used a protocol extension to add default functionality for each of the implementing classes.
 The `createSKNode()` creates and returns a corresponding `SKSpriteNode` from the `assetUrl`.
 
 ```Swift
     public protocol Asset {
         var assetUrl: String { get }
         var category: AssetCategory { get }
     }
 
     extension Asset {
         public func createSKNode() -> SKSpriteNode {
            return SKSpriteNode(imageNamed: assetUrl)
         }
     }
 }
 ```
 
 Finally, I created 5 classes which implement the `Asset` protocol, thereby ensuring compile time type safety and adding additional behavior.
 
 * **PlayerAsset**
 * **PipeBottomAsset**
 * **PipeTopAsset**
 * **FloorAsset**
 * **BackgroundAsset** 
*/

/*:
 ### Adding new Assets
 Adding new assets, can now be done easily by adding a new class function to the classes implementing the `Asset` and specifiying their `assetUrl` property.
 
 */

//: [Previous](@previous) // [Next](@next)

