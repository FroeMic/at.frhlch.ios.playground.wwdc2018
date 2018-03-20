import SpriteKit

public class GameDriver {
    
    let view: SKView
    let level: Level
    private var gameScene: GameScene
    private var gameOverScene: GameOverScene
    
    public init(view: SKView, level: Level) {
        self.level = level
        self.view = view
        self.view.ignoresSiblingOrder = false
        
        gameOverScene = GameOverScene(size: self.view.frame.size)
    
        gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFill
        gameScene.level = level
        
        gameScene.gameOverDelegate = self
        gameOverScene.gameOverDelegate = self
        view.presentScene(gameScene)
    }
    
}

extension GameDriver: GameOverDelegate {
    public func gameOver(distance: CGFloat) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9, execute: {
            self.gameOverScene.backgroundTexture = self.view.texture(from: self.gameScene)
            self.gameOverScene.distance = distance
//            
//            self.view.presentScene(self.gameOverScene, transition: SKTransition.flipVertical(withDuration: 0.8))
            self.view.presentScene(self.gameOverScene)
        })

        
        


    }
    
    public func restartGame(completion: () -> Void) {
        gameScene.resetGame()
        view.presentScene(gameScene, transition: SKTransition.flipVertical(withDuration: 0.8))
        
        
    }
}
