//
//  ValidateFeedCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Bruno Silva on 16/01/24.
//

import XCTest
import EssentialFeed

class ValidateFeedCacheUseCaseTests: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }

    func test_validateCache_deletesCacheOnRetrievalError() {
        let (sut, store) = makeSUT()

        sut.validateCache()
        store.completeRetrieval(with: anyNSError())
        
        XCTAssertEqual(store.receivedMessages, [.retrieve, .deleteCachedFeed])
    }

    // MARK: - Helpers

    private func makeSUT(currentDate: @escaping () -> Date = Date.init,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store,
                                  currentDate: currentDate)
        trackForMemoryLeak(store,
                           file: file,
                           line: line)
        trackForMemoryLeak(sut)
        return (sut, store)
    }

    private func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}
