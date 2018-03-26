import SpriteKit

public class GameScene: SKScene {
    
    public var level: Level!
    public var gameOverDelegate: GameOverDelegate?
    
    fileprivate let jumpSoundAction = SKAction.playSoundFileNamed("sound_jump.wav", waitForCompletion: false)
    fileprivate let gameoverSoundAction = SKAction.playSoundFileNamed("sound_game_over.wav", waitForCompletion: false)
        
    fileprivate var distance: CGFloat = 0.0
    fileprivate var impulse: CGFloat = 100.0
    fileprivate var started = false
    fileprivate var gameover = false
    fileprivate var playerIsActive = false
    
    fileprivate var backgroundNode: SKSpriteNode!
    fileprivate var floorNode1: SKSpriteNode!
    fileprivate var floorNode2: SKSpriteNode!
    fileprivate var playerNode: SKSpriteNode!
    fileprivate var bottomPipes: [SKSpriteNode]!
    fileprivate var topPipes: [SKSpriteNode]!
    
    override public func didMove(to view: SKView) {
        // make sure the level was set properly
        // TODO: Refactor to ensure compile time safety
        guard let level = level else {
            fatalError("Level is not set!")
        }
        
        initBackgroundNode()
        initFloorNodes()
        initPlayerNode()
        initBottomPipeNodes()
        initTopPipeNodes()
        
        // Add physics delegate
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        impulse = (impulse / 4.0) * level.basisSpeed
    }
    
    public func resetGame() {
        removeAllChildren()
        physicsBody = nil
        physicsWorld.contactDelegate = nil
        distance = 0.0
        impulse = 100.0
        started = false
        gameover = false
        playerIsActive = false
    }
    
    private func initBackgroundNode() {
        backgroundColor = level.background.backgroundColor
        backgroundNode = level.background.createSKNode()
        backgroundNode.anchorPoint = CGPoint.zero
        addChild(backgroundNode)
    }
    
    private func initFloorNodes() {
        floorNode1 = level.floor.createSKNode()
        floorNode1.anchorPoint = CGPoint.zero
        floorNode1.position = CGPoint(x: 0, y: 0)
        addChild(floorNode1)

        floorNode2 = level.floor.createSKNode()
        floorNode2.anchorPoint = CGPoint.zero
        floorNode2.position = CGPoint(x: floorNode1.frame.width-1, y: 0)
        addChild(floorNode2)

    }
    
    private func initPlayerNode() {
        playerNode =  level.player.createSKNode()
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playerNode)
    }
    
    private func initBottomPipeNodes() {
        bottomPipes = []
        for pipe in level.bottomPipes {
            let pipeNode = pipe.createSKNode()
            pipeNode.position = CGPoint(x: pipe.offsetX, y: floorNode1.frame.height + pipeNode.size.height / 2)
            bottomPipes.append(pipeNode)
            addChild(pipeNode)
        }
    }
    
    private func initTopPipeNodes() {
        topPipes = []
        for pipe in level.topPipes {
            let pipeNode = pipe.createSKNode()
            pipeNode.position = CGPoint(x: pipe.offsetX, y: frame.height - pipeNode.size.height / 2)
            topPipes.append(pipeNode)
            addChild(pipeNode)
        }
    }
    
    private func createPlayerPhysics() {
        
        playerNode.physicsBody = SKPhysicsBody(texture: level!.player.texture, size: playerNode.size)
        
        playerNode.physicsBody?.linearDamping = 1.2
        playerNode.physicsBody?.restitution = 0
        
        playerNode.physicsBody?.categoryBitMask =  AssetCategory.player.categoryBitMask
        playerNode.physicsBody?.contactTestBitMask =  AssetCategory.player.contactTestBitMask
        
        playerIsActive = true
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameover {
            return
        }
        
        started = true
            
        if !playerIsActive {
            createPlayerPhysics()
            return
        }
        
        playerNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: impulse))
        run(jumpSoundAction)
    }
    
    override public func update(_ currentTime: TimeInterval) {
        if started {
            
            let scrollSpeed: CGFloat = level?.basisSpeed ?? 4.0
            distance += scrollSpeed
            
            updateFloorPosition(currentTime, speed: scrollSpeed)
            updatePipePositions(currentTime, speed: scrollSpeed * 1.5)
            
            playerNode.position.x = self.frame.width / 2
            playerNode.physicsBody?.allowsRotation = false
            playerNode.isPaused = false
        }
    }
    
    fileprivate func updateFloorPosition(_ currentTime: TimeInterval, speed: CGFloat) {
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
    
    fileprivate func updatePipePositions(_ currentTime: TimeInterval, speed: CGFloat) {
        for pipeNode in bottomPipes {
            pipeNode.position = CGPoint(x: pipeNode.position.x-speed,  y: pipeNode.position.y)
        }
        for pipeNode in topPipes {
            pipeNode.position = CGPoint(x: pipeNode.position.x-speed,  y: pipeNode.position.y)
        }
    }

}

extension GameScene: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        if gameover {
            return
        }
        
        gameover = true
        started = false
        playerNode.isPaused = true
        
        run(gameoverSoundAction)
        gameOverDelegate?.gameOver(distance: distance)

    }
}
