//
//  ApiRequestDelegate.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//


import UIKit


enum ApiResult<T> {
    case success(T)
    case failure(Error)
}
enum ResultError: Error {
    case data(message: String?)
    case server(message: String?)
}
typealias ParametersApiRequest = [String: Any]


protocol ApiRequestDelegate: AnyObject {
    
    typealias ApiRequestCompletion = ((Data?, Error?) -> Void)
    
    func request(withUrl url: String,
                 andCompletion completion: @escaping ApiRequestCompletion)
    func sendRequest(withUrl url: String,
                     andParameters params: ParametersApiRequest?,
                     andCompletion completion: @escaping ApiRequestCompletion)
}
