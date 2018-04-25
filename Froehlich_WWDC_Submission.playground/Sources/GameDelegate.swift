import SpriteKit

public protocol GameDelegate {
    
    func gameOver(distance: CGFloat)
    func finishedGame(distance: CGFloat)
    func restartGame(completion: () -> Void)
}
