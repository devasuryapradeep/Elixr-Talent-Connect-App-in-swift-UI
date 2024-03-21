////
////  networkMangaer@2.swift
////  ElixrTalentConnectApp
////
////  Created by Devasurya on 20/03/24.
////
//
//import Foundation
//
//
//class networkManager2 {
// static let shared = networkManager2()
//    private init () {}
//    
//    func APIcaller <T:Codable > (bodyPart :Data, endPointName:endPointType,completion:@escaping(Result<T,DataError>)->Void ) {
//        guard let url = URL(string:baseURl.url.rawValue + endPointName.URLString) else{
//            completion(.failure(.invalidURL))
//            return
//        }
//    var URLValue = URLRequest(url: url)
//        URLValue.httpMethod  = endPointName.methodType.rawValue
//        URLValue.setValue("application/json", forHTTPHeaderField: "Content_")
//        URLValue.setValue("", forHTTPHeaderField: <#T##String#>)
//        
//        
//    }
//}
//enum baseURl1 :String{
//    case  url =  "http://localhost:9001/elixr"
//}
//
//
//enum httpmethoddsDef {
//    case GET,POST,DELETE
//}
//
//
//enum endPointType {
//    case getJobs
//    case postJobs
//    
//    var URLString:String {
//        switch self {
//        case .getJobs:
//            return "/jobs"
//        case .postJobs:
//            return "/postJobs"
//        }
//    }
//    
//    var methodType:HTTPMethod {
//        switch self {
//    
//        case .getJobs:
//            return .GET
//        case .postJobs:
//            return .POST
//        }
//    }
//}
//
//
//enum DataError:Error{
//    case invalidURL
//    case invalidData
//    case invalidResponse
//    case invalidRequest
//    case invalidStatusCode
//    
//    var stringValue:String {
//        switch self {
//        case .invalidURL:
//            return "API url is invalid"
//        case .invalidData:
//            return "data  is invalid"
//
//        case .invalidResponse:
//            return "invalidResponse pattern"
//        case .invalidRequest:
//            return " invalidRequest"
//        case .invalidStatusCode:
//            return " invalid Status code"
//        }
//    }
//}
