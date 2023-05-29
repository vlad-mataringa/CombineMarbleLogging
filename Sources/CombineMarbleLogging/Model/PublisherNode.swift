//
//  PublisherNode.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Combine
import CombineMarbleCommon

class PublisherNode {
    let index: Int
    let publisher: any Publisher
    let publisherType: PublisherType
    let left: PublisherNode?
    let right: PublisherNode?
    
    init(index: Int,
         publisher: any Publisher,
         publisherType: PublisherType,
         left: PublisherNode? = nil,
         right: PublisherNode? = nil) {
        self.index = index
        self.publisher = publisher
        self.publisherType = publisherType
        self.left = left
        self.right = right
    }
    
    func getList() -> [PublisherNode] {
        [self] + (left?.getList() ?? []) + (right?.getList() ?? [])
    }
}
