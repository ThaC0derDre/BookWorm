//
//  ContentView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title, order: .reverse), // Z-A
        SortDescriptor(\.author) // If same title, sort by Author
    ]) var books: FetchedResults<Book>
    
    @State private var showAddScreen    = false
    var body: some View {
        NavigationView{
            List{
                ForEach(books) {book in
                    NavigationLink{
                        DetailView(book: book)
                    } label: {
                        HStack{
                            EmojiView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                    .foregroundColor(book.rating == 1 ? .red : .primary)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $showAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
                try? moc.save()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
