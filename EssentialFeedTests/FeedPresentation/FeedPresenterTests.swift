//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Bruno Silva on 26/06/24.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {}
}

final class FeePresenterTest: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()

        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    // MARK: - Helper

    private func makeSUT(file: StaticString = #file,
                         line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeak(view,
                           file: file,
                           line: line)
        trackForMemoryLeak(sut,
                           file: file,
                           line: line)
        return (sut, view)
    }

    private class ViewSpy {
        let messages = [Any]()
    }
}
