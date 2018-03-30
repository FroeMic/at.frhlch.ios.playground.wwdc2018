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
 I was particularly interested in using the "_Start-With-A-Protocol_" paradigm together with Swift's protocol extensions that I first heard about in the the 2015 WWDC session [Protocol-Oriented Programming in Swift](https://developer.apple.com/videos/play/wwdc2015/408/) by Dave Abrahams.
 Both for my **Level** and **Asset** abstractions I started with a protocol and added common functionality through extensions of said protocols.
 Additionally, I used enums to abstract the _contact bitmasks_ of the different asset types into expressive categories.
 
 
 ### ✂️ Asset Creation
 
 To create the Assets used in the game, I ...
 
 ![Asset Model](asset_model.png)
 
 // protocol oriented
 // protocol extensions
 // compile time safety -> classes
 // Collison bitmasks using (ENUMS)
 // Adding new asset types by static factory functions (Extensibility)
 
 ### 📐Level Design
 // protocol oriented
 // automatic level generation
 */
//: [Continue Reading](@next)

