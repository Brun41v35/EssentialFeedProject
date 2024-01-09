//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 13/07/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
