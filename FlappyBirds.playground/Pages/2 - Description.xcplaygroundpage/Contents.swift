//: ##  Great! You made it to the second page! 😃
//: ### Let me tell you a bit why and how I created the game.

/*:
 ## 1. Overview
 
 ### 🤔 What do I want to take out of this project?
 
 Beyond the chance to be part of the WWDC I wanted to take something away for myself.
 This is why I chose to do something I had never done before.
 Looking at the WWDC Scholarship homepage I thought "_What better way to showcase creativity than to create a game?_".
 
 ![WWDC 2018 Scholarship Website Screenshot (Adapted)](wwdc_homepage.png)
 
 Creating a game would require me to learn or improve several skills — conceptualizing the game itself, visual and audio design as well as getting to know _SpriteKit_ and the Playground enivornment.
 All of this in a little more than 2 weeks.
 Perfect!

 ### 🐣 Why Flappy Birds?
 
 You might ask why, build _Flappy Birds_ then?
 Several reasons!
 
 * The level of complexity seemed perfect for the available time and my experience
 * The finished project would allow me to explain _SpriteKit_ essentials to friends interested in building their own game.
 * Designing the game assets (for multiple levels) would allow me to give the game a personal touch.
 * And — maybe most importantly — after asking friends which mobile they loved (and hated) most over the years, *FlappyBird* was the one that popped up most often.
 */
/*:
 ## 2. Game Architecture
 
 ### 💡 Design Goals
 Before the start of the implementation of the game I set a few design goals to adhere to:
 
 * **Extensibility**: Adding new levels should be easy
 * **Clean Code**: Expressive and easy to understand code
 * **Transfer Value**: I should be able to use the playground as an example to explain *SpriteKit* basics to friends and students who want to create their own game.
 
 ### 💎 Game Aesthestics
 
 In addition to learning to work with *SpriteKit* I wanted to create all assets used in the game myself and not rely on 3rd party sources.
 In particular this meant that I had to
 
 * design the underlying illustrations for the different objects used in the game
 * animate the player objects
 * create (simple) sound effects
 
 For creating the visual game assets I used [Sketch]() and for creating the sound effects I made use of a tool called [Bfxr]().
 While there clearly is room for improvement (especially on the audio side), I am proud to say that all assets — such as Henry here for example — that are used in the game are original designs by myself. 💪
 
  ![Meet Henry](meet_henry.gif)
 
 ### ⚙️ Object Model
 Let's get a bit more technical. 🤓
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
 Each **Asset** has an associated enum **AssetCategory** which is based on a bitmask that allows to distinguish which object should or should not collide in the game.
 
 
*/

/*:
 ## 3. Implementation
 
 Coding Time! 👾
 Let me tell you a bit about the actual implementation.
 
 Already before I wrote the first line of code for this project, I knew I wanted to use the rich set of opportunities Swift 4 provides.
 I was particularly interested in using the "_Start-With-A-Protocol_" paradigm together with Swift's protocol extensions that I first heard about in the the 2015 WWDC talk [INSERT NAME HERE](https://developer.apple.com/videos/play/wwdc2015/408/) by [TODO]().
 Both for my **Level** and **Asset** abstractions I started with a protocol and added common functionality through extensions of said protocols.
 Additionally, I used enums to abstract the _contact bitmasks_ of the different asset types into expressive categories.

 
 ### ✂️ Asset Creation
 // protocol oriented
 // protocol extensions
 // compile time safety -> classes
 // Collison bitmasks using (ENUMS)
 // Adding new asset types by static factory functions (Extensibility)
 
 ### 📐Level Design
 // protocol oriented
 // automatic level generation
 

 
 */

