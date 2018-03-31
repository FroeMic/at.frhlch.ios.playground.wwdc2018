import SpriteKit

public class ForestLevel: Level {
    
    public var length: CGFloat = 12000.0
    public var basisSpeed: CGFloat = 2.0
    
    public let player: PlayerAsset = PlayerAsset.pinkBird()
    public let background: BackgroundAsset = BackgroundAsset.forestBackground()
    public let floor: FloorAsset = FloorAsset.grassFloor()
    public let bottomPipes: [PipeBottomAsset] = [
        PipeBottomAsset.greenPipe(offsetX: 500.0, height: 147.0),
        PipeBottomAsset.greenPipe(offsetX: 800.0, height: 123.0),
        PipeBottomAsset.greenPipe(offsetX: 1100.0, height: 106.0),
        PipeBottomAsset.greenPipe(offsetX: 1500.0, height: 122.0),
        PipeBottomAsset.greenPipe(offsetX: 1900.0, height: 115.0),
        PipeBottomAsset.greenPipe(offsetX: 2100.0, height: 179.0),
        PipeBottomAsset.greenPipe(offsetX: 2400.0, height: 100.0),
        PipeBottomAsset.greenPipe(offsetX: 2800.0, height: 190.0),
        PipeBottomAsset.greenPipe(offsetX: 3200.0, height: 113.0),
        PipeBottomAsset.greenPipe(offsetX: 3500.0, height: 165.0),
        PipeBottomAsset.greenPipe(offsetX: 3800.0, height: 136.0),
        PipeBottomAsset.greenPipe(offsetX: 4100.0, height: 107.0),
        PipeBottomAsset.greenPipe(offsetX: 4400.0, height: 103.0),
        PipeBottomAsset.greenPipe(offsetX: 5000.0, height: 147.0),
        PipeBottomAsset.greenPipe(offsetX: 5600.0, height: 117.0),
        PipeBottomAsset.greenPipe(offsetX: 5800.0, height: 133.0),
        PipeBottomAsset.greenPipe(offsetX: 6200.0, height: 109.0),
        PipeBottomAsset.greenPipe(offsetX: 6400.0, height: 106.0),
        PipeBottomAsset.greenPipe(offsetX: 6800.0, height: 114.0),
        PipeBottomAsset.greenPipe(offsetX: 7100.0, height: 111.0),
        PipeBottomAsset.greenPipe(offsetX: 7500.0, height: 185.0),
        PipeBottomAsset.greenPipe(offsetX: 7900.0, height: 117.0),
        PipeBottomAsset.greenPipe(offsetX: 8500.0, height: 115.0),
        PipeBottomAsset.greenPipe(offsetX: 8800.0, height: 142.0),
        PipeBottomAsset.greenPipe(offsetX: 9200.0, height: 157.0),
        PipeBottomAsset.greenPipe(offsetX: 9600.0, height: 102.0),
        PipeBottomAsset.greenPipe(offsetX: 9800.0, height: 188.0),
        PipeBottomAsset.greenPipe(offsetX: 10200.0, height: 172.0),
        PipeBottomAsset.greenPipe(offsetX: 10600.0, height: 100.0),
        PipeBottomAsset.greenPipe(offsetX: 10900.0, height: 100.0),
        PipeBottomAsset.greenPipe(offsetX: 11500.0, height: 178.0),
        PipeBottomAsset.greenPipe(offsetX: 11900.0, height: 151.0),
    ]
    
    public let topPipes: [PipeTopAsset] = [
        PipeTopAsset.greenPipe(offsetX: 500.0, height: 177.0),
        PipeTopAsset.greenPipe(offsetX: 800.0, height: 197.0),
        PipeTopAsset.greenPipe(offsetX: 1100.0, height: 200.0),
        PipeTopAsset.greenPipe(offsetX: 1500.0, height: 207.0),
        PipeTopAsset.greenPipe(offsetX: 1900.0, height: 218.0),
        PipeTopAsset.greenPipe(offsetX: 2100.0, height: 114.0),
        PipeTopAsset.greenPipe(offsetX: 2400.0, height: 240.0),
        PipeTopAsset.greenPipe(offsetX: 2800.0, height: 118.0),
        PipeTopAsset.greenPipe(offsetX: 3200.0, height: 179.0),
        PipeTopAsset.greenPipe(offsetX: 3500.0, height: 135.0),
        PipeTopAsset.greenPipe(offsetX: 3800.0, height: 186.0),
        PipeTopAsset.greenPipe(offsetX: 4100.0, height: 191.0),
        PipeTopAsset.greenPipe(offsetX: 4400.0, height: 235.0),
        PipeTopAsset.greenPipe(offsetX: 5000.0, height: 147.0),
        PipeTopAsset.greenPipe(offsetX: 5600.0, height: 140.0),
        PipeTopAsset.greenPipe(offsetX: 5800.0, height: 194.0),
        PipeTopAsset.greenPipe(offsetX: 6200.0, height: 226.0),
        PipeTopAsset.greenPipe(offsetX: 6400.0, height: 232.0),
        PipeTopAsset.greenPipe(offsetX: 6800.0, height: 180.0),
        PipeTopAsset.greenPipe(offsetX: 7100.0, height: 230.0),
        PipeTopAsset.greenPipe(offsetX: 7500.0, height: 109.0),
        PipeTopAsset.greenPipe(offsetX: 7900.0, height: 166.0),
        PipeTopAsset.greenPipe(offsetX: 8500.0, height: 196.0),
        PipeTopAsset.greenPipe(offsetX: 8800.0, height: 161.0),
        PipeTopAsset.greenPipe(offsetX: 9200.0, height: 178.0),
        PipeTopAsset.greenPipe(offsetX: 9600.0, height: 237.0),
        PipeTopAsset.greenPipe(offsetX: 9800.0, height: 123.0),
        PipeTopAsset.greenPipe(offsetX: 10200.0, height: 133.0),
        PipeTopAsset.greenPipe(offsetX: 10600.0, height: 211.0),
        PipeTopAsset.greenPipe(offsetX: 10900.0, height: 137.0),
        PipeTopAsset.greenPipe(offsetX: 11500.0, height: 155.0),
        PipeTopAsset.greenPipe(offsetX: 11900.0, height: 113.0),
        ]

    
    public init() { }
}
