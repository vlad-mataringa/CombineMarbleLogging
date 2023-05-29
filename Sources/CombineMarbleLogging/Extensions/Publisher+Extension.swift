//
//  Publisher+Extension.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Combine
import Foundation

extension Publisher {

    func getNode(_ index: Int = 1) -> PublisherNode {
        if let publisher = self as? (any DualUpstreamProtocol) {
            let left  = publisher.a.getNode(2 * index)
            let right = publisher.b.getNode(2 * index + 1)
            return .init(index: index, publisher: publisher, publisherType: publisher.publisherType, left: left, right: right)
        } else if let publisher = self as? (any UpstreamProtocol) {
            if publisher.publisherType == .handleEvents {
                return publisher.upstream.getNode(2 * index)
            } else {
                let left = publisher.upstream.getNode(2 * index)
                return .init(index: index, publisher: self, publisherType: publisher.publisherType, left: left)
            }
        } else {
            return .init(index: index, publisher: self, publisherType: .raw)
        }
    }
    
    public func log(_ tag: String) -> Publishers.HandleEvents<Self> {
        let uuid = UUID()
        return self
            .handleEvents(receiveSubscription: { _ in SubscriptionManager.shared.addSubscription(uuid: uuid, tag: tag, for: self)},
                          receiveOutput: { _ in },
                          receiveCompletion: { SubscriptionManager.shared.reciveComplition(for: uuid, completion: $0) },
                          receiveCancel: { SubscriptionManager.shared.cancel(uuid: uuid) },
                          receiveRequest: { _ in })
    }
}
