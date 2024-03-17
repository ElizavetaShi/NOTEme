//
//  MenuPopoverVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 17.03.24.
//

import UIKit
import SnapKit

protocol MenuPopoverAdapterProtocol {
    var tableView: UITableView { get }
    var didSelectAction: ((MenuPopoverVC.Action) -> Void)? { get set }
    var contentHeight: CGFloat { get }
}

protocol MenuPopoverDelegate: AnyObject {
    func didSelect(action: MenuPopoverVC.Action)
}

final class MenuPopoverVC: UIViewController {
    
    private enum L10n {
        static let edit: String = edit.localized
        static let delete: String = delete.localized
        static let calendar: String = calendar.localized
        static let timer: String = timer.localized
        static let location: String = location.localized
    }
    
    private enum Const {
        static let contentWidth: CGFloat = 180.0
    }
    
    enum Action: MenuActionItem {
        case edit
        case delete
        case calendar
        case timer
        case location
        
        var title: String {
            switch self {
            case .edit: return L10n.edit
            case .delete: return L10n.delete
            case .calendar: return L10n.calendar
            case .timer: return L10n.timer
            case .location: return L10n.location
            }
        }
        
        var icon: UIImage? {
            switch self {
            case .edit: return .MenuAction.edit
            case .delete: return .MenuAction.delete
            case .calendar: return .MenuAction.calendar
            case .timer: return .MenuAction.timer
            case .location: return .MenuAction.location
            }
        }
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { return .popover }
        set {}
    }
    
    private var adapter: MenuPopoverAdapterProtocol
    
    private lazy var tableView: UITableView = adapter.tableView
    
    private weak var delegate: MenuPopoverDelegate?
    
    init(adapter: MenuPopoverAdapterProtocol,
         delegate: MenuPopoverDelegate?,
         sourceView: UIView) {
        self.adapter = adapter
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        setupPopover(sourceView: sourceView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bind()
    }
    
    private func bind() {
        adapter.didSelectAction = { [weak self] action in
            self?.dismiss(animated: true, completion: {
                self?.delegate?.didSelect(action: action)
            })
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalTo(self.view.safeAreaLayoutGuide.snp.verticalEdges)
        }
    }
    
    private func setupPopover(sourceView: UIView) {
        preferredContentSize = CGSize(width: Const.contentWidth, height: adapter.contentHeight)
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceRect = CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.midY, width: .zero, height: .zero)
    }
}

extension MenuPopoverVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
