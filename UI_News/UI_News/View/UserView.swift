//
//  UserView.swift
//  UI_News
//
//  Created by Демьян Горчаков on 18.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserView: View {
    
    let service = Service()
    
    @State var users = [User]()
    
    var body: some View {
        
        ScrollView{
            VStack{
                ForEach(users, id: \.self) { user in
                    VStack{
                        VStack{
                            WebImage(url: URL(string: user.image!))
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                        HStack{
                            Text("\(user.id).")
                            Text(user.firstName)
                            Text(user.lastName ?? "")
                            Text("\(user.age)")
                        }
                        .padding(20)
                        Divider()
                    }
                }
            }
            .shadow(radius: 15)
        }
        .onAppear{
            service.getUsers { user in
                self.users = user.users
            }
        }
    }
    
    struct UserViewModel_Previews: PreviewProvider {
        static var previews: some View {
            UserView()
        }
    }
}
