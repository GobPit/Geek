import UIKit
import SpriteKit

class Apple: SKShapeNode {
    convenience init(position: CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = UIColor.green
        lineWidth = 0
        self.position = position
        
        physicsBody = SKPhysicsBody(circleOfRadius: 10, center: CGPoint(x: 5, y: 5))
        physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
