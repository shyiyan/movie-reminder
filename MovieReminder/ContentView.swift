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
        ScrollView{
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
                    ForEach((modelData.upcomingMovies.results)) { movie in
                        MovieCard(movie: movie)
                    }
                    
                    
                }
                Spacer()
            }
        }
        .onAppear {
            modelData.getUpcomingMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
