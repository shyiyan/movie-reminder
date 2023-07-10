//
//  ContentView.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
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
            
            VStack(alignment: .leading) {
                ForEach((modelData.upcomingMovies.results ?? [])) { movie in
                    Text(movie.original_title)
                }
                
                Text(String(modelData.upcomingMovies.page ?? 0))
                
            }
            Spacer()
        }
        .onAppear {
            print("it's me hi")
            modelData.getUpcomingMovies()
            print("it's me hi")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
