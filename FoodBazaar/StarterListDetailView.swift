//
//  StarterListDetailView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct StarterListDetailView: View {
    
    @Binding var isShowingDetail:Bool
    let starter: Starter
    
    var body: some View {
        VStack {
            AppImageView(urlString: starter.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(starter.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(starter.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(starter.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text("\(starter.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        
                        Text("\(starter.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button{
                
            }label:{
                Text("$\(starter.price, specifier: "%.2f") -  Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 48)
                    .foregroundColor(.white)
                    .background(Color.brandPriamry)
                    .cornerRadius(10)
            }.padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        }label:{
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }
}

struct StarterListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StarterListDetailView(isShowingDetail: .constant(false), starter: MockData.sampleStarter)
    }
}
