//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Raghav Sharma on 29/07/21.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    let urlString: String = "http://hn.algolia.com/api/v1/search?tags=front_page"
    func fetchData(){
        if let url = URL(string: urlString){
            // If the url is valid
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error == nil{
                    //No error
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
