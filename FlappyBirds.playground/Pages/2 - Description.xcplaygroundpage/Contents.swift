//: ## You made it to the second page! 😃 Let me tell you a bit why and how I created the game.

/*:
 ## 1. Overview
 
 ### What do I want to take out of this project?
 
 ### Why Flappy Birds?
 

 */

/*:
 ## 2. Game Architecture
 
 ### Design Goals
 Before the start of the implementation of the game I set a few design goals to adhere to:
 
 * **Extensibility**: Adding new levels should be easy
 * **Clean Code**: Expressive and easy to understand code
 * **Transfer Value**: I should be able to use the playground as an example to explain *SpriteKit* basics to friends and students who want to create their own game.
 
 ### Game Aesthestics
 
 In addition to learning to work with *SpriteKit* I wanted to create all assets used in the game myself and not rely on 3rd party sources.
 In particular this meant that I had to
 
 * design the underlying illustrations for the different objects used in the game
 * animate the player objects
 * create (simple) sound effects
 
 
 I am proud to say that all assets — such as Henry here for example — that are used in the game are original designs by myself.
 
  ![Meet Henry](meet_henry.gif)
 
 ### Object Model
 Below you can see the object model of the game.

 ![Object Model](object_model.png)

 The **GameDriver** is the controller responsible for the presenting the correct scene at the right time.
 It does so by implementing the **GameDelegate** protocol.
 The **GameDelegate** is notified whenever the user dies, finishes the game or wants to restart it.
 
 There are three Scenes (*SKScenes*) in the game which are responsible for handling user input and updating the view accordingly.
 The **GameScene** is presenting game itself. The **GameOverScene** is shown when the user dies and similiarly the **GameFinishedScene** is shown whenever the user wins a game.
 
 Which level is presented to the user is dependent on the initialization of the  **GameDriver**.
 
 Each **Level** is composed of several **Assets**, namely 1 **PlayerAsset** (the player object), 1 **FloorAsset** (the floor at the bottom of the screen), 1 **BackgroundAsset** (the background of the scene) and both 1 array of **PipeTopAssets** and **PipeBottomAssets**.
 Additionally, each level has properties describing its *basisSpeed* and *length*.
 
 While all **Assets** differ in detail, they all implement the **Asset** protocol to share functionality to turn *.png* based visuals to *SKSpriteNodes*.
 Each **Asset** has an associated enum **AssetCategory** which is based on a bitmask that allows to distinguish which object should or should not collide in the game.
 
*/

/*:
 ## 3. Implementation
 
 // Tried to use the opportunities Swift 4 provides.
 // Protocol Oriented Pogramming (https://developer.apple.com/videos/play/wwdc2015/408/)
 // Enums
 
 ### Asset Creation
 // protocol oriented
 // protocol extensions
 // compile time safety -> classes
 // Collison bitmasks using (ENUMS)
 // Adding new asset types by static factory functions (Extensibility)
 
 ### Level Design
 // protocol oriented
 // automatic level generation
 

 
 */

