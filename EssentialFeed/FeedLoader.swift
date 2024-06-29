//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 13/07/23.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}
