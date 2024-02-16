//
//  DateNotificationVC.swift
//  NoteMe
//
//  Created by admin on 8.02.24.
//

import UIKit
import SnapKit

@objc protocol DateNotificationViewModelProtocol: AnyObject {
//    func createButtonDidTap(title: String?, date: Date?, comment: String?)
    @objc func cancelButtonDidTap()
    
    var catchTitleError: ((String?) -> Void)? { get set }
    var catchDateError: ((String?) -> Void)? { get set }
}

final class DateNotificationVC: UIViewController, UITextFieldDelegate {
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Create Date Notification"
        label.font = .appBoldFont.withSize(17.0)
        label.textColor = .appText
        label.textAlignment = .left
        return label
    }()
    
    private lazy var titleTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "Title"
        textField.placeholder = "Enter title"
        
        return textField
    }()
    
    private lazy var commentTextView: CustomTextView = {
       let textview = CustomTextView()
        textview.placeholder = "Enter comment"
        return textview
    }()

    private lazy var createButton: UIButton = .yellowRoundedButton("Create")
        .withAction(self, #selector(createButtonDidTap))
    
    private lazy var cancelButton: UIButton =
        .cancelButton()
        .withAction(viewModel, #selector(DateNotificationViewModelProtocol.cancelButtonDidTap))

    private lazy var dateTextField: LineTextField = {
       let textfield = LineTextField()
        textfield.title = "Date"
        textfield.placeholder = "Enter date"
        textfield.input = DatePickerView(typeMode: .date)
        return textfield
    }()

    
//    @objc private func dateDidChanged(_ sender: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        let selectedDate = sender.date
//        dateFormatter.dateFormat = "dd MMM yyyy"
//        dateTextField.text = dateFormatter.string(from: selectedDate)
//    }
    
    private var viewModel: DateNotificationViewModelProtocol
    
    init(viewModel: DateNotificationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Date Notification"
        
        setupUI()
        setupConstraints()
    }
  
    private func setupUI() {
        
        view.addSubview(contentView)
        view.addSubview(createButton)
        view.addSubview(cancelButton)
        
        contentView.addSubview(containerView)
        contentView.addSubview(titleLabel)
        
        containerView.addSubview(titleTextField)
        containerView.addSubview(dateTextField)
        containerView.addSubview(commentTextView)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(createButton.snp.centerY)
        }
        
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(20.0)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(10.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        createButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(cancelButton.snp.top).inset(-8)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(45.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
    }
    
    private func bind() {
        viewModel.catchTitleError = { errorText in
            self.titleTextField.errorText = errorText
        }
        
        viewModel.catchDateError = { errorText in
            self.dateTextField.errorText = errorText
        }
    }
    
    @objc private func createButtonDidTap() {
//        viewModel.createButtonDidTap(title: titleTextField.text, date: dateTextField.text, comment: commentTextView.infoText)
    }

    @objc private func cancelButtonDidTap() {
        print("\(#function)")
    }
}
