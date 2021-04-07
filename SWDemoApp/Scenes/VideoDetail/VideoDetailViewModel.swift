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
}

protocol VideoDetailViewEventSource {}

protocol VideoDetailViewProtocol: VideoDetailViewDataSource, VideoDetailViewEventSource {}

final class VideoDetailViewModel: BaseViewModel<VideoDetailRouter>, VideoDetailViewProtocol {
    var video: Video?

    var category: Category?
}
