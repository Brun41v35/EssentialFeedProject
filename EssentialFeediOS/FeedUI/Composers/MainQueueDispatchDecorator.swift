//
//  MainQueueDispatchDecorator.swift
//  EssentialFeediOS
//
//  Created by Bruno Silva on 19/06/24.
//

import Foundation
import EssentialFeed

final class MainQueueDispatchDecorator<T> {

    private let decorate: T

    init(decorate: T) {
        self.decorate = decorate
    }

    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }

        completion()
    }
}

// MARK: - Extension FeedLoader

extension MainQueueDispatchDecorator: FeedLoader where T == FeedLoader {

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decorate.load { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}

// MARK: - Extension FeedImageDataLoader

extension MainQueueDispatchDecorator: FeedImageDataLoader where T == FeedImageDataLoader {

    func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return decorate.loadImageData(from: url) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
