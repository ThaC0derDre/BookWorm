//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
