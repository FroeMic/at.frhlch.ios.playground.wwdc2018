import SpriteKit

public class FlappyBirdScene: SKScene {
    
    public var level: Level?
    
    var backgroundNode: SKSpriteNode!
    var floorNode1: SKSpriteNode!
    var floorNode2: SKSpriteNode!
    var playerNode: SKSpriteNode!
    
    var bottomPipe1: SKSpriteNode!
    var bottomPipe2: SKSpriteNode!
    var topPipe1: SKSpriteNode!
    var topPipe2: SKSpriteNode!
    
    var start = false
    var birdIsActive = false

    override public func didMove(to view: SKView) {
        
        // make sure the level was set properly
        // TODO: Refactor to ensure compile time safety
        guard let level = level else {
            fatalError("Level is not set!")
        }
        
        // add background
        backgroundNode = level.createBackgroundNode()
        backgroundNode.anchorPoint = CGPoint.zero
        backgroundColor = level.backgroundColor
        addChild(backgroundNode)
        
        // add floor
        floorNode1 = level.createFloorNode()
        floorNode1.anchorPoint = CGPoint.zero
        floorNode1.position = CGPoint(x: 0, y: 0)
        floorNode2 = level.createFloorNode()
        floorNode2.anchorPoint = CGPoint.zero
        floorNode2.position = CGPoint(x: floorNode1.size.width-1, y: 0)
        addChild(floorNode1)
        addChild(floorNode2)
        
        // add player
        playerNode = level.createPlayerNode()
        playerNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        playerNode.size.width = playerNode.size.width / 10
        playerNode.size.height = playerNode.size.height / 10
        addChild(playerNode)
        
        // add pipes        
        bottomPipe1 = level.createPipeBottomNode()
        bottomPipe1.size.height = bottomPipe1.size.height / 2
        bottomPipe1.size.width = bottomPipe1.size.width / 2
        bottomPipe1.position = CGPoint(x: 800,y: floorNode1.frame.height + bottomPipe1.size.height / 2)
        
        bottomPipe2 = level.createPipeBottomNode()
        bottomPipe2.size.height = bottomPipe2.size.height / 2
        bottomPipe2.size.width = bottomPipe2.size.width / 2
        bottomPipe2.position = CGPoint(x: 1600,y: floorNode1.frame.height + bottomPipe2.size.height / 2)
        
        topPipe1 = level.createPipeTopNode()
        topPipe1.size.height = topPipe1.size.height / 2
        topPipe1.size.width = topPipe1.size.width / 2
        topPipe1.position = CGPoint(x: 800,y: self.frame.height - topPipe1.size.height / 2)
        
        
        topPipe2 = level.createPipeTopNode()
        topPipe2.size.height = topPipe2.size.height / 2
        topPipe2.size.width = topPipe2.size.width / 2
        topPipe2.position = CGPoint(x: 1600,y: self.frame.height - topPipe2.size.height / 2)
        
        addChild(bottomPipe1)
        addChild(bottomPipe2)
        addChild(topPipe1)
        addChild(topPipe2)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        start = true
    }
    
    override public func update(_ currentTime: TimeInterval) {
        
        if start {
            let scrollSpeed: CGFloat = 4.0
            updateFloorPosition(currentTime, speed: scrollSpeed)
            updatePipePositions(currentTime, speed: scrollSpeed * 1.5)
        }
    }
    
    private func updateFloorPosition(_ currentTime: TimeInterval, speed: CGFloat) {
        floorNode1.position = CGPoint(x: floorNode1.position.x-speed, y: floorNode1.position.y)
        floorNode2.position = CGPoint(x: floorNode2.position.x-speed, y: floorNode2.position.y)
        
        let floorNode1IsNotVisibleAnymore = floorNode1.position.x < -floorNode1.size.width
        if (floorNode1IsNotVisibleAnymore) {
            floorNode1.position = CGPoint(x: floorNode2.position.x + floorNode2.size.width, y: floorNode1.position.y);
        }
        
        let floorNode2IsNotVisibleAnymore = floorNode2.position.x < -floorNode2.size.width
        if (floorNode2IsNotVisibleAnymore) {
            floorNode2.position = CGPoint(x: floorNode1.position.x + floorNode1.size.width, y: floorNode2.position.y);
        }
    }
    
    private func updatePipePositions(_ currentTime: TimeInterval, speed: CGFloat) {
        
        bottomPipe1.position = CGPoint(x: bottomPipe1.position.x-speed, y: bottomPipe1.position.y)
        bottomPipe2.position = CGPoint(x: bottomPipe2.position.x-speed,y: bottomPipe2.position.y)
        topPipe1.position = CGPoint(x: topPipe1.position.x-speed, y: topPipe1.position.y);
        topPipe2.position = CGPoint(x: topPipe2.position.x-speed, y: topPipe2.position.y);
    }
}

extension FlappyBirdScene: SKPhysicsContactDelegate {
    
}
