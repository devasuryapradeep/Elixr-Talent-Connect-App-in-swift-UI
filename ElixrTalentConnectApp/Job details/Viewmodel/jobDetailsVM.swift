//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

/// Viewmodel for the detalis view.
class jobDetailsVm:ObservableObject{

    // MARK: - Functions to  perform Favourite Button action.
    /// checkifValuePresent-
    /// - Parameters: wishListVariable -of type String,isFavorite - of type Bool.
    ///   - wishListVariable: wishListVariable description- This contains the jobID.
    ///   - isFavorite: Is a bool variable to hold the boolean value which will change based on the value  of userInteraction with the favourite button.
    func checkifValuePresent(wishListVariable: String?, isFavorite: Bool) {
        guard let uniqueJobId = wishListVariable else {
            return
        }
        UserDefaults.standard.set(isFavorite, forKey: uniqueJobId)
    }
    
    /// actionOnCheck- This checks whether the userdefault contains a value or not , if it doesn't contains then the function is returned else it returns the value stored in the userdefault with id uniqueJjobId.
    /// - Parameter wishListVariable: <#wishListVariable description#>
    /// - Returns: <#description#>
     func actionOnCheck(wishListVariable: String?) -> Bool {
         guard let uniqueJobId = wishListVariable else {
             return false
         }
         return UserDefaults.standard.bool(forKey: uniqueJobId)
     }
}

