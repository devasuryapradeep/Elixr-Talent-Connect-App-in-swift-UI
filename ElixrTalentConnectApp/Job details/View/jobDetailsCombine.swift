//
//  jobDetailsCombine.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

/// View whoch gives a detailed description  to a details for the job.
struct jobDetailsCombine: View {
    
    /// StateObject  &  constant decalrations.
    @Binding var jobInstance :Jobs
    @StateObject var jobDisplayViewModel :JobDisplayViewModel = JobDisplayViewModel()
    @StateObject var jbDetailsVm :jobDetailsVm = jobDetailsVm()
    @State var duplicateEntry :Bool = false
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                jobDetailsHeaderview(jobDetails: jobInstance)
                    .padding()
                Spacer()
                VStack(alignment: .leading, content: {
                    Section(header: Text("Description")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    )
                    {
                        Text(jobInstance.description)
                            .frame(width: 350)
                    }
                    Spacer()
                    Section(header: Text("Key Responsibilities")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    ) {
                        Text(jobInstance.responsibilities)
                    }
                    Spacer()
                    Section(header: Text("Qualifications")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    )
                    {
                        Text(jobInstance.requirements)
                    }
                    Spacer()
                    
                })
                VStack(alignment: .center, content: {
                    Button{
                        jbDetailsVm.applyButtonPressed(jobInstance)
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
                    .alert(isPresented: Binding<Bool>(
                        get: { jbDetailsVm.alertOnDuplicateEntry },
                        set: { jbDetailsVm.alertOnDuplicateEntry = $0 }
                    )) {
                        Alert(title: Text("Alert"), message: Text("You have already applied for this same job."), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: Binding<Bool>(
                        get: { jbDetailsVm.alertOnSuccessfulEntry },
                        set: { jbDetailsVm.alertOnSuccessfulEntry = $0 }
                    )) {
                        Alert(title: Text("Alert"), message: Text("Job application Successful."), dismissButton: .default(Text("OK")))
                    }
                    
                    
                    
//                    //alert on duplciate enrty.
//                    .alert(isPresented: $duplicateEntry, content: {
//                        Alert(title: Text("Alert")
//                            .bold(), message: Text("You have already applied for this same job .")
//                            .bold())
//                    })
//                    //alert on Successfull entry.
//                    .alert(isPresented: $jbDetailsVm.alertOnSuccessfulEntry, content: {
//                        Alert(title: Text("Alert"),message: Text("Job application Successful."),dismissButton: .default(Text("OK")))
//                    })
                    
                    HStack{
                        Text("Save for later")
                            .font(.system(size: 13.0))
                        Button {
                            jobInstance.isFavouriteBool = true
                            print("jobinstance --> \(jobInstance.isFavouriteBool)")
                            jobDisplayViewModel.fetchData()
                        } label: {
                            jobInstance.isFavouriteBool ?
                            Image( "heartButton") : Image(systemName: "heart")
                        }
                    }
                })
            }
        }
    }
}

/// Struct used inside jobHeaderview - reused to create two fields .
struct DetailsRow: View {
    let jobInfo :String
    let textValue :String
    var body: some View {
        VStack(alignment: .leading
               , content: {
            Text(textValue)
                .bold()
            Text(jobInfo)
                .font(.subheadline)
        })
    }
}
