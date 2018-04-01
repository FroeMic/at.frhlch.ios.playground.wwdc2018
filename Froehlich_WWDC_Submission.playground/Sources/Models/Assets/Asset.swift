import SpriteKit

public protocol Asset {
    var assetUrl: String { get }
    var category: AssetCategory { get }
}

extension Asset {
    public var texture: SKTexture {
        return SKTexture(imageNamed: assetUrl)
    }
    
    public func createSKNode() -> SKSpriteNode {
        return SKSpriteNode(imageNamed: assetUrl)
    }
}

