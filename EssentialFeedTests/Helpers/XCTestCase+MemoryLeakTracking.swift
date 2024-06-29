//
//  XCTestCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Bruno Silva on 09/08/23.
//

import XCTest

extension XCTestCase {

    func trackForMemoryLeak(_ instance: AnyObject,
                            file: StaticString = #filePath,
                            line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.",
                         file: file,
                         line: line)
        }
    }
}
