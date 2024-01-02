//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 2024-01-02.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [FeedItem], timeStamp: Date, completion: @escaping InsertionCompletion)
}

public final class LocalFeedLoader {

    private var store: FeedStore
    private var currentDate: () -> Date

    public init(store: FeedStore,
         currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }

    public func save(_ items: [FeedItem],
              completion: @escaping (Error?) -> Void) {
        store.deleteCachedFeed() { [weak self] error in
            guard let self = self else { return }

            if let cachedDeletionerror = error {
                completion(cachedDeletionerror)
            } else {
                self.cache(items, with: completion)
            }
        }
    }

    private func cache(_ items: [FeedItem], with completion: @escaping (Error?) -> Void) {
        store.insert(items,
                     timeStamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            completion(error)
        }
    }
}
