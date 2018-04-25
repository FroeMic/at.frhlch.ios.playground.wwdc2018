import SpriteKit

public class GameDriver {
    
    fileprivate let view: SKView
    fileprivate let level: Level
    fileprivate var gameScene: GameScene
    fileprivate var gameOverScene: GameOverScene
    fileprivate var gameFinishedScene: GameFinishedScene

    
    public init(view: SKView, level: Level) {
        self.level = level
        self.view = view
        self.view.ignoresSiblingOrder = false
        
        gameOverScene = GameOverScene(size: self.view.frame.size)
        gameFinishedScene = GameFinishedScene(size: self.view.frame.size)
    
        gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFill
        gameScene.level = level
        
        gameScene.gameDelegate = self
        gameOverScene.gameDelegate = self
        gameFinishedScene.gameDelegate = self
        view.presentScene(gameScene)
        
    }
    
}

// MARK: Protocol GameOverDelegate
extension GameDriver: GameDelegate {
    public func gameOver(distance: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9, execute: {
            self.gameOverScene.backgroundTexture = self.view.texture(from: self.gameScene)
            self.gameOverScene.distance = distance

            self.view.presentScene(self.gameOverScene)
        })
    }
    
    public func finishedGame(distance: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.gameFinishedScene.backgroundTexture = self.view.texture(from: self.gameScene)
            self.gameFinishedScene.distance = distance
            
            self.view.presentScene(self.gameFinishedScene)
        })
    }
    
    public func restartGame(completion: () -> Void) {
        gameScene.resetGame()
        view.presentScene(gameScene, transition: SKTransition.flipVertical(withDuration: 0.8))
    }
}
