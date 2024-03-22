//
//  HomeView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import SwiftUI

/// View for homeView.
struct HomeView: View {
    
    /// State properties & varible declarations.
    @StateObject var viewModelInstance =  HomeViewModel()
    @State var textToSearch :String = ""
    var filteredArray :[Jobs]  {
        if textToSearch.isEmpty {
            return  viewModelInstance.jobArray
        }
        else{
            return viewModelInstance.jobArray.filter { jobDetails in
                textToSearch.split(separator: "").allSatisfy { variableData in
                    jobDetails.title.lowercased().contains(variableData.lowercased())
                }
            }
        }
    }
    var body: some View {
        NavigationStack {
            List(filteredArray) {value in
                VStack(alignment: .leading, content: {
                    Spacer()
                    HStack{
                        Spacer()
                        Text(value.title)
                            .font(.title2)
                            .bold()
                            .padding(.leading,-20)
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "heart")
                                .foregroundStyle(Color.black)
                        }
                        Spacer()
                        VStack{
                            Text("Appllication Deadline")
                            Text(value.deadlineDate)
                        }
                                .padding()
                        .foregroundStyle(Color.gray)
                        .background(Color("lightTheme"))
                        .clipShape(RoundedRectangle(cornerRadius: 30.0), style: FillStyle())
                        Spacer()
                    }
                    Text(value.location)
                        .padding(.leading,20)
                    Text(value.description)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    Spacer()
                })
            }
            .searchable(text:$textToSearch,prompt: "Enter the job title here.")
            . toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        print("Added to favourite jobs")
                    }label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(Color.black)
                            .bold()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    LogoImage(logoName: "logo 1", width: 70, height: 70)
                        .padding(.leading,-220)
                }
            }
        }
        .onAppear{
            viewModelInstance.fetchData()
        }
        .alert(isPresented: $viewModelInstance.alertValue, content: {
            Alert(title: Text("ALert"),message: Text("Sorry can't connect at the  moment.please try again."))
        })
    }
    
    func dateFormatterHelper(with dataItem:Jobs){
//        guard let formattedDate = 
        
    }
}
#Preview {
    HomeView()
}
