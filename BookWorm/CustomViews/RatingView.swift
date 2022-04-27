//
//  RatingView.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/26/22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var title       = ""
    var maxRating   = 5
    
    var offImage: Image?
    var onImage     = Image(systemName: "star.fill")
    
    var offColor    = Color.gray
    var onColor     = Color.yellow
    
    var body: some View {
        HStack{
            if title.isEmpty == false {
                Text(title)
            }
            
            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating  = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
