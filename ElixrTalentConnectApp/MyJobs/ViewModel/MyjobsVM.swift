//
//  MyjobsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation


class MyjobsVM :ObservableObject{
    
    @Published var dataSource :[Jobs] = []

    func getDataFromSafe() -> [Jobs]{
        guard let savedJobData = UserDefaults.standard.data(forKey: .savedJobsID),
              let savedjobs = try? JSONDecoder().decode([Jobs].self, from: savedJobData) else {
            print( "no jobs")
            return []
        }
        print("jobs details=----->\(savedjobs)")
        return savedjobs
    }
}
