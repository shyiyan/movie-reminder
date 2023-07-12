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
        NavigationView {
            ScrollView{
                VStack (alignment: .leading){
                    HStack (alignment : .center){
                        Image("ticket-pic")
                            .resizable()
                            .frame(width: 120, height: 100)
                        Text("Upcoming Movies")
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                        
                    }
                    .frame(alignment: .leading)
                    VStack(alignment: .leading) {
                        ForEach((modelData.upcomingMovies.results)) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                MovieCard(movie: movie)
                                    .padding()
                                    .cornerRadius(15)
                                    .clipShape(Capsule())
                            }
                        }
                        
                        
                    }
                    Spacer()
                }
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
