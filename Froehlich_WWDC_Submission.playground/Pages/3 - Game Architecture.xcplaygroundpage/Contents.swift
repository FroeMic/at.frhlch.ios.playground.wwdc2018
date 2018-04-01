/*:
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play) \
 > [    - Example: Create Custom Level](1.1%20Custom%20Level) \
 > [    - Example: Add Custom Assets](1.2%20Custom%20Assets) \
 > [    - Example: Create Random Level](1.3%20Random%20Level) \
 > [    - Example: Create Randomized Custom Level](1.4%20Custom%20Random%20Level) \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture) 📌 \
 > [4 - Implementation](4%20-%20Implementation)
 
 */
/*:
 # 2. Game Architecture
 
 ### 💡 Design Goals
 Before starting the implementation of the game I set a few design goals to adhere to:
 
 * **Extensibility**: Adding new levels should be easy.
 * **Clean Code**: My code should be modular, expressive and easy to understand.
 * **Transfer Value**: I should be able to use the playground as an example to explain *SpriteKit* basics to friends and students who want to create their own game.
 
 ### 💎 Game Aesthetics
 
 In addition to learning to work with *SpriteKit* I wanted to create all assets used in the game myself and not rely on 3rd party sources.
 In particular this meant that I had to
 
 * design the underlying illustrations for the different objects used in the game
 * animate the player objects
 * create (simple) sound effects
 
 For creating the visual game assets I used [Sketch](https://www.sketchapp.com/) and for creating the sound effects I made use of a tool called [Bfxr](https://www.bfxr.net/) and [Garage Band](https://www.apple.com/mac/garageband/).
 While there clearly is room for improvement (especially on the audio side), I am proud to say that all assets — such as _Henry_ here for example — that are used in the game are original designs done by myself. 💪
 
 ![Meet Henry](meet_henry.gif)
 
 ### ⚙️ Object Model
 Let's get a bit more technical now. 🤓
 Below you can see the object model of the game.
 It conceptualizes how the different objects in the game relate to each other.
 It helped me to plan ahead before starting to code and how to interface with _SpriteKit_.
 
 ![Object Model](object_model.png)
 
 The **GameDriver** is the controller responsible for presenting the correct scene at the right time.
 It does so by implementing the **GameDelegate** protocol.
 The **GameDelegate** is notified whenever the user dies, finishes the game or wants to restart it.
 
 There are three Scenes (*SKScenes*) in the game which are responsible for handling user input and updating the view accordingly.
 The **GameScene** is presenting the game itself. The **GameOverScene** is shown when the user dies and similiarly the **GameFinishedScene** is shown whenever the user wins a game.
 
 Which level is presented to the user is dependent on the initialization of the **GameDriver**.
 
 Each **Level** is composed of several **Assets**, namely 1 **PlayerAsset** (the player object), 1 **FloorAsset** (the floor at the bottom of the screen), 1 **BackgroundAsset** (the background of the scene) and both 1 array of **PipeTopAssets** and **PipeBottomAssets**.
 Additionally, each level has properties describing its *basisSpeed* and *length*.
 
 While all **Assets** differ in detail, they all implement the **Asset** protocol to share functionality to turn *.png* based visuals to *SKSpriteNodes*.
 Each **Asset** has an associated enum **AssetCategory** whose raw type is a *UInt32*.
 Each enum value encodes a bitmask that later allows to distinguish which objects should or should not collide in the game.
 */
//: [Continue Reading](@next)
