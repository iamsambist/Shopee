//
//  ViewImageUp&Ed.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import SwiftUI

struct ViewImageUp_Ed: View {
   @Binding var documentName: String
    let image: UIImage
    let onUpload: () -> Void
    let onCancel: () -> Void
    var body: some View {
        
            HStack {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .frame(width: 60)
                    .padding(.leading, 5)
                    
                CustomTextField(text: $documentName, placeHolderText: "avatar name")
                    
                
                HStack {
                    Image(systemName: "arrow.up.circle")
                        .resizable()
                        .frame(width: 40)
                        .frame(height: 40)
                        .onTapGesture {
                            onUpload()
                        }
                    
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 40)
                        .frame(height: 40)
                        .onTapGesture {
                            onCancel()
                        }
                        .padding(.trailing, 5)
                        
                }
                
                    
            }
            .padding(.vertical, 5)
            .background(.black.opacity(0.1))
            .cornerRadius(8)
          
            
      
    }
}

#Preview {
    ViewImageUp_Ed(documentName: .constant(""), image: UIImage(systemName: "heart")!, onUpload: {}, onCancel: {})
}
