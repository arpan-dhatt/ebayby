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
        VStack {
            VStack{
            VStack {
                VStack {
                    Text("Hello")
                        .font(.headline)
                    Text(model.user.name)
                        .font(.largeTitle)
                    Divider()
                }
                Text("Social Credit Score: \(Int(model.user.SocialCredit)) out of 100").font(.headline)
                Image(uiImage: model.user.ProfilePicture).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                HStack {
                    Text("Location:")
                        .font(.caption)
                        .fontWeight(.bold)
                        
                    Text("\(model.user.Location)")
                        .font(.caption)
                    Spacer()
                }
                .padding(.leading)
                Divider()
                HStack {
                    Text("Bio:")
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
            }
            Spacer()
            HStack {
                Button("About Us", action: { self.showAboutUsSheetView.toggle() }).font(.caption).sheet(isPresented: $showAboutUsSheetView, content: {
                    DocumentSheetView(showSheetView: $showAboutUsSheetView, title: "About Us", text: "lalalaa")
                })
                Text("•")
                Button("Privacy Policy", action: { self.showPrivacyPolicySheetView.toggle() }).font(.caption).sheet(isPresented: $showPrivacyPolicySheetView, content: {
                   privacyContent(showSheetView: $showPrivacyPolicySheetView)
                })
                Text("•")
                Button("Terms of Service", action: { self.showTermsOfServiceSheetView.toggle() }).font(.caption).sheet(isPresented: $showTermsOfServiceSheetView, content: {
                    tosContent(showSheetView: $showTermsOfServiceSheetView)
                })
            }
            }
        }
        
    }
}

struct privacyContent: View {
    @Binding var showSheetView: Bool
    
    var body: some View{
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    coolTitle(text: "Privacy Policy", image: "lock.icloud.fill")
                    coolTitleLight(text: "We Like To Keep Things Simple")
                    VStack(alignment: .leading){
                        VStack{
                        Text("1: We own all your data and we can use it however we want, for whatever we want, and in tandem with whoever we want")
                        Spacer()
                        }
                        Text("2: We are not responsible for any data loss from hacking etc.")
                        Spacer()
                        Text("3: We can retain your data for an indefinite amount of time if you terminate our services")
                        Spacer()
                        Text("4: We use cookies and other tracking methods to tailor our services")
                        Spacer()
                        Text("5: We may use your data in a retaliatory fashion if you violate ChariCorp's stated principals")
                        Spacer()
                        
                        Text("6: We reserve the right to maintain a detailed file on all babies we produce")
                    }.font(.headline).padding().navigationBarTitle(Text("Privacy Policy"), displayMode: .inline).navigationBarItems(trailing: Button(action: {
                            self.showSheetView = false
                        }) {
                            Text("Done").bold()
                        })
                    Spacer()
                }
            }
        }
    }
}

struct tosContent: View {
    @Binding var showSheetView: Bool
    
    var body: some View{
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    coolTitle(text: "Terms Of Service", image: "list.bullet")
                    coolTitleLight(text: "We Like To Keep Things Simple")
                    VStack(alignment: .leading){
                        VStack{
                        Text("1: By availing Ebaby, you give up the right to sue ChariCorp, issues with be solved in forced arbitration at place of ChariCorp's choosing")
                        Spacer()
                        }
                        Text("2: We are not responsible for any defects with your baby, no warranty is provided")
                        Spacer()
                        Text("3: Customers of Ebaby are banned from ordering babies from any other company or their previous baby can be seized")
                        Spacer()
                        Text("4: All delivered babies remain property of ChariCorp until they atain 18 years of age, customers are legally leasors")
                        Spacer()
                        Text("5: ChariCorp retains the right to destroy its property without cause")
                        Spacer()
                        
                        Text("6: Customers may only tinker with their babies through approved ChariCorp vendors or risk facing execution")
                    }.font(.headline).padding().navigationBarTitle(Text("Terms of Service"), displayMode: .inline).navigationBarItems(trailing: Button(action: {
                            self.showSheetView = false
                        }) {
                            Text("Done").bold()
                        })
                    Spacer()
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
