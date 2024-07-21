//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 21/07/24.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
