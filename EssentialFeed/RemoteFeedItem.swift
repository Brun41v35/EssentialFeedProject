//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 09/01/24.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
