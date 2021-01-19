//
//  ProfileView.swift
//  ebayby
//
//  Created by Arpan Dhatt on 1/18/21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var model: ViewModel = ViewModel()
    
    @State var showAboutUsSheetView = false
    @State var showPrivacyPolicySheetView = false
    @State var showTermsOfServiceSheetView = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack {
                    Text("Hello")
                        .font(.headline)
                    Text(model.user.name)
                        .font(.largeTitle)
                    Divider()
                }
                Text("Social Credit: \(Int(model.user.SocialCredit))/100")
                Image(uiImage: model.user.ProfilePicture).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                HStack {
                    Text("Location")
                        .font(.caption)
                        .fontWeight(.bold)
                        
                    Text("\(model.user.Location)")
                        .font(.caption)
                    Spacer()
                }
                .padding(.leading)
                Divider()
                HStack {
                    Text("Bio")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Text("\(model.user.Bio)")
                        .font(.caption)
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Divider()
                HStack {
                    Button("About Us", action: { self.showAboutUsSheetView.toggle() }).font(.caption).sheet(isPresented: $showAboutUsSheetView, content: {
                        DocumentSheetView(showSheetView: $showAboutUsSheetView, title: "About Us", text: "lalalaa")
                    })
                    Text("•")
                    Button("Privacy Policy", action: { self.showPrivacyPolicySheetView.toggle() }).font(.caption).sheet(isPresented: $showPrivacyPolicySheetView, content: {
                        DocumentSheetView(showSheetView: $showPrivacyPolicySheetView, title: "Privacy Policy", text: "lalalaa")
                    })
                    Text("•")
                    Button("Terms of Service", action: { self.showTermsOfServiceSheetView.toggle() }).font(.caption).sheet(isPresented: $showTermsOfServiceSheetView, content: {
                        DocumentSheetView(showSheetView: $showTermsOfServiceSheetView, title: "Terms of Service", text: "lalalaa")
                    })
                }
                
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: ViewModel())
    }
}
