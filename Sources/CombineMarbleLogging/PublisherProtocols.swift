//
//  File.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Combine
import CombineMarbleCommon

protocol PublisherTypeProtocol: Publisher {
    var publisherType: PublisherType { get }
}

protocol UpstreamProtocol: PublisherTypeProtocol {
    associatedtype Upstream: Publisher
    var upstream: Upstream { get }
}

protocol DualUpstreamProtocol: PublisherTypeProtocol {
    associatedtype A: Publisher
    associatedtype B: Publisher
    
    var a: A { get }
    var b: B { get }
}
