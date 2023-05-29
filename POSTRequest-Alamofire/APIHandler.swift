//
//  APIHandler.swift
//  POSTRequest-Alamofire
//
//  Created by cumulations on 29/05/23.
//

import Foundation
import Alamofire

struct Model: Codable{
    var search: String
}

class APIHandler{
    static  let instance = APIHandler()
    
    func sendingPostRequest(parameters:Model,handler: @escaping (_ result:[TrainModel])->Void){
        let url = "https://trains.p.rapidapi.com/"
        let headers: HTTPHeaders = [
            "content-type": "application/json",
                "X-RapidAPI-Key": "c76dcb75c7mshe7211fd4cb3f271p195ebejsn2088b2f2ebd5",
                "X-RapidAPI-Host": "trains.p.rapidapi.com"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in
            switch response.result{
            case .success(let data):
                do{
                    let _ = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    let jsonResult = try JSONDecoder().decode([TrainModel].self, from: data!)
                    handler(jsonResult)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


struct TrainModel: Codable{
    var name: String
    var train_from: String
    var train_to: String
    var train_num: Int
    var data: Traintimes
}

struct Traintimes: Codable{
    var arriveTime: String
    var departTime: String
}
