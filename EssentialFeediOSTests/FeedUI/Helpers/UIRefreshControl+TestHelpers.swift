//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bruno Silva on 28/06/24.
//

import UIKit

extension UIRefreshControl {

    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
