//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation

class HomeViewModel:ObservableObject {
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    
    //APIManager.shared.getData(endPoint: .getJobs){ [weak self] (response:Result<JobResponse,NetworkErrors>) in
    func fetchData() {
        APIManager.shared.getJobs(postData: nil, endPoint: .getJobs) { [weak self] (response: Result<JobResponse?, NetworkErrors>)in
               guard let self = self else {
                   return
               }
               switch response {
               case .success(let result):
                   DispatchQueue.main.async {
                       if let jobs = result?.jobs {
                           self.jobArray = jobs
                           print("Arraycount-->\(self.jobArray.count)")
                       }
                       print("Success")
                   }
               case .failure(let error):
                   DispatchQueue.main.async {
                       self.alertValue.toggle()
                       print("Failure", error)
                   }
               }
        }
    }
    
    
    func postJobs() {
        APIManager.shared.getJobs(postData: postDataInstance, endPoint: .postJobs) { (response:Result<JobResponse?, NetworkErrors> ) in
            switch response {
            case .success(let result) : 
                print("job submitted")
                
                break
                
            case .failure(let errorMessage):
                print("job submission failed with error: \(errorMessage)")
            }
        }
    }
}
