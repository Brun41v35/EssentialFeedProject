//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Bruno Silva on 06/02/24.
//

import Foundation
import CoreData

public final class CoreDataFeedStore {

    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext

    public init(storeURL: URL) throws {
        let bundle = Bundle(for: CoreDataFeedStore.self)
        container = try NSPersistentContainer.load(modelName: "FeedStore",
                                                   url: storeURL,
                                                   in: bundle)
        context = container.newBackgroundContext()
    }

    func perform(_ action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform { action(context) }
    }
}
