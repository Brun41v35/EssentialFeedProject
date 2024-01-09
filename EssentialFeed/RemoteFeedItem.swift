//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 09/01/24.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
