import SpriteKit

public protocol Level {
    
    var length: CGFloat { get }
    var basisSpeed: CGFloat { get }
    var player: PlayerAsset { get }
    var background: BackgroundAsset { get }
    var floor: FloorAsset { get }
    var bottomPipes: [PipeBottomAsset] { get }
    var topPipes:  [PipeTopAsset] { get }
        
}

