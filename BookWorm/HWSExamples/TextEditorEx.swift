//
//  TextEditorEx.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI


// Use a textEditor instead of a textField when expecting multi-lined Strings..
struct TextEditorEx: View {
    @AppStorage("notes") private var notes = ""
    var body: some View {
        //TextEditor should be in  a NavView/Form/ etc.. to prevent clipping text..
        NavigationView{
            TextEditor(text: $notes)
                .padding()
                .navigationTitle("Notes")
        }
    }
}

struct TextEditorEx_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorEx()
    }
}
