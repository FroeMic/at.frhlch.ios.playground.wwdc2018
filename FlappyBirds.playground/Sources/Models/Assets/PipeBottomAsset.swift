import SpriteKit

public class PipeBottomAsset: Asset {
    
    public let category: AssetCategory = .pipe
    public private(set) var assetUrl: String
    public private(set) var offsetX: CGFloat
    public private(set) var height: CGFloat
    
    public init (assetUrl: String, offsetX: CGFloat, height: CGFloat) {
        self.assetUrl = assetUrl
        self.offsetX = offsetX
        self.height = height
    }
    
    public var texture: SKTexture {
        return SKTexture(imageNamed: assetUrl)
    }
    
    public func createSKNode() -> SKSpriteNode {
        let pipeNode =  SKSpriteNode(imageNamed: assetUrl)
        
        pipeNode.size.width = pipeNode.size.width / 2
        pipeNode.size.height = height
        pipeNode.physicsBody?.categoryBitMask = category.categoryBitMask
        pipeNode.physicsBody?.contactTestBitMask = category.contactTestBitMask
        pipeNode.physicsBody = SKPhysicsBody(texture: texture, size: pipeNode.size)
        pipeNode.physicsBody?.isDynamic = false
        
        return pipeNode
    }
}

extension PipeBottomAsset {
    
    public class func greenPipe(offsetX: CGFloat, height: CGFloat) -> PipeBottomAsset {
        return PipeBottomAsset(assetUrl: "pipe_bottom_green.png", offsetX: offsetX, height: height)
    }
    
    public class func greyPipe(offsetX: CGFloat, height: CGFloat) -> PipeBottomAsset {
        return PipeBottomAsset(assetUrl: "pipe_bottom_grey.png", offsetX: offsetX, height: height)
    }
    
}


