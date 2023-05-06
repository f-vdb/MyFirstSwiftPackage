//
//  RatingView.swift
//  RatingView Swift Package Origin before changed to package
//
//  Created by Frank on 06.05.23.
//

import SwiftUI

/// A view of inline images that represents a rating.
/// Tapping on an image will change it from an unfilled to a filled version of the image.
///
/// The following example shows a Rating view with a maximum rating of 10 red clocks, each with a width of 20:
///
///     RatingView(maxRating: 10,
///              currentRating: $currentRating,
///              width: 20,
///              color: .red,
///              ratingImage: .clock)
///
///

// testline....i made this line in the orgin project to develop and test the package
// and the testline is automatically in the package folder MyFirstSwiftPackage
// Nice !!!!
// git commands can be done here or in the MyFirstSwiftPackage folder

// public because we are in a package
//struct RatingView: View {

    public struct RatingView: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width: Int
    var color: UIColor
    var ratingImage: RatingImage
   
    
    /// Only two required parameters are maxRating and the binding to currentRating. All others parameters have default values
    /// - Parameters:
    ///   - maxRating: The maxiumum rating on the scale
    ///   - currentRating: A binding to the current rating variable
    ///   - width: The width of the image used for the rating (Default-  20)
    ///   - color: The color of the image (Default - systemYellow
    ///   - ratingImage: An enum representing the image used for the rating (Default - .heart)
  
        
   // we need a public constructor because we are in a
        // package now
        public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 20,
                color: UIColor = .systemYellow, ratingImage: RatingImage = .heart) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }
   
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating, id: \.self) { rating in
                correctImage(for: rating)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(color))
                    .onTapGesture {
                        self.currentRating = rating + 1
                    }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
    
    func correctImage(for rating: Int) -> Image {
        if rating < currentRating {
            return ratingImage.fillImage
        } else {
            return ratingImage.openImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(maxRating: 5, currentRating: .constant(3), ratingImage: .clock)
            .environment(\.colorScheme, .light)
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}
