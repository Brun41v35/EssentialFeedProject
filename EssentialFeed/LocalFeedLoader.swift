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

    public func save(_ items: [FeedItem],
              completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed() { [weak self] error in
            guard let self = self else { return }

            if let cachedDeletionerror = error {
                completion(cachedDeletionerror)
            } else {
                self.cache(items, with: completion)
            }
        }
    }

    private func cache(_ items: [FeedItem], with completion: @escaping (SaveResult) -> Void) {
        store.insert(items,
                     timeStamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            completion(error)
        }
    }
}
