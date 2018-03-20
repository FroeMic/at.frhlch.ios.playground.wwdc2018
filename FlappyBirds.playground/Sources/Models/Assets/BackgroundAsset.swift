import SpriteKit

public class BackgroundAsset: Asset {
    
    public let category: AssetCategory = .background
    
    public private(set) var assetUrl: String
    public private(set) var backgroundColor: SKColor
    
    public init (assetUrl: String, backgroundColor: SKColor) {
        self.assetUrl = assetUrl
        self.backgroundColor = backgroundColor
    }
}

extension BackgroundAsset {
    
    public class func forestBackground() -> BackgroundAsset {
        return BackgroundAsset(assetUrl: "background_forest.png", backgroundColor: SKColor(displayP3Red: 0.78, green: 0.98, blue: 1.00, alpha: 1.00))
    }
    
    public class func futuristicBackground() -> BackgroundAsset {
        return BackgroundAsset(assetUrl: "background_futuristic.png", backgroundColor: SKColor(displayP3Red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00))
    }
}
