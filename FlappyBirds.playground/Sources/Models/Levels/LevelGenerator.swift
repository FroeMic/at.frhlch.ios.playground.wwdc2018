import SpriteKit

fileprivate struct Pipes {
    // private struct for more expressive code within the LevelGenerator class
    let topPipes: [PipeTopAsset]
    let bottomPipes: [PipeBottomAsset]
}

public class LevelGenerator {
    
    // MARK: Public Variables
    
    /**
     * The generated `TopPipes`.
     */
    public private(set) var topPipes: [PipeTopAsset] = []
    
    /**
     * The generated `BottomPipes`.
     */
    public private(set) var bottomPipes: [PipeBottomAsset] = []
    
    // Configuration
    /**
     * The initial `offsetX` of the first pipe.
     */
    public var startPosition: CGFloat = 500.0
    
    /**
     * The length of the total `length` of the level.
     */
    public var length: CGFloat = 10000.0
    
    /**
     * The height of "playable" view.
     *
     * **Note:** You need to substract the height
     * of the floor from the total view height.
     */
    public var viewHeight: CGFloat = 492.0
    
    /**
     * The minimal distance that each pair of
     * pipes (top, bottom) should have between them.
     */
    public var minimumVerticalDistanceBetweenPipes: CGFloat = 150.0
    
    /**
     * The minimum height of any pipe.
     */
    public var miniumPipeHeight: CGFloat = 100.0
    

    /**
     * An array of possible horizontal distances between
     * pairs of pipes.
     *
     * The `LevelGenerator` will randomly select one of
     * the values to place the "next" pair of pipes.
     *
     * Increase the possibility for certain distances by
     * adding them multiple times to the array.
     */
    public var possibleHorizontalDistances: [CGFloat] = [
        600.0,
        400.0, 400.0, 400.0, 400.0,
        300.0, 300.0, 300.0,
        200.0
    ]
    
    /**
     * A factory function for creating a `BottomAsset`.
     */
    public var createBottomAsset: (_ offsetX: CGFloat, _ height: CGFloat) -> PipeBottomAsset = PipeBottomAsset.greyPipe
    
    /**
     * A factory function for creating a `TopAsset`.
     */
    public var createTopAsset: (_ offsetX: CGFloat, _ height: CGFloat) -> PipeTopAsset = PipeTopAsset.greyPipe
    

    // MARK: Private Variables
    fileprivate var maximumHeightofTopPipe: CGFloat {
        return viewHeight - (miniumPipeHeight + minimumVerticalDistanceBetweenPipes)
    }
    
    // MARK: Public Methods
    
    /**
     * Generates a new random layout of `BottomPipes`
     * and `TopPipes` and assigns it to the `topPipes`
     * and `bottomPipes` arrays of this class.
     */
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
