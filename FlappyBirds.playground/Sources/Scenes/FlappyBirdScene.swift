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
    
    let birdCategory: UInt32 = 0x1 << 0
    let pipeCategory: UInt32 = 0x1 << 1
    let floorCategory: UInt32 = 0x1 << 2

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
        
        // Add physics delegate
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self

        floorNode1.physicsBody?.categoryBitMask = floorCategory
        floorNode1.physicsBody?.contactTestBitMask = birdCategory
        floorNode2.physicsBody?.categoryBitMask = floorCategory
        floorNode2.physicsBody?.contactTestBitMask = birdCategory
        
        bottomPipe1.physicsBody?.categoryBitMask = pipeCategory
        bottomPipe1.physicsBody?.contactTestBitMask = birdCategory
        
        bottomPipe2.physicsBody?.categoryBitMask = pipeCategory
        bottomPipe2.physicsBody?.contactTestBitMask = birdCategory
        
        topPipe1.physicsBody?.categoryBitMask = pipeCategory
        topPipe1.physicsBody?.contactTestBitMask = birdCategory
        
        topPipe2.physicsBody?.categoryBitMask = pipeCategory
        topPipe2.physicsBody?.contactTestBitMask = birdCategory
        
        bottomPipe1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: level.pipeBottomImageUrl), size: self.bottomPipe1.size)
        
        bottomPipe2.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: level.pipeBottomImageUrl), size: self.bottomPipe2.size)
        
        topPipe1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: level.pipeTopImageUrl), size: self.topPipe1.size)
        
        topPipe2.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: level.pipeTopImageUrl), size: self.topPipe2.size)
        
        floorNode1.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 0, width: floorNode2.frame.width, height: floorNode2.frame.height - 20))
        floorNode2.physicsBody = SKPhysicsBody(edgeLoopFrom: floorNode2.frame)

        bottomPipe1.physicsBody?.isDynamic = false
        bottomPipe2.physicsBody?.isDynamic = false
        topPipe1.physicsBody?.isDynamic = false
        topPipe2.physicsBody?.isDynamic = false
        floorNode1.physicsBody?.isDynamic = false

    }
    

    func createBirdPhysics() {
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.playerNode.size.width / 2))
        
        playerNode.physicsBody?.linearDamping = 1.2
        playerNode.physicsBody?.restitution = 0
        
        playerNode.physicsBody?.categoryBitMask = birdCategory
        playerNode.physicsBody?.contactTestBitMask = pipeCategory | floorCategory
        
        birdIsActive = true
        
    }

    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        start = true
        
        if (birdIsActive) {
            self.playerNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 150))
        } else {
            createBirdPhysics()
        }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        
        if start {
            let scrollSpeed: CGFloat = 4.0
            updateFloorPosition(currentTime, speed: scrollSpeed)
            updatePipePositions(currentTime, speed: scrollSpeed * 1.5)
            
            playerNode.position.x = self.frame.width / 2
            playerNode.physicsBody?.allowsRotation = false
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
    
    public func didBegin(_ contact: SKPhysicsContact) {
        //GAMEOVER = TRUE
        start = false
        print("BIRD HAS MADE CONTACT")
    }
}
