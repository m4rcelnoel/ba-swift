//
//  ViewContact.swift
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
            }
            .frame(maxHeight: 125)
            .padding(0)
            Text("test")
        }
        
    }
}

struct ViewContact_Previews: PreviewProvider {
    static var previews: some View {
        ViewContact()
    }
}
