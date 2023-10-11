//
//  FriendCellView.swift
//  BeReal
//
//  Created by Volkan Celik on 23/07/2023.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack{
            Image("PHOTO-2020-12-11-15-09-13")
                .resizable()
                .scaledToFit()
                .frame(width:65,height: 65)
                .cornerRadius(65/2)
            VStack(alignment:.leading){
                Text("Alara")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("alaraa")
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading,6)
        }
        .padding(.horizontal)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
