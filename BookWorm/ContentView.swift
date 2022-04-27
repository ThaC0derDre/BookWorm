//
//  ContentView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showAddScreen    = false
    var body: some View {
        NavigationView{
            List(books) { book in
                NavigationLink{
                    DetailView(book: book)
                } label: {
                    HStack{
                        EmojiView(rating: book.rating)
                        VStack(alignment: .leading){
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(Color.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
