import Foundation
import UIKit

class HaloLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
