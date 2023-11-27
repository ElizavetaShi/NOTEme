//
//  KeyboardAnimation.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 27.11.23.
//

import UIKit

final class KeyboardAnimation {
    
    private weak var containerView: UIView?
    private weak var contentView: UIView?
    
    init(containerView: UIView, contentView: UIView) {
        self.containerView = containerView
        self.contentView = contentView
    }
    
    func keyboardFrameChanged(_ frame: CGRect) {
        guard let contentView, let containerView else { return }
        
        let maxY = containerView.frame.maxY + contentView.frame.minY + 16.0
        let keyboardY = frame.minY
        
        if maxY > keyboardY {
            let diff = maxY - keyboardY
            UIView.animate(withDuration: 0.25) {
                containerView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-diff)
                }
                containerView.superview?.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                containerView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                containerView.superview?.layoutIfNeeded()
            }
        }
    }
}
