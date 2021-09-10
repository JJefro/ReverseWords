//
//  CardButtonStyle.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 10/09/2021.
//

import UIKit

class CardButtonStyle: UIButton {
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }, completion: nil)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }, completion: nil)
        super.touchesEnded(touches, with: event)
    }
}
