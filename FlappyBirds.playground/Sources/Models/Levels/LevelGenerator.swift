import SpriteKit

fileprivate struct Pipes {
    let topPipes: [PipeTopAsset]
    let bottomPipes: [PipeBottomAsset]
}

public class LevelGenerator {
    
    // MARK: Public Variables
    public var topPipes: [PipeTopAsset] = []
    public var bottomPipes: [PipeBottomAsset] = []
    
    // Configuration
    public var startPosition: CGFloat = 500.0
    public var length: CGFloat = 10000.0
    public var viewHeight: CGFloat = 467.0
    public var minimumVerticalDistanceBetweenPipes: CGFloat = 150.0
    public var miniumPipeHeight: CGFloat = 100.0
    // increase the possibility of easy positions by
    // adding them multiple times to the array
    public var possibleHorizontalDistances: [CGFloat] = [
        600.0,
        400.0, 400.0, 400.0, 400.0,
        300.0, 300.0, 300.0,
        200.0
    ]
    public var createBottomAsset: (_ offsetX: CGFloat, _ height: CGFloat) -> PipeBottomAsset = PipeBottomAsset.greyPipe
    public var createTopAsset: (_ offsetX: CGFloat, _ height: CGFloat) -> PipeTopAsset = PipeTopAsset.greyPipe
    

    // MARK: Private Variables
    fileprivate var maximumHeightofTopPipe: CGFloat {
        return viewHeight - (miniumPipeHeight + minimumVerticalDistanceBetweenPipes)
    }
    
    // MARK: Public Methods
    public func generateLevel() {
        let pipes = generatePipes()
        topPipes = pipes.topPipes
        bottomPipes = pipes.bottomPipes
    }
    
    // MARK: Private Methods
    fileprivate func generatePipes()  -> Pipes {
        var currentPosition: CGFloat = startPosition
        var bottomPipes: [PipeBottomAsset] = []
        var topPipes: [PipeTopAsset] = []
        while currentPosition < length {
            
            // calculate pipe heights
            let pipeTopHeight = randBetween(miniumPipeHeight, maximumHeightofTopPipe)
            let maximumHeightOfBottomPipe = viewHeight - (pipeTopHeight + minimumVerticalDistanceBetweenPipes)
            let pipeBottomHeight = randBetween(miniumPipeHeight, maximumHeightOfBottomPipe)
            
            topPipes.append(createTopAsset(currentPosition, pipeTopHeight))
            bottomPipes.append(createBottomAsset(currentPosition, pipeBottomHeight))
            
            // calculate x offset
            let index = Int(randBetween(0, CGFloat(possibleHorizontalDistances.count)))
            let distanceOffset = possibleHorizontalDistances[index]
            currentPosition += distanceOffset
        }
        
        return Pipes(topPipes: topPipes, bottomPipes: bottomPipes)
    }
    
    fileprivate func randBetween(_ lower: CGFloat, _ upper: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(upper-lower))) + lower
    }
    
    public init() {
        
    }
}
