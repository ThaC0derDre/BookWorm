//
//  EmojiView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/26/22.
//

import SwiftUI

struct EmojiView: View {
    var rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("😴")
        case 2:
            Text("🥱")
        case 3:
            Text("🙂")
        case 4:
            Text("😊")
        default:
            Text("🤩")
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(rating: 4)
    }
}
