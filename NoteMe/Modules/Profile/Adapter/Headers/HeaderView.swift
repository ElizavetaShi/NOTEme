//
//  HeaderView.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 10.01.24.
//

import UIKit
import SnapKit

final class HeaderView: UITableViewHeaderFooterView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBoldFont.withSize(14.0)
        label.textColor = .appText
        return label
    }()
    
    var text: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20.0)
            make.centerY.equalToSuperview()
        }
    }
}
