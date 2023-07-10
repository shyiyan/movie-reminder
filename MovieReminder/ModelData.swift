//
//  ModelData.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import Foundation
import Combine
import UIKit

class ModelData: ObservableObject {
    @Published var upcomingMovies = Movie(results: [], page: 1)
    
    func auth() {
        var url = URLComponents(string: "https://api.themoviedb.org/3/configuration")!
        url.queryItems = [URLQueryItem(name: "api_key", value: "b53f7ea2bff201fb38cc948ea82c5fe4")]
        let request = NSMutableURLRequest(url: url.url!)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in

          do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
              print("data \(jsonResult)")
            }
          } catch let error as NSError {
            print(error.localizedDescription)
          }

        }
        dataTask.resume()
    }
    

    
    func getUpcomingMovies() {
        var url = URLComponents(string: "https://api.themoviedb.org/3/movie/upcoming")!
        url.queryItems = [
            URLQueryItem(name: "api_key", value: "b53f7ea2bff201fb38cc948ea82c5fe4"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        let request = NSMutableURLRequest(url: url.url!)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) {(data,response,error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as?HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do {
                        let decodedMovies = try JSONDecoder().decode(Movie.self, from: data)
                        self.upcomingMovies = decodedMovies
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }

          }
          dataTask.resume()
        
    }
}
