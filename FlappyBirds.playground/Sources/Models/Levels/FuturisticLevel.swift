import SpriteKit

public class FuturisticLevel: Level {
    
    public var length: CGFloat = 6000.0
    public var basisSpeed: CGFloat = 2.5
    
    public let player: PlayerAsset = PlayerAsset.futuristicBird()
    public let background: BackgroundAsset = BackgroundAsset.futuristicBackground()
    public let floor: FloorAsset = FloorAsset.concreteFloor()
    public let bottomPipes: [PipeBottomAsset]
    public let topPipes: [PipeTopAsset]
    
    public init(generator: LevelGenerator = LevelGenerator()) {
        
        generator.generateLevel()
        
        self.length = generator.length
        self.bottomPipes = generator.bottomPipes
        self.topPipes = generator.topPipes
        
    }
}
