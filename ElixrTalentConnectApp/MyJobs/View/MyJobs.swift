//
//  MyJobs.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//

import SwiftUI

struct MyJobs: View {
    @StateObject var myJobViewModelInstance = MyjobsVM()
    var body: some View {
        VStack {
            Text("Applied jobs")
                .font(.title)
                .bold()
            List(myJobViewModelInstance.getDataFromSafe()) { value  in
                Text(value.title)
            }
        }
    }
}

#Preview {
    MyJobs()
}
