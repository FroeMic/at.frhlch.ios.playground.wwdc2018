/*:
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play)  \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture)  \
 > [4 - Implementation](4%20-%20Implementation) 📌
 
 */
/*:
 ## 3. Implementation
 
 Coding Time! 👾
 Let me tell you a bit about the actual implementation.
 
 Already before I wrote the first line of code for this project, I knew I wanted to use the rich set of opportunities Swift 4 provides.
 I was particularly interested in using the "_Start-With-A-Protocol_" paradigm together with Swift's protocol extensions that I first heard about in the 2015 WWDC session [Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/) by Dave Abrahams.
 Both for my **Level** and **Asset** abstractions I started with a protocol and added common functionality through extensions of said protocols.
 Additionally, I used enums to abstract the _contact bitmasks_ of the different asset types into expressive categories.
 
 
 ### ✂️ Asset Creation
 
Below you can see all asset related objects depicted.
 
![Asset Model](asset_model.png)
 
**Asset Category** \
 To ensure extensibility and provide an easy interface to create new levels, I needed the games assets to be categorized.
 For this game I identified 4 different `AssetCategories`, which are represented as an enum in code.
 
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
 
 The raw value of the enum is an `UInt32` and as each case is represented by a bitmask this allows to define the *contactTestBitMask* for each category.
Thanks to Swift enum's I could easily do so by adding a computed property.
The *contactTestBitMask* are later used to tell the responsible *SKPhysicsContactDelegate* which objects should collide with each other. More on this later.
 

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
 
 What the *contactTestBitMask* property translates to is the following: Everytime two *Assets* collide the *SKPhysicsContactDelegate*, if one of the following conditions is true.
 
  * The first object is of category **.player**, the second one is either of category  **.pipe** or **.floor**
  * The first object is of category **.pipe**, the second one is of category  **.player**
  * The first object is of category **.floor**, the second one is of category  **.player**
 

 **Asset Creation:** \
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
 ```
 
 Finally, I created 5 classes which implement the `Asset` protocol, thereby ensuring compile time type safety and adding additional behavior.
 
 * **PlayerAsset**
 * **PipeBottomAsset**
 * **PipeTopAsset**
 * **FloorAsset**
 * **BackgroundAsset**
 
All of the classes implementing the `Asset` protocol differ slightly in their behavior.
Examples are the different initialization of the classes and the `createSKNode()` function which is implemented seperately in most cases.

 **Adding new Assets:** \
 Adding new assets, can now be done easily by adding a new class function to the classes implementing the `Asset` protocol and specifiying their `assetUrl` property.
 For example, a new background asset could be added like this:
 
 ```Swift
 extension BackgroundAsset {
 
     public class func newBackground() -> BackgroundAsset {
        return BackgroundAsset(assetUrl: "background_new.png", backgroundColor: SKColor(displayP3Red: 0.82, green: 0.97, blue: 1.00, alpha: 1.00))
     }
 }
 ```
 
 Using these static factory functions has one advantage.
 If the assetUrl (= the name of the `.png` file) changes at any time, the code needs to be updated only at this single point.

### 📐Level Design
 
For creating the game levels I abstracted a `Level` model, which can be seen in the picture below.
 
![Level Model](level_model.png)
 
**Level Protocol:** \
The `Level` protocol requires each concrete level to provides assets for the background, the floor, the player and finally the bottom- and topPipes.
 Additionally, it requires a `length` and a `basisSpeed` property of type `CGFloat`.
 
 ```Swift
 public protocol Level {
     var length: CGFloat { get }
     var basisSpeed: CGFloat { get }
     var player: PlayerAsset { get }
     var background: BackgroundAsset { get }
     var floor: FloorAsset { get }
     var bottomPipes: [PipeBottomAsset] { get }
     var topPipes:  [PipeTopAsset] { get }
 }
 ```
 
The `length` property defines after which distance the level is successfully finished.
The `basisSpeed` property defines how fast the floor and the pipes are moving past the screen.
Which value works best for the `basisSpeed` depends on the layout of the respective level.
(It is pretty much a *magic variable* that has to be figured out by trial and error.
I found that values around `2.0` seem to work quite well.)
 
Finally, on the screen the `Level` model is then displayed as depicted in the following picture.
 
![Level Composition](level_composition.png)
 
 */
//: [Back to the Beginning](1%20-%20Lets%20Play)
