//
//  ViewSuccessImgUpload.swift
//  Shopee
//
//  Created by MacBook Two on 15/07/2025.
//

import SwiftUI

struct ViewSuccessImgUpload: View {
    
 @ObservedObject var viewModel: ViewModelSignUp
    
    var body: some View {
        ZStack {
            
            Image(uiImage: viewModel.selectedImage!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.leading, 16)
                .padding(.bottom, 32)
            
            VStack {
                
                Text("\(viewModel.avatarnameResponse!)")
                    .font(.subheadline.bold())
                    .foregroundColor(.red)
            }
            .padding(.top, 65)
            .padding(.leading, 9)
                                        
        }
        .frame(height: 80)
        .padding(.leading, 16)
        .padding(.bottom, 32)
    }
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModelSignUp(service: SignUpService())
        viewModel.selectedImage = UIImage(systemName: "trash.circle.fill")
        viewModel.avatarnameResponse = "Nature.jpg"
        return ViewSuccessImgUpload(viewModel: viewModel)
    }
}

