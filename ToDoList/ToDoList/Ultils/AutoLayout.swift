import Foundation
import UIKit

class AutoLayout {
    
    static let screenSize = UIScreen.main.bounds
    
    static let deviceSize: CGSize = CGSize(width: 390, height: 844)
    
    static func scaleHeight(height: CGFloat) -> CGFloat {
        return height / deviceSize.height * screenSize.height
    }
    
    static func scaleWidth(width: CGFloat) -> CGFloat {
        return width / deviceSize.width * screenSize.width
    }
}
