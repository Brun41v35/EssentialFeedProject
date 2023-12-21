//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Bruno Silva on 2023-12-20.
//

import XCTest

class LocalFeedLoader {

    var store: FeedStore

    init(store: FeedStore) {
        self.store = store
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)

        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
