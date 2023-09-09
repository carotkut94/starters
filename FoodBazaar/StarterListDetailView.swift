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
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(starter.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionView(title: "Calories", nutritionValue: starter.calories)
                    NutritionView(title: "Carbs", nutritionValue: starter.carbs)
                    NutritionView(title: "Protein", nutritionValue: starter.protein)
                }
            }
            
            Spacer()
            
            Button{
                
            }label:{
                FBButton(title: "$\(starter.price, specifier: "%2.f") - Add to Order")
            }.padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        }label:{
            XDissmissButton()
        }, alignment: .topTrailing)
    }
}

struct StarterListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StarterListDetailView(isShowingDetail: .constant(false), starter: MockData.sampleStarter)
    }
}
