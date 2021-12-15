//
//  UIViewController+Progressable.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 07.12.2021..
//

import UIKit
import MBProgressHUD

public extension Progressable where Self: UIViewController {

    private var hudParentView: UIView {
        return view
    }

    // MARK: - Public methods -

    // MARK: - Show/hide

    func showLoading() {
        showLoading(blocking: true)
    }

    func hideLoading() {
        hideLoading(blocking: true)
    }

    // MARK: - Show/hide with blocking state

    func showLoading(blocking: Bool) {
        // Remove previously added so we don't need to take care about
        // multiple async calls to show loading
        MBProgressHUD.hide(for: hudParentView, animated: true)
        let hud = MBProgressHUD.showAdded(to: hudParentView, animated: true)
        hud.isUserInteractionEnabled = blocking
    }

    func hideLoading(blocking: Bool) {
        MBProgressHUD.hide(for: hudParentView, animated: true)
    }

    // MARK: - Failure handling

    func showFailure(with error: Error) {
        showFailure(with: nil, message: error.localizedDescription)
    }

    func showFailure(with title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertView, animated: true)
    }

}
