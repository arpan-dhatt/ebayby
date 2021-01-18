//
//  ProfileView.swift
//  ebayby
//
//  Created by Arpan Dhatt on 1/18/21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var model: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Hello")
                .font(.headline)
            Text(model.user.name)
                .font(.largeTitle)
            Text("Social Credit: \(0)/100")
            HStack {
                Text("Location")
                    .font(.caption)
                    .fontWeight(.bold)
                    
                Text("\(0)")
                    .font(.caption)
                
            }
            Text("Bio")
                .font(.caption)
                .fontWeight(.bold)
            Text("\(0)")
                .font(.caption)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: ViewModel())
    }
}
