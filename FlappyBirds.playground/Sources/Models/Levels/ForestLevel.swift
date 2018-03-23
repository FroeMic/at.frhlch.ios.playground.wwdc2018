import SpriteKit

public class ForestLevel: Level {
    
    public var length: CGFloat = 6000.0
    public var basisSpeed: CGFloat = 2.0
    
    public let player: PlayerAsset = PlayerAsset.blueBird()
    public let background: BackgroundAsset = BackgroundAsset.forestBackground()
    public let floor: FloorAsset = FloorAsset.grassFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.greenPipe(offsetX: 800.0, height: 140.0),
        PipeBottomAsset.greenPipe(offsetX: 1200.0, height: 150.0),
        PipeBottomAsset.greenPipe(offsetX: 1400.0, height: 100.0),
        PipeBottomAsset.greenPipe(offsetX: 1600.0, height: 200.0),
        PipeBottomAsset.greenPipe(offsetX: 2000.0, height: 300),
        PipeBottomAsset.greenPipe(offsetX: 2200.0, height: 250),
        PipeBottomAsset.greenPipe(offsetX: 2400.0, height: 200.0),
        PipeBottomAsset.greenPipe(offsetX: 3200.0, height: 150.0)
    ]
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.greenPipe(offsetX: 800.0, height: 180.0),
        PipeTopAsset.greenPipe(offsetX: 1200.0, height: 150.0),
        PipeTopAsset.greenPipe(offsetX: 1400.0, height: 200.0),
        PipeTopAsset.greenPipe(offsetX: 1600.0, height: 150.0),
        PipeTopAsset.greenPipe(offsetX: 2000.0, height: 50.0),
        PipeTopAsset.greenPipe(offsetX: 2200.0, height: 100.0),
        PipeTopAsset.greenPipe(offsetX: 2400.0, height: 150.0),
        PipeTopAsset.greenPipe(offsetX: 3200.0, height: 150.0)
    ]
    
    public init() { }
}
