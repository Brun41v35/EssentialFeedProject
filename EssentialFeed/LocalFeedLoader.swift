//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 2024-01-02.
//

import Foundation

public final class LocalFeedLoader {

    private var store: FeedStore
    private var currentDate: () -> Date
    public typealias SaveResult = Error?

    public init(store: FeedStore,
         currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }

    public func save(_ feed: [FeedImage],
              completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed() { [weak self] error in
            guard let self = self else { return }

            if let cachedDeletionerror = error {
                completion(cachedDeletionerror)
            } else {
                self.cache(feed, with: completion)
            }
        }
    }

    public func load(completion: @escaping (Error?) -> Void) {
        store.retrieve(completion: completion)
    }

    private func cache(_ feed: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(feed.toLocal(), timeStamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            completion(error)
        }
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map { LocalFeedImage(id: $0.id,
                                   description: $0.description,
                                   location: $0.location,
                                   url: $0.url)}
    }
}
