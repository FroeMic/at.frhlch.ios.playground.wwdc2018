import SpriteKit

public class BeachLevel: Level {
    
    public var basisSpeed: CGFloat = 2.0
    public var length: CGFloat = 500.0 //6100.0
    
    public let player: PlayerAsset = PlayerAsset.pinkBird()
    public let background: BackgroundAsset = BackgroundAsset.beachBackground()
    public let floor: FloorAsset = FloorAsset.beachFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.yellowPipe(offsetX: 1400.0, height: 200.0),
        PipeBottomAsset.yellowPipe(offsetX: 1500.0, height: 250.0),
        PipeBottomAsset.yellowPipe(offsetX: 1600.0, height: 300.0),
        PipeBottomAsset.yellowPipe(offsetX: 2000.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 2200.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 2400.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 2800.0, height: 140.0),
        PipeBottomAsset.yellowPipe(offsetX: 3200.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 3400.0, height: 100.0),
        PipeBottomAsset.yellowPipe(offsetX: 3600.0, height: 200.0),
        PipeBottomAsset.yellowPipe(offsetX: 4000.0, height: 300.0),
        PipeBottomAsset.yellowPipe(offsetX: 4200.0, height: 250.0),
        PipeBottomAsset.yellowPipe(offsetX: 4400.0, height: 200.0),
        PipeBottomAsset.yellowPipe(offsetX: 5000.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 5100.0, height: 100.0),
        PipeBottomAsset.yellowPipe(offsetX: 5200.0, height: 50.0),
        PipeBottomAsset.yellowPipe(offsetX: 5600.0, height: 150.0),
        PipeBottomAsset.yellowPipe(offsetX: 5800.0, height: 200.0),
        PipeBottomAsset.yellowPipe(offsetX: 6000.0, height: 150.0),
        
    ]
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.yellowPipe(offsetX: 700.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 800.0, height: 250.0),
        PipeTopAsset.yellowPipe(offsetX: 900.0, height: 300.0),
        PipeTopAsset.yellowPipe(offsetX: 2000.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 2200.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 2400.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 2800.0, height: 180.0),
        PipeTopAsset.yellowPipe(offsetX: 3200.0, height: 150.0),
        PipeTopAsset.yellowPipe(offsetX: 3400.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 3600.0, height: 150.0),
        PipeTopAsset.yellowPipe(offsetX: 4000.0, height: 50.0),
        PipeTopAsset.yellowPipe(offsetX: 4200.0, height: 100.0),
        PipeTopAsset.yellowPipe(offsetX: 4400.0, height: 150.0),
        PipeTopAsset.yellowPipe(offsetX: 5000.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 5100.0, height: 250.0),
        PipeTopAsset.yellowPipe(offsetX: 5200.0, height: 300.0),
        PipeTopAsset.yellowPipe(offsetX: 5600.0, height: 200.0),
        PipeTopAsset.yellowPipe(offsetX: 5800.0, height: 150.0),
        PipeTopAsset.yellowPipe(offsetX: 6000.0, height: 200.0),
    ]
    
    public init() { }
}

