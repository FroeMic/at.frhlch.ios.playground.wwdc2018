import SpriteKit

public protocol Level {
    var backgroundColor: SKColor { get }
    var backgroundImageUrl: String  { get }
    var floorImageUrl: String { get }
    var pipeBottomImageUrl: String { get }
    var pipeTopImageUrl: String { get }
    var playerAtlasUrl: String { get }
}

// MARK: Computed properties
extension Level {
    public func createBackgroundNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: backgroundImageUrl)
    }
    public func createFloorNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: floorImageUrl)
    }
    public func createPipeBottomNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: pipeBottomImageUrl)
    }
    public func createPipeTopNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: pipeTopImageUrl)
    }
    public func createPlayerNode() -> SKSpriteNode {
        // load atlas
        let playerAtlas = SKTextureAtlas.createTextureAtlas(named: playerAtlasUrl)
        
        // create node
        let playerNode = SKSpriteNode(texture: playerAtlas.textures[0])
        
        // add animation
        let animateBird = SKAction.animate(with: playerAtlas.textures, timePerFrame: 0.1)
        let repeatAction = SKAction.repeatForever(animateBird)
        playerNode.run(repeatAction)
        
        return playerNode
    }
}

// MARK: Default values
extension Level {
    public var backgroundColor: SKColor {
        return SKColor(displayP3Red: 80.0/255.0, green: 192.0/255.0, blue: 203.0/255.0, alpha: 1.0)
    }
    public var backgroundImageUrl: String {
        return "background_forest.png"
    }
    public var floorImageUrl: String {
        return "floor_grass.png"
    }
    public var pipeBottomImageUrl: String {
        return "pipe_bottom_green.png"
    }
    public var playerAtlasUrl: String {
        return "player_default.atlas"
    }
}
