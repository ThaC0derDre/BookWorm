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
    @State private var title        = ""
    @State private var author       = ""
    @State private var review       = ""
    @State private var rating       = 3
    @State private var genre        = ""
    @State private var emptyField   = false
    @State private var date         = Date.now.formatted(date: .abbreviated, time: .shortened)
    let genres    = ["Fantasy", "Romance", "Poetry", "Horror", "Kids", "Thriller", "Mystery"]
    
    
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
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section{
                    Button("Save"){
                        //add book
                        let books       = Book(context: moc)
                        books.id        = UUID()
                        books.date      = date
                        books.title     = title
                        books.genre     = genre
                        books.author    = author
                        books.rating    = Int16(rating)
                        
                        if review.count == 0 {
                            review = "No review"
                        } else {
                        books.review    = review
                        }
                        
                        try? moc.save()
                        
                        dismiss()
                    }
                    .disabled(completedFields())
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    
    func completedFields()-> Bool {
        if title.count == 0 || genre == "" || author.count == 0 {
            return true
        }else {
        return false
        }
    }
}


struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
