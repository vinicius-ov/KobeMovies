//
//  ApiRequest.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit
import Alamofire

class ApiRequest: ApiRequestDelegate {
    
    func request(withUrl url: String, andCompletion completion: @escaping ApiRequestCompletion) {
        Alamofire.request(url,method: .get)
            .validate()
            .responseJSON { (response: DataResponse) in
                completion(response.data, response.result.error)
        }
        
    }
    
}
