//
//  ViewMenuCard.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct MenuCard: View {
    let geometry: GeometryProxy // Informationen zur Größe und zum Ort der Elternansicht
    let categoryName: String // Name der Kategorie
    let apiName: String // API-Endpunkt
    var body: some View {
        // ZStack-Ansicht
        ZStack(alignment: .bottomTrailing) {
            // Bild der Menükarte
            Image(categoryName.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width*0.45, // Breite des Bildes = 45% der Elternansicht
                       height: geometry.size.width*0.45) // Höhe des Bildes = 45% der Elternansicht
            // Text, der den Namen der Kategorie anzeigt
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
    let categoryNameLeft: String // Name der linken Kategorie
    let categoryNameRight: String // Name der rechten Kategorie
    let apiNameLeft: String // API-Endpunkt für die linke Kategorie
    let apiNameRight: String // API-Endpunkt für die rechte Kategorie
    var body: some View {
        //HStack-Ansicht, Menükarten nebeneinander anzeigen
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
        // VStack-Ansicht, Zuständig für Banner Bild und Menükarte
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
                                categoryNameLeft: "Heißgetränke",
                                categoryNameRight: "Heiße Schoki",
                                apiNameLeft: "hotdrinks",
                                apiNameRight: "hotchocolate"
                            )
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Eiskaltes",
                                categoryNameRight: "Softdrinks",
                                apiNameLeft: "icecold",
                                apiNameRight: "softdrinks"
                            )
                            MenuRow(
                                geometry: geometry,
                                categoryNameLeft: "Säfte",
                                categoryNameRight: "Snacks süß",
                                apiNameLeft: "juice",
                                apiNameRight: "snackssweet"
                            )
                        }
                        .padding()
                    }
                    .navigationTitle("Menu Card")
                    .navigationBarHidden(true)
                }
                .background(Color.black)
            }
            .background(Color.black)
        }
        .background(Color.black)
    }
}

struct ViewMenuCard_Previews: PreviewProvider {
    static var previews: some View {
        ViewMenuCard()
    }
}
