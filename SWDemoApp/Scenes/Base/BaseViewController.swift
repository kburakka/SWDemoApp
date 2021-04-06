//
//  BaseViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit
import TinyConstraints

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
        
    var viewModel: V

    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    // MARK: - SetupViews
    func setupViews() {}
    
    // MARK: - SetupLayouts
    func setupLayouts() {}
}
