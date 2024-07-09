//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bruno Silva on 28/06/24.
//

import UIKit

extension UIButton {

    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
