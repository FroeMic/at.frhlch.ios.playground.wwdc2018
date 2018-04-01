public enum AssetCategory: UInt32 {
    
    case player     = 0b0001 // 0x1 << 0
    case pipe       = 0b0010 // 0x1 << 1
    case floor      = 0b0100 // 0x1 << 2
    case background = 0b1000 // 0x1 << 3
    
    public var categoryBitMask: UInt32 {
        return self.rawValue
    }
    
    public var contactTestBitMask: UInt32 {
        switch self {
        case .player:
            return AssetCategory.pipe.categoryBitMask | AssetCategory.floor.categoryBitMask
        case .pipe:
            return AssetCategory.player.categoryBitMask
        case .floor:
            return AssetCategory.player.categoryBitMask
        case .background:
            return 0
        }
    }

}
