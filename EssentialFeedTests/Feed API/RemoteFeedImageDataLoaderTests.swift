//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeediOSTests
//
//  Created by Bruno Silva on 06/07/24.
//

import XCTest
import EssentialFeed

final class RemoteFeedImageDataLoader {

    init(client: Any) {}
}

final class RemoteFeedImageDataLoaderTests: XCTestCase {

    func test_init_doesNotPerformAnyURLRequest() {
        let (_, client) = makeSUT()

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }

    private func makeSUT(url: URL = anyURL(),
                         file: StaticString = #file,
                         line: UInt = #line) -> (sut: RemoteFeedImageDataLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedImageDataLoader(client: client)
        trackForMemoryLeak(sut, file: file, line: line)
        trackForMemoryLeak(client, file: file, line: line)
        return (sut, client)
    }

    private class HTTPClientSpy {
        var requestedURLs = [URL]()
    }
}
