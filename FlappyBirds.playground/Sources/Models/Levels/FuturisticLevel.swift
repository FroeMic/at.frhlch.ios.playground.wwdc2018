import SpriteKit

public class FuturisticLevel: Level {
    
    public var length: CGFloat = 6000.0
    public var basisSpeed: CGFloat = 2.0
    
    public let player: PlayerAsset = PlayerAsset.futuristicBird()
    public let background: BackgroundAsset = BackgroundAsset.futuristicBackground()
    public let floor: FloorAsset = FloorAsset.concreteFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.greyPipe(offsetX: 800.0, height: 120.0),
        PipeBottomAsset.greyPipe(offsetX: 1200.0, height: 180.0),
        PipeBottomAsset.greyPipe(offsetX: 2000.0, height: 180.0),
        PipeBottomAsset.greyPipe(offsetX: 3200.0, height: 150.0)
    ]
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.greyPipe(offsetX: 800.0, height: 200.0),
        PipeTopAsset.greyPipe(offsetX: 1200.0, height: 150.0),
        PipeTopAsset.greyPipe(offsetX: 2000.0, height: 100.0),
        PipeTopAsset.greyPipe(offsetX: 3200.0, height: 130.0)
    ]
    
    public init() { }
}
