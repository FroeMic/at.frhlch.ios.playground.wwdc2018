import SpriteKit

public class BeachLevel: Level {
    
    public var length: CGFloat = 1000.0
    public var basisSpeed: CGFloat = 2.0
    
    public let player: PlayerAsset = PlayerAsset.blueBird()
    public let background: BackgroundAsset = BackgroundAsset.beachBackground()
    public let floor: FloorAsset = FloorAsset.beachFloor()
    public let bottomPipes: [PipeBottomAsset] = [
//        PipeBottomAsset.yellowPipe(offsetX: 800.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 1600.0, height: 200.0),
        PipeBottomAsset.yellowPipe(offsetX: 3200.0, height: 150.0)
    ]
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.yellowPipe(offsetX: 800.0, height: 200.0),
//        PipeTopAsset.yellowPipe(offsetX: 1600.0, height: 150.0),
        PipeTopAsset.yellowPipe(offsetX: 3200.0, height: 150.0)
    ]
    
    public init() { }
}

