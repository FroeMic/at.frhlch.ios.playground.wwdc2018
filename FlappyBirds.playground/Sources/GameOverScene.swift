import SpriteKit

public class GameOverScene: SKScene {
    
    public var gameOverDelegate: GameOverDelegate?
    public var backgroundTexture: SKTexture?
    public var distance: CGFloat = 0.0
    
    
    fileprivate var isReady = false
    fileprivate var backgroundNode: SKSpriteNode!
    fileprivate var overlayNode: SKSpriteNode!
    fileprivate var gameOverNode: SKLabelNode!
    fileprivate var distanceNode: SKLabelNode!
    fileprivate var playAgainButton: SKShapeNode!
    
    override public func didMove(to view: SKView) {
        if !isReady {
            setupView()
            isReady = true
        }
        setDistanceLabel()
        setBackgroundTexture()
    }
    
    fileprivate func setupView() {
        backgroundNode = SKSpriteNode(color: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8), size: self.frame.size)
        backgroundNode.anchorPoint = CGPoint.zero
        addChild(backgroundNode)
        
        overlayNode = SKSpriteNode(color: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8), size: self.frame.size)
        overlayNode.anchorPoint = CGPoint.zero
        addChild(overlayNode)
        
        gameOverNode =  SKLabelNode(text: "GAME OVER")
        // TODO: find the proper way to set font weights on label nodes
        gameOverNode.fontName = "Heavy"
        gameOverNode.fontColor = UIColor.red
        gameOverNode.fontSize = 36.0
        gameOverNode.position = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.7)
        addChild(gameOverNode)
        
        distanceNode = SKLabelNode()
        // TODO: find the proper way to set font weights on label nodes
        distanceNode.fontName = "Medium"
        distanceNode.fontColor = UIColor.white
        distanceNode.fontSize = 28.0
        distanceNode.position = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.7 - 60)
        addChild(distanceNode)
        
        let playAgainButton = SKShapeNode(rectOf: CGSize(width: frame.width * 0.5, height: 50), cornerRadius: 25.0)
        playAgainButton.fillColor = UIColor.white
        playAgainButton.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.35)
        playAgainButton.name = "PLAY_AGAIN_BUTTON"
        addChild(playAgainButton)
        
        let playAgainButtonLabel = SKLabelNode(text: "START OVER")
        // TODO: find the proper way to set font weights on label nodes
        playAgainButtonLabel.fontName = "Bold"
        playAgainButtonLabel.fontColor = UIColor.black
        playAgainButtonLabel.fontSize = 20.0
        playAgainButtonLabel.position = CGPoint(x: 0 , y: -8)
        playAgainButtonLabel.name = "PLAY_AGAIN_BUTTON"
        playAgainButton.addChild(playAgainButtonLabel)
    }
    
    fileprivate func setDistanceLabel() {
        let distance = Int(self.distance/10.0)
        distanceNode.text = "Distance: \(distance) m"
    }
    
    fileprivate func setBackgroundTexture() {
        backgroundNode.texture = backgroundTexture
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "PLAY_AGAIN_BUTTON"
            {
                gameOverDelegate?.restartGame() {
                    print("COMPLETION")
                    self.removeFromParent()
                }
            }
        }
        
    }
    
}
