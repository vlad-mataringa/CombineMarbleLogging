//
//  SubscriptionManager.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Foundation
import Combine
import CombineMarbleCommon

class SubscriptionManager {
    
    static var shared: SubscriptionManager = SubscriptionManager.init()
    
    private init() {}
    
    private var disposables: [UUID : Set<AnyCancellable>] = [:]
    
    func addSubscription(uuid: UUID, tag: String, for publisher: some Publisher) {
        guard disposables[uuid] == nil else { return }
        disposables[uuid] = .init()
        let nodeList = publisher.getNode().getList()
        let typeList: [SubscriotionTreeLog] = nodeList.map { SubscriotionTreeLog(index: $0.index, type: $0.publisherType) }
        let subscriotionLog = SubscriotionLog(tag: tag, list: typeList)
        LoggingManager.shared.log(LogEvent(id: uuid, type: .subscribe, content: subscriotionLog))
        for node in nodeList {
            subscribe(uuid: uuid, publisher: node.publisher, type: node.publisherType, index: node.index)
        }
    }
     
    private func subscribe(uuid: UUID, publisher: some Publisher, type: PublisherType, index: Int) {
        let anyCancelable: AnyCancellable = publisher.sink(receiveCompletion: { _ in }, receiveValue: { event in
            let value: String? = (try? (event as? Encodable)?.json()) ?? String(describing: event)
            let content: ValueLog = ValueLog(index: index, value: value)
            LoggingManager.shared.log(LogEvent(id: uuid, date: Date(), type: .event, content: content))
        })
        disposables[uuid]?.insert(anyCancelable)
    }
    
    func removeSubscriotions(for uuid: UUID) {
        disposables.removeValue(forKey: uuid)
    }
    
    func reciveComplition<Failure: Error>(for uuid: UUID, completion: Subscribers.Completion<Failure>) {
        switch completion {
        case .finished:
            LoggingManager.shared.log(.init(id: uuid, type: .finish))
        case .failure(let failure):
            LoggingManager.shared.log(.init(id: uuid, type: .error, content: String(describing: failure)))
        }
        removeSubscriotions(for: uuid)
    }
    
    func cancel(uuid: UUID) {
        LoggingManager.shared.log(LogEvent(id: uuid, type: .cancel))
        removeSubscriotions(for: uuid)
    }
    
}
