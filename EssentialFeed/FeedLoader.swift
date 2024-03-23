//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 13/07/23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
