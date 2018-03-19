import SpriteKit

public class PlayerAsset: Asset {

    public let category: AssetCategory = .pipe
    public private(set) var assetUrl: String
    private var textureAtlas: SKTextureAtlas

    public init (assetUrl: String) {
        self.assetUrl = assetUrl
        textureAtlas = SKTextureAtlas.createTextureAtlas(named: assetUrl)
    }
    
    public var texture: SKTexture {
        return textureAtlas.textures[0]
    }

    public func createSKNode() -> SKSpriteNode {
        // create node
        let playerNode = SKSpriteNode(texture: texture)

        // add animation
        let animateBird = SKAction.animate(with: textureAtlas.textures, timePerFrame: 0.1)
        let repeatAction = SKAction.repeatForever(animateBird)
        playerNode.run(repeatAction)
        
        // resize
        playerNode.size.width = playerNode.size.width / 10
        playerNode.size.height = playerNode.size.height / 10
        
        return playerNode
    }

}

extension PlayerAsset {

    public class func blueBird() -> PlayerAsset {
        return PlayerAsset(assetUrl: "player_default.atlas")
    }

}


