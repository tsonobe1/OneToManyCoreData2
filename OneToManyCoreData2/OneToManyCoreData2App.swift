//
//  OneToManyCoreData2App.swift
//  OneToManyCoreData2
//
//  Created by 薗部拓人 on 2022/05/21.
//

import SwiftUI

@main
struct OneToManyCoreData2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
