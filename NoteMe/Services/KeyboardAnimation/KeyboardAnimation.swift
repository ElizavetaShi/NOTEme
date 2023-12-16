//
//  KeyboardAnimation.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 27.11.23.
//

import UIKit

final class KeyboardAnimation {
    
    func frameChanged(for view: UIView, frame: CGRect) {
        guard let superview = view.superview
              else { return }
        
        let maxY = view.frame.maxY + superview.frame.minY + 16.0
        let keyboardY = frame.minY
        
        if maxY > keyboardY {
            let diff = maxY - keyboardY
            UIView.animate(withDuration: 0.25) {
                view.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-diff)
                }
                superview.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                view.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                superview.layoutIfNeeded()
            }
        }
    }
}
