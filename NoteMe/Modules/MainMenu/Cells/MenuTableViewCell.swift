//
//  MenuTableViewCell.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit
import SnapKit


final class  MenuTableViewCell: UITableViewCell {
    
    static let identifier: String = "MenuTableViewCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(16.0)
        label.textColor = .appText
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(type: NotificationType) {
        titleLabel.text = type.title
        image.image = type.icon
    }
    
    private func setupUI() {
        addSubview(image)
        addSubview(titleLabel)
        
        backgroundColor = .clear
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16.0)
            make.top.equalToSuperview().inset(8.0)
            make.size.equalTo(24.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8.0)
            make.left.equalToSuperview().inset(16.0)
        }
    }
}
