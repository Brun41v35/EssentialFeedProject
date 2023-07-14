//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 13/07/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
