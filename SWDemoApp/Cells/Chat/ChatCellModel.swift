//
//  ChatCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol ChatCellDataSource: AnyObject { }

protocol ChatCellEventSource: AnyObject { }

protocol ChatCellProtocol: ChatCellDataSource, ChatCellEventSource { }

final class ChatCellModel: ChatCellProtocol { }
