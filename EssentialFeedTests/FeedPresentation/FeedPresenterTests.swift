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
        let view = ViewSpy()

        _ = FeedPresenter(view: view)

        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    // MARK: - Helper

    private class ViewSpy {
        let messages = [Any]()
    }
}
