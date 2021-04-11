//
//  AlertViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 11.04.2021.
//

import Foundation

protocol AlertViewDataSource {
    var title: String { get set }
    var buttonTitle: String { get set }
    var closeCompletion: VoidClosure? { get set }
}

protocol AlertViewEventSource {}

protocol AlertViewProtocol: AlertViewDataSource, AlertViewEventSource {}

final class AlertViewModel: BaseViewModel<AlertRouter>, AlertViewProtocol {
    var closeCompletion: VoidClosure?
    var title: String = ""
    var buttonTitle: String = ""
}
