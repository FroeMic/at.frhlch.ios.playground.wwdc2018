import SpriteKit

public protocol GameOverDelegate {
    
    func gameOver(distance: CGFloat)
    func restartGame(completion: () -> Void)
}
