//
//  VideoDetailViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol VideoDetailViewDataSource {
    var video: Video? { get }
    var category: Category? { get }
    var descriptionCellModel: BrandDescriptionCellModel { get }
    var featuresCellModel: BrandDescriptionCellModel { get }
    var clickCellModel: ClickToCellModel { get }
    var accountDetailsCellModel: AccountDetailsCellModel { get }
}

protocol VideoDetailViewEventSource {
    func accountDetailsTapAction()
}

protocol VideoDetailViewProtocol: VideoDetailViewDataSource, VideoDetailViewEventSource {}

final class VideoDetailViewModel: BaseViewModel<VideoDetailRouter>, VideoDetailViewProtocol {

    var video: Video?

    var category: Category?
    
    let sampleDesc = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip
    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    
    lazy var descriptionCellModel = BrandDescriptionCellModel(title: "Product Description", description: sampleDesc, numberOfDescLines: 4)
    
    lazy var featuresCellModel = BrandDescriptionCellModel(title: "Product Features", description: sampleDesc, numberOfDescLines: 2)
    
    var clickCellModel = ClickToCellModel(clicks: [Click(icon: .imgPhone, title: "Call"),
                                                   Click(icon: .imgShopping, title: "Buy"),
                                                   Click(icon: .imgChat, title: "Chat")],
                                          title: "Click to")
    
    var accountDetailsCellModel = AccountDetailsCellModel(title: "Account Details")
    
    func accountDetailsTapAction() {
        router.pushBrandDetail(video: video)
    }
}
