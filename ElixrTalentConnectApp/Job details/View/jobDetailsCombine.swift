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
    @ObservedObject var jobDisplayViewModel :JobDisplayViewModel
    @StateObject var jbDetailsVm :jobDetailsVm = jobDetailsVm()
    @State var duplicateEntry :Bool = false
    
    var body: some View {
        ScrollView{
            jobDetailsHeaderview
                .padding()
            VStack(alignment: .leading, content: {
                Section(header: Text("Description")
                    .foregroundStyle(Color.elixrBlue)
                    .padding([.leading,.top], 28)
                    .bold())
                {
                    Text(jobInstance.description)
                        .font(.system(size: 14.0))
                        .padding([.leading,.trailing],30)
                }
                Section(header: Text("Key Responsibilities")
                    .foregroundStyle(Color.elixrBlue)
                    .padding([.leading,.top], 28)
                    .bold()
                ) {
                    Text(jobInstance.responsibilities)
                        .font(.system(size: 14.0))
                        .padding([.leading,.trailing],30)
                }
                Group{
                    Section(header: Text("Qualifications")
                        .foregroundStyle(Color.elixrBlue)
                        .padding([.leading,.top], 28)
                        .bold()
                    )
                    {
                        Text(jobInstance.requirements)
                            .font(.system(size: 14.0))
                            .padding([.leading,.trailing],30)
                    }
                }
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
                Spacer()
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
            .padding(.top,80)
            Spacer()
        }
    }
    
    private var jobDetailsHeaderview:some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .frame(width: 390,height: 260)
                
                Image("BackgroundImage")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: 390,height: 260)
                Spacer()
                VStack{
                    Image("candidateImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                        .clipShape(Circle())
                    Text(jobInstance.title)
                        .font(.headline)
                        .fontDesign(.rounded)
                        .padding(.top,-5)
                        .foregroundStyle(Color.elixrBlue)
                    HStack{
                        Spacer()
                        DetailsRow(jobInfo: jobInstance.title, textValue: "Type")
                        Divider().frame(width: 5,height: 50)
                        DetailsRow(jobInfo: "Associate", textValue: "Level")
                            .padding(.horizontal,40)
                        Divider().frame(width: 5,height: 50)
                        DetailsRow(jobInfo: jobInstance.location, textValue: "Location")
                        Spacer()
                    }
                    .padding(.horizontal,-160)
                }
            }
        }
        .foregroundStyle(Color.elixrBlue)
        
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
