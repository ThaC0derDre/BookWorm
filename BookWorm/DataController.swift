//
//  DataController.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // container loads models, to access data.
    let container = NSPersistentContainer(name: "Bookworm")
        
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
