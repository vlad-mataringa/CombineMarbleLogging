//
//  Publishers+Extension.swift
//  
//
//  Created by Mataranga, Vlad on 07.05.2023.
//

import Combine
import CombineMarbleCommon

extension Publishers.Merge: DualUpstreamProtocol {
    var publisherType: PublisherType { .merge }
}

extension Publishers.CombineLatest: DualUpstreamProtocol {
    var publisherType: PublisherType { .combineLatest }
}

extension Publishers.Zip: DualUpstreamProtocol {
    var publisherType: PublisherType { .zip }
}

extension Publishers.HandleEvents: UpstreamProtocol {
    var publisherType: PublisherType { .handleEvents }
}

extension Publishers.Filter: UpstreamProtocol {
    var publisherType: PublisherType { .filter }
}

extension Publishers.Map: UpstreamProtocol {
    var publisherType: PublisherType { .map }
}

extension Publishers.Delay: UpstreamProtocol {
    var publisherType: PublisherType { .delay }
}

extension Publishers.Debounce: UpstreamProtocol {
    var publisherType: PublisherType { .debounce }
}

extension Publishers.Throttle: UpstreamProtocol {
    var publisherType: PublisherType { .throttle }
}

extension Publishers.RemoveDuplicates: UpstreamProtocol {
    var publisherType: PublisherType { .removeDuplicates }
}



