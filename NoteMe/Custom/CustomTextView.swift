//
//  CustomTextView.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import UIKit
import SnapKit

final class CustomTextView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBoldFont.withSize(13.0)
        label.textColor = .appText
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textView: UITextView = {
       let textview = UITextView()
        textview.setBorder(width: 1.0, color: .appBlack)
//        let placeholder = "Enter comment"
        textview.text = placeholder
        textview.textColor = .appLightGrey
        textview.isScrollEnabled = false
        textview.textContainerInset = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        return textview
    }()
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get { textView.text }
        set { textView.text = newValue }
    }
    
    var infoText: String? {
        get { textView.text }
        set { textView.text = newValue }
    }
    
    var textViewlegate: UITextViewDelegate? {
        get { textView.delegate }
        set { textView.delegate = newValue }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
            if textView.text == placeholder {
                textView.text = ""
                textView.textColor = .appText
            }
        }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
            if textView.text.isEmpty {
                textView.text = placeholder
                textView.textColor = .appLightGrey
            }
        }
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(titleLabel)
        addSubview(textView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(4.0)
            make.horizontalEdges.bottom.equalToSuperview().inset(16.0)
        }
    }
}
