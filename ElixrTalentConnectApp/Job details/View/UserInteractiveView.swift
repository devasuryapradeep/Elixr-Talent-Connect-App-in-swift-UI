//
//  UserInteractiveView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

struct UserInteractiveArea :View {
    let jobIDInfo:Jobs
    @StateObject var vm :jobDetailsVm = jobDetailsVm()
    var body: some View {
        VStack(alignment: .center, content: {
            
            Button{
                print("jobApplied")
            } label: {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.elixrOrange)
                    .frame(width: 120,height: 30)
                    .overlay {
                        Text("Apply for Job")
                            .foregroundStyle(Color.white)
                            .bold()
                            .font(.system(size: 15.0))
                    }
            }
            HStack{
                Text("Save for later")
                    .font(.system(size: 13.0))
                Button {
                    vm.actionOnCheck(wishListVariable: jobIDInfo.id)
                    vm.checkifValuePresent(wishListVariable: jobIDInfo.id)
                } label: {
                    vm.actionOnCheck(wishListVariable: jobIDInfo.id) ?
                    Image("heartButton") : Image("heart")
                }
            }
        })
    }
    
}


//#Preview {
//    UserInteractiveArea(jobIDInfo: Jobs())
//}
