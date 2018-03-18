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
    var pipeHeight: CGFloat = 200

    override public func didMove(to view: SKView) {
        
        // make sure the level was set properly
        // TODO: Refactor to ensure compile time safety
        guard let level = level else {
            fatalError("Level was not set!")
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
        bottomPipe1.position = CGPoint(x: 0,y: 200);
        bottomPipe1.size.height = bottomPipe1.size.height / 2
        bottomPipe1.size.width = bottomPipe1.size.width / 2
        
        bottomPipe2 = level.createPipeBottomNode()
        bottomPipe2.position = CGPoint(x: 1600,y: 200);
        bottomPipe2.size.height = bottomPipe2.size.height / 2
        bottomPipe2.size.width = bottomPipe2.size.width / 2
        
        topPipe1 = level.createPipeTopNode()
        topPipe1.position = CGPoint(x: 800,y: 1000);
        topPipe1.size.height = topPipe1.size.height / 2
        topPipe1.size.width = topPipe1.size.width / 2
        
        topPipe2 = level.createPipeBottomNode()
        topPipe2.position = CGPoint(x: 1600,y: 1000);
        topPipe2.size.height = topPipe2.size.height / 2
        topPipe2.size.width = topPipe2.size.width / 2
        
        addChild(bottomPipe1)
        addChild(bottomPipe2)
        addChild(topPipe1)
        addChild(topPipe2)
    }
    
    override public func update(_ currentTime: TimeInterval) {
        
        floorNode1.position = CGPoint(x: floorNode1.position.x-4, y: floorNode1.position.y);
        floorNode2.position = CGPoint(x: floorNode2.position.x-4, y: floorNode2.position.y);
        
        if (floorNode1.position.x < -floorNode1.size.width / 2){
            floorNode1.position = CGPoint(x: floorNode2.position.x + floorNode2.size.width, y: floorNode1.position.y);
        }
        
        if (floorNode2.position.x < -floorNode2.size.width / 2) {
            floorNode2.position = CGPoint(x: floorNode1.position.x + floorNode1.size.width, y: floorNode2.position.y);
        }
        
    }
    
}

extension FlappyBirdScene: SKPhysicsContactDelegate {
    
}
