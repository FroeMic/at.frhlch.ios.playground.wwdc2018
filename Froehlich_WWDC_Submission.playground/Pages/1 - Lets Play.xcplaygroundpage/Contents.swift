//: # Hello WWDC 👋
/*:
 ### ⏰ 3 minutes is not a lot of time, so let's cut right to it.
 My name is *Michael* and I would love to be part of this year's WWDC. To show you, I built this playground featuring my first-ever game, inspired by the 2013 classic [Flappy Bird](https://de.wikipedia.org/wiki/Flappy_Bird).

 
👉 I think the game is best experienced by playing.
 Just select a level and open the _Live View_ in the _Assistant Editor_. (🔈 make sure to have sound turned on)
 
👉 After playing, have a look at the following pages with advanced [Examples](1.1%20Custom%20Level) how to create your own levels and the [Write-Up](2%20-%20Motivation), where I highlight my design goals, software engineering aspects and challenges I had to face during development.
 
 > **Table of Contents:**
 > - - - -
 > [1 - Lets Play](1%20-%20Lets%20Play) 📌 \
 > [    - Example: Create Custom Level](1.1%20Custom%20Level) \
 > [    - Example: Add Custom Assets](1.2%20Custom%20Assets) \
 > [    - Example: Create Random Level](1.3%20Random%20Level) \
 > [    - Example: Create Randomized Custom Level](1.4%20Custom%20Random%20Level) \
 > [2 - Motivation](2%20-%20Motivation) \
 > [3 - Game Architecture](3%20-%20Game%20Architecture) \
 > [4 - Implementation](4%20-%20Implementation)
 
 
 */
import PlaygroundSupport
import SpriteKit

// 🖥 set the view size of the scene 
let viewSize: CGSize = CGSize(width: 375, height: 667)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: viewSize))

// ➡️ select the level you want to play
let selectedLevel = BeachLevel()
//let selectedLevel = ForestLevel()
//let selectedLevel = FuturisticLevel()

// 🎮 let's play (just click on the live view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Continue Reading](@next)
