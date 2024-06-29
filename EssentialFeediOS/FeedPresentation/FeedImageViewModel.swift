//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Bruno Silva on 15/06/24.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
