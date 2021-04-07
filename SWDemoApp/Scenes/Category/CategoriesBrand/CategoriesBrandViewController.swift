//
//  CategoriesBrandViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

final class CategoriesBrandViewController: BaseViewController<CategoriesBrandViewModel> {
    private let scrollView = UIScrollView()
    
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .xLarge)
        label.textColor = .appWhite
        label.text = "All categories.\nEnjoy!"
        label.numberOfLines = 2
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.imgBack, for: .normal)
        button.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [backButton, titleLabel],
                           axis: .horizontal,
                           spacing: 15,
                           alignment: .center,
                           distribution: .fillProportionally)
    }()
    
    private lazy var categoriesStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .fillEqually)
    }()
    
    private let showMoreButton: BaseButton = {
        let button = BaseButton(title: "Show more",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appFuchsia,
                                backgroundColor: .appWhite)
        button.addTarget(self,
                         action: #selector(showMoreAction),
                         for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.insertSublayer(CALayer().appVericalGradient(frame: view.bounds), at: 0)
    }
    
    override func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubviews([headerStackView, categoriesStackView, showMoreButton])
    }
    
    override func setupLayouts() {
        scrollView.edgesToSuperview(usingSafeArea: true)
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        
        backButton.height(30)
        backButton.width(30)

        headerStackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 30, left: 30, bottom: 30, right: 30))

        categoriesStackView.topToBottom(of: headerStackView, offset: 30)
        categoriesStackView.leadingToSuperview(offset: 30)
        categoriesStackView.trailingToSuperview(offset: 30)
    
        showMoreButton.centerXToSuperview()
        showMoreButton.height(46)
        showMoreButton.width(127)
        showMoreButton.bottomToSuperview(offset: -30)
        showMoreButton.topToBottom(of: categoriesStackView, offset: 30)
    }
}

// MARK: - Action
@objc
private extension CategoriesBrandViewController {
    func backButtonAction(_ sender: UIButton) {
        viewModel.backButtonAction()
    }
    
    func handleCategoryTap(_ sender: UITapGestureRecognizer? = nil) {
        if let tag = sender?.view?.tag {
            viewModel.categoryDetailAction(id: tag)
        }
    }
    
    func showMoreAction() {
        print("show more")
    }
}

// MARK: - Helper
private extension CategoriesBrandViewController {
    func setCategories() {
        var categoryCards: [CategoriesBrandCard] = []
        for index in 0..<viewModel.categories.count {
            let categoryModel = viewModel.categories[index]
                 let categoryCard = CategoriesBrandCard(viewModel: categoryModel)
                categoryCard.height(52)
                categoryCard.tag = categoryModel.id
                let tap = UITapGestureRecognizer(target: self, action: #selector(handleCategoryTap(_:)))
                categoryCard.addGestureRecognizer(tap)
                categoryCards.append(categoryCard)
        }

        let height = (categoryCards.count * 52) + ((categoryCards.count - 1) * 15)
        categoriesStackView.height(CGFloat(height))
        categoriesStackView.addArrangedSubviews(categoryCards)
    }
}
