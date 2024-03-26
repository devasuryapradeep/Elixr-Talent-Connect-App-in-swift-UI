//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

class jobDetailsVm:ObservableObject{
   
    
    // MARK: - Functions to  perform Favourite Button action.
    func checkifValuePresent(wishListVariable:String?){
        guard let uniqueJobId = wishListVariable else {
            return
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        UserDefaults.standard.set(!isWishList, forKey: "uniqueJobId")
    }
    
    func actionOnCheck (wishListVariable:String?)->Bool{
        guard let uniqueJobId =  wishListVariable else{
            return false
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        return true
    }
}

