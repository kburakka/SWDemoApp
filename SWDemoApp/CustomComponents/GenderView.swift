//
//  GenderView.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import UIKit

class GenderView: UIView {

    private let containerView = UIView(backgroundColor: .clear)
    
    var genderChange: VoidClosure?

    var selectedGender: Gender = .none {
        didSet {
            genderChange?()
            updateButtons()
        }
    }
    
    private let maleButton: BaseButton = {
        let button = BaseButton(title: "Male",
                                image: UIImage.imgMale.resize(targetSize: CGSize(width: 24, height: 24)),
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: UIColor.appShaft.withAlphaComponent(0.5),
                                backgroundColor: .appWhite,
                                borderWidth: 1,
                                borderColor: .appAlto)
        button.clipsToBounds = true
        button.addTarget(self,
                         action: #selector(maleButtonAction),
                         for: .touchUpInside)
        return button
    }()
    
    private let femaleButton: BaseButton = {
        let button = BaseButton(title: "Female",
                                image: UIImage.imgFemale.resize(targetSize: CGSize(width: 16, height: 24)),
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: UIColor.appShaft.withAlphaComponent(0.5),
                                backgroundColor: .appWhite,
                                borderWidth: 1,
                                borderColor: .appAlto)
        button.addTarget(self,
                         action: #selector(femaleButtonAction),
                         for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.textAlignment = .center
        label.text = "or"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function

    func commonInit() {
        setupViews()
        setupLayouts()
    }

    func setupViews() {
        containerView.addSubviews([maleButton, orLabel, femaleButton])
        addSubview(containerView)
    }

    func setupLayouts() {
        maleButton.topToSuperview()
        maleButton.leadingToSuperview()
        maleButton.bottomToSuperview()
        
        femaleButton.topToSuperview()
        femaleButton.trailingToSuperview()
        femaleButton.bottomToSuperview()
        
        orLabel.leadingToTrailing(of: maleButton, offset: 10)
        orLabel.trailingToLeading(of: femaleButton, offset: -10)
        orLabel.width(15)
        orLabel.centerInSuperview()
        
        containerView.edgesToSuperview()
    }
    
    func updateButtons() {
        switch selectedGender {
        case .male:
            maleButton.layer.borderColor = UIColor.appShaft.cgColor
            maleButton.setTitleColor(.appShaft, for: .normal)
            femaleButton.layer.borderColor = UIColor.appAlto.cgColor
            femaleButton.setTitleColor(UIColor.appShaft.withAlphaComponent(0.5), for: .normal)
        case .female:
            maleButton.layer.borderColor = UIColor.appAlto.cgColor
            maleButton.setTitleColor(UIColor.appShaft.withAlphaComponent(0.5), for: .normal)
            femaleButton.layer.borderColor = UIColor.appShaft.cgColor
            femaleButton.setTitleColor(.appShaft, for: .normal)
        case .none:
            femaleButton.layer.borderColor = UIColor.appAlto.cgColor
            femaleButton.setTitleColor(UIColor.appShaft.withAlphaComponent(0.5), for: .normal)
            maleButton.layer.borderColor = UIColor.appAlto.cgColor
            maleButton.setTitleColor(UIColor.appShaft.withAlphaComponent(0.5), for: .normal)
        }
    }
    
    @objc
    func maleButtonAction() {
        selectedGender = .male
    }
    
    @objc
    func femaleButtonAction() {
        selectedGender = .female
    }
}
