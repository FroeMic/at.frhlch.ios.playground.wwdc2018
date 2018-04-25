import SpriteKit

public class FloorAsset: Asset {
    
    public let category: AssetCategory = .floor
    public private(set) var assetUrl: String
    
    public init (assetUrl: String) {
        self.assetUrl = assetUrl
    }
    
    public func createSKNode() -> SKSpriteNode {
        let offsetToAllowBirdToFallIntoGrassAndNotHoverAboveIt: CGFloat = -20
        let floorNode = SKSpriteNode(imageNamed: assetUrl)
        floorNode.size.height = 175.0
        floorNode.physicsBody?.categoryBitMask = category.categoryBitMask
        floorNode.physicsBody?.contactTestBitMask = category.contactTestBitMask
        floorNode.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 0, width: floorNode.frame.width, height: floorNode.frame.height + offsetToAllowBirdToFallIntoGrassAndNotHoverAboveIt))
        floorNode.physicsBody?.isDynamic = false
        
        return floorNode
    }
}

extension FloorAsset {
    
    public class func grassFloor() -> FloorAsset {
        return FloorAsset(assetUrl: "floor_grass.png")
    }
    
    public class func concreteFloor() -> FloorAsset {
        return FloorAsset(assetUrl: "floor_concrete.png")
    }
    
    public class func beachFloor() -> FloorAsset {
        return FloorAsset(assetUrl: "floor_beach.png")
    }
    
}


