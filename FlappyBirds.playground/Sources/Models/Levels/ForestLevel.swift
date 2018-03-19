import SpriteKit

public class ForestLevel: Level {
    
    public var length: CGFloat = 6000.0
    public var basisSpeed: CGFloat = 4.0
    
    public let player: PlayerAsset = PlayerAsset.blueBird()
    public let background: BackgroundAsset = BackgroundAsset.forestBackground()
    public let floor: FloorAsset = FloorAsset.grassFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.greenPipe(offsetX: 800.0, height: 150.0),
        PipeBottomAsset.greenPipe(offsetX: 1600.0, height: 200.0),
        PipeBottomAsset.greenPipe(offsetX: 3200.0, height: 150.0)
    ]
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.greenPipe(offsetX: 800.0, height: 200.0),
        PipeTopAsset.greenPipe(offsetX: 1600.0, height: 150.0),
        PipeTopAsset.greenPipe(offsetX: 3200.0, height: 150.0)
    ]
    
    public init() { }
}
