//
//  StarterListCell.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct StarterListCell: View {
    
    var starter: Starter
    
    var body: some View {
        HStack {
            AppImageView(urlString:starter.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(starter.name)
                    .font(.title)
                    .fontWeight(.medium)
                Text("$\(starter.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct StarterListCell_Previews: PreviewProvider {
    static var previews: some View {
        StarterListCell(starter: MockData.sampleStarter)
    }
}
