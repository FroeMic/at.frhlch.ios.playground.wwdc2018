//: # Hello WWDC 👋
/*:
 ### ⏰ 3 minutes is not a lot of time, so let's cut right to it.
 My name is *Michael* and I would love the be part of this years WWDC. To show you, I built this playground featuring my first-ever game, inspired by the 2013 classic [Flappy Bird](https://de.wikipedia.org/wiki/Flappy_Bird).

 
👉 I think, the game is best experienced by playing.
 Just select a level and open the _Live View_ in the _Assistant Editor_.
 
👉 After playing, have a look at the next [playground pages](@next), where I highlight my design goals, software engineering aspects and challenges I had to face during development.
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

// generate a random level
//let levelGenerator = LevelGenerator()
//levelGenerator.viewHeight = viewSize.height - 175.0 // take height of floor into account
//levelGenerator.length = 15000.0
//levelGenerator.minimumVerticalDistanceBetweenPipes = 180.0
//let selectedLevel = FuturisticLevel(generator: levelGenerator)

// 🎮 let's play (just click on the view)
let gameDriver = GameDriver(view: sceneView, level: selectedLevel)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


