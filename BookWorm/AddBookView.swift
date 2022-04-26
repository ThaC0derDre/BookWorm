//
//  AddBookView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/26/22.
//

import SwiftUI
import CoreData

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title    = ""
    @State private var author   = ""
    @State private var review   = ""
    @State private var rating   = 3
    @State private var genre    = ""
    let genres    = ["Fantasy", "Romance", "Poetry", "Horror"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of Book", text: $title)
                    TextField("Name of Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id:\.self) {
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Write a review")
                }
                Section{
                    Button("Save"){
                        //add book
                        let books       = Book(context: moc)
                        books.id        = UUID()
                        books.title     = title
                        books.genre     = genre
                        books.author    = author
                        books.review    = review
                        books.rating    = Int16(rating)
                        
                        try? moc.save()
                        dismiss()
                        
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
