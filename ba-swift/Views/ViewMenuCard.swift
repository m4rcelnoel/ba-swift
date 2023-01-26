//
//  ViewMenuCard.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct MenuCard: View {
    let geometry: GeometryProxy
    let categoryName: String
    let apiName: String
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(categoryName.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width*0.45,
                       height: geometry.size.width*0.45)
            Text(categoryName)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .foregroundColor(Color.white)
                .padding(12)
                .background(Color.black.opacity(0.7))
        }
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

struct MenuRow: View {
    let geometry: GeometryProxy
    let categoryNameLeft: String
    let categoryNameRight: String
    let apiNameLeft: String
    let apiNameRight: String
    var body: some View {
        HStack {
            NavigationLink(destination: ViewDrinks(categoryName: categoryNameLeft, apiName: apiNameLeft)){
                MenuCard(geometry: geometry, categoryName: categoryNameLeft, apiName: apiNameLeft)
            }
            NavigationLink(destination: ViewDrinks(categoryName: categoryNameRight, apiName: apiNameRight)){
                MenuCard(geometry: geometry, categoryName: categoryNameRight, apiName: apiNameRight)
            }
        }
    }
}

struct ViewMenuCard: View {
    
    let blackBlue = Color(red: 0.04, green: 0.05, blue: 0.08)
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                Image("bar")
                    .resizable()
                    .padding(0)
                    .aspectRatio(contentMode: .fill)
                Text("")
                    .padding(30)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .background(Color.black.opacity(0.6))
            }
            .frame(maxHeight: 125)
            .padding(0)
            NavigationView {
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Kaffee",
                                categoryNameRight: "Heiße Schoko",
                                apiNameLeft: "hotdrinks",
                                apiNameRight: "hotchocolate"
                            )
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Softdrinks",
                                categoryNameRight: "Säfte",
                                apiNameLeft: "softdrinks",
                                apiNameRight: "juice"
                            )
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Business",
                                categoryNameRight: "Science",
                                apiNameLeft: "",
                                apiNameRight: ""
                            )
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Business",
                                categoryNameRight: "Science",
                                apiNameLeft: "",
                                apiNameRight: ""
                            )
                        }
                        .padding()
                    }
                    .navigationTitle("Menu Card")
                    .navigationBarHidden(true)
                    .background(blackBlue)
                }
            }
        }
    }
}

struct ViewMenuCard_Previews: PreviewProvider {
    static var previews: some View {
        ViewMenuCard()
    }
}
