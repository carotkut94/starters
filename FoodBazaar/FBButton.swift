//
//  FBButton.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct FBButton: View {
    var title:LocalizedStringResource
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 48)
            .foregroundColor(.white)
            .background(Color.brandPriamry)
            .cornerRadius(10)
    }
}

struct FBButton_Previews: PreviewProvider {
    static var previews: some View {
        FBButton(title: "Test Title")
    }
}
