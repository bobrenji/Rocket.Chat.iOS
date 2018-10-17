//
//  MessageSectionModel.swift
//  Rocket.Chat
//
//  Created by Filipe Alvarenga on 19/09/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import Foundation
import DifferenceKit

struct MessageSectionModel: Differentiable {
    let identifier: String

    let messageDate: Date
    let message: UnmanagedMessage

    var daySeparator: Date?
    var isSequential: Bool

    let containsUnreadMessageIndicator: Bool
    var containsDateSeparator: Bool { return daySeparator != nil }

    init(message: UnmanagedMessage, daySeparator: Date? = nil, sequential: Bool = false, unreadIndicator: Bool = false) {
        self.identifier = message.identifier
        self.message = message
        self.messageDate = message.createdAt
        self.daySeparator = daySeparator
        self.isSequential = sequential
        self.containsUnreadMessageIndicator = unreadIndicator
    }

    // MARK: Differentiable

    var differenceIdentifier: String {
        return identifier
    }

    func isContentEqual(to source: MessageSectionModel) -> Bool {
        return
            message.isContentEqual(to: source.message) &&
            daySeparator == source.daySeparator &&
            containsUnreadMessageIndicator == source.containsUnreadMessageIndicator &&
            isSequential == source.isSequential
    }
}
