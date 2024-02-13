//
//  DatePickerView.swift
//  NoteMe
//
//  Created by admin on 12.02.24.
//

import UIKit
import SnapKit

final class DatePickerView: UIView {
    
    enum TypeMode {
        case date
        case time
    }
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.appYellow, for: .normal)
        button.titleLabel?.font = .appFont.withSize(15.0)
        button.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select", for: .normal)
        button.setTitleColor(.appYellow , for: .normal)
        button.titleLabel?.font = .appBoldFont.withSize(15.0)
        button.addTarget(self, action: #selector(selectButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.backgroundColor = .appWhite
        
        #warning("CHECK")
//        if #available(iOS 13.4, *) {
//            datePicker.preferredDatePickerStyle = .wheels
//        } else {
//            // Fallback on earlier versions
//        }
        datePicker.addTarget(self, action: #selector(dateDidChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    
    init(_ datePickerMode: UIDatePicker.Mode) {
        super.init(frame: .zero)
        datePicker.datePickerMode = datePickerMode
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func cancelButtonDidTap() {
        
    }
    
    @objc private func selectButtonDidTap() {
        
    }
    
    @objc private func dateDidChanged(_ sender: UIDatePicker) {
        
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        backgroundColor = .appBlack
        
        addSubview(cancelButton)
        addSubview(selectButton)
        addSubview(datePicker)
    }
    
    private func setupConstraints() {
        
        cancelButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20.0)
            make.top.equalToSuperview().inset(14.0)
            make.height.equalTo(17.0)
        }
        
        selectButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20.0)
            make.top.equalToSuperview().inset(14.0)
            make.height.equalTo(17.0)
        }
        
        datePicker.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().inset(45.0)
            
        }
    }
}
