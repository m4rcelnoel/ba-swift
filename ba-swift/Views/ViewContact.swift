//
//  ViewMenuCard.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct ViewContact: View {
    
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
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Informationen")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.5))
                }
            }
            .frame(maxHeight: 125)
            .padding(0)
            
            VStack(alignment: .leading) {
                Group {
                    Text("Öffnugszeiten:")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                    HStack {
                        Text("Mo - Fr: 15:00 - 22:00 Uhr")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text("Sa: 15:00 - 02:00 Uhr")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text("So: 15:00 - 22:00 Uhr")
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 10)
                Group{
                    Text("Kontakt:")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                    HStack {
                        Text("Tel.: 07121/50012")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text("E-Mail: kontakt@bar.de")
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 10)
                Group{
                    Text("Adresse:")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                    HStack {
                        Text("Bar")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text("Straße 123")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text("72770 Reutlingen")
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 1)
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
            .padding(.bottom, 20)
            Spacer()

        }
        .background(Color.black)
    }
}

struct ViewContact_Preview: PreviewProvider {
    static var previews: some View {
        ViewContact()
    }
}
