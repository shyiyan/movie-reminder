//
//  ContentView.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack (alignment : .center){
                Image("ticket-pic")
                    .resizable()
                    .frame(width: 120, height: 100)
                Text("Upcoming Movies")
                    .font(.title)
                    .bold()
                
            }
            .frame(alignment: .leading)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
