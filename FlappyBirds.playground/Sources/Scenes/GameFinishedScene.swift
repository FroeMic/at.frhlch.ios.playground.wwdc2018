import SpriteKit

public class GameFinishedScene: SKScene {
    
    // MARK: Constants
    fileprivate static let playAgainButtonName: String = "PLAY_AGAIN_BUTTON"
    
    // MARK: Public Variables
    public var gameDelegate: GameDelegate?
    public var backgroundTexture: SKTexture?
    public var distance: CGFloat = 0.0
    
    // MARK: Private Variables
    fileprivate var isReady = false
    fileprivate var backgroundNode: SKSpriteNode!
    fileprivate var overlayNode: SKSpriteNode!
    fileprivate var congratsNode: SKLabelNode!
    fileprivate var crownNode: SKSpriteNode!
    fileprivate var distanceNode: SKLabelNode!
    fileprivate var playAgainButton: SKShapeNode!
    
    // MARK: Lifecycle
    override public func didMove(to view: SKView) {
        if !isReady {
            setupView()
            isReady = true
        }
        
        setDistanceLabel()
        setBackgroundTexture()
    }
    
    fileprivate func setupView() {
        setupBackground()
        setupCrownNode()
        setupCongratsLabel()
        setupDistanceLabel()
        setupPlayAgainButton()
    }
    
    fileprivate func setDistanceLabel() {
        let distance = Int(self.distance/10.0)
        distanceNode.text = "Distance: \(distance) m"
    }
    
    fileprivate func setBackgroundTexture() {
        backgroundNode.texture = backgroundTexture
    }
    
    // MARK: User Interaction
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch: UITouch = touches.first else {
            return
        }
        
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        guard let nodeName = touchedNode.name else {
            return
        }
        
        if nodeName != GameFinishedScene.playAgainButtonName {
            return
        }
        
        gameDelegate?.restartGame() {
            self.removeFromParent()
        }
    }
    
}

// MARK: View Setup
extension GameFinishedScene {
    
    fileprivate func setupBackground() {
        backgroundNode = SKSpriteNode(color: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8), size: self.frame.size)
        backgroundNode.anchorPoint = CGPoint.zero
        addChild(backgroundNode)
        
        overlayNode = SKSpriteNode(color: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8), size: self.frame.size)
        overlayNode.anchorPoint = CGPoint.zero
        addChild(overlayNode)
    }
    
    fileprivate func setupCrownNode() {
        let crownHeight: CGFloat = 60.0
        let crownSize = CGSize(width: crownHeight, height: crownHeight)
        
        crownNode = SKSpriteNode(imageNamed: "crown.png")
        crownNode.size = crownSize
        crownNode.position = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.65 + crownHeight)

        addChild(crownNode)
    }
    
    fileprivate func setupCongratsLabel() {
        congratsNode = SKLabelNode(text: "🎉 You did it! 🎉")
        congratsNode.fontName = "Heavy"
        congratsNode.fontColor = UIColor.white
        congratsNode.fontSize = 36.0
        congratsNode.position = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.6)
        addChild(congratsNode)
    }
    
    fileprivate func setupDistanceLabel() {
        distanceNode = SKLabelNode()
        distanceNode.fontName = "Medium"
        distanceNode.fontColor = UIColor.white
        distanceNode.fontSize = 24.0
        distanceNode.position = CGPoint(x: frame.width * 0.5 , y: frame.height * 0.65 - 80)
        addChild(distanceNode)
    }
    
    fileprivate func setupPlayAgainButton() {
        let playAgainButton = SKShapeNode(rectOf: CGSize(width: frame.width * 0.5, height: 50), cornerRadius: 25.0)
        playAgainButton.fillColor = UIColor.white
        playAgainButton.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.25)
        playAgainButton.name = GameFinishedScene.playAgainButtonName
        addChild(playAgainButton)
        
        let playAgainButtonLabel = SKLabelNode(text: "START OVER")
        playAgainButtonLabel.fontName = "Bold"
        playAgainButtonLabel.fontColor = UIColor.black
        playAgainButtonLabel.fontSize = 20.0
        playAgainButtonLabel.position = CGPoint(x: 0 , y: -8)
        playAgainButtonLabel.name = GameFinishedScene.playAgainButtonName
        playAgainButton.addChild(playAgainButtonLabel)
    }
}

