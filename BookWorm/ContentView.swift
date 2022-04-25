//
//  ContentView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View {
        List(students){ student in
            Text(student.name ?? "?")
        }
        
        Button("Add"){
            let firstName   = ["Estevan", "Joshua", "Josh", "Dre"]
            let lastName    = ["Gutierrez", "Hinojosa", "Ortiz", "Jensen"]
            
            let chosenFirstName = firstName.randomElement()!
            let chosenLastName  = lastName.randomElement()!
            
            let student = Student(context: moc)
            student.id  = UUID()
            student.name    = "\(chosenFirstName) \(chosenLastName)"
            
            try? moc.save()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
