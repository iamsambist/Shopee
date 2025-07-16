//
//  ViewSignUp.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import SwiftUI
import UIKit

struct ViewSignUp: View {
    @EnvironmentObject private var coordinator: RouteCoordinator
    @StateObject private var viewModel = ViewModelSignUp(service: SignUpService())

    var body: some View {
        ZStack (alignment: .topLeading){
            Image("bubbles")
                .resizable()
                .scaledToFit()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Create \n Account")
                        .padding(.top, 120)
                        .padding(.leading, 16)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .padding(.bottom, 50)
                    
                    if viewModel.imageUploadStatus {
                        
                        ViewSuccessImgUpload(viewModel: viewModel)
                        
                    } else  {
                        if let selectedImage = viewModel.selectedImage {
                            
                            ViewImageUp_Ed(documentName: $viewModel.avatarname, image: selectedImage, onUpload: {
                                viewModel.uploadImage()
                            }, onCancel: {
                                viewModel.selectedImage = nil
                            })
                            .padding(.horizontal, 16)
                            
                            
                        } else {
                            Image("uplodaphoto")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(.leading, 16)
                                .padding(.bottom, 32)
                                .onTapGesture {
                                    viewModel.isSheetPresented.toggle()
                                }
                        }
                    }
                    
                    CustomTextField(text: $viewModel.username, placeHolderText: "Name")
                        .padding(.horizontal, 16)
                    CustomTextField(text: $viewModel.email)
                        .padding(.horizontal, 16)
                    CustomTextField(text: $viewModel.password, placeHolderText: "Password")
                        .padding(.horizontal, 16)
                        .padding(.bottom, 30)
                    CustomButton(buttonText: "Done", onClick: {
                        viewModel.registerUser(router: coordinator)
                    })
                    .padding(.horizontal, 16)
                    .padding(.bottom, 5)
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                coordinator.navigateBack()
                            }
                        }, label: {
                            Text("Cancel")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        })
                        Spacer()
                    }
                    
                }
                .sheet(isPresented: $viewModel.isSheetPresented) {
                    ImagePicker(selectedImage: $viewModel.selectedImage, isImagePickerPresented: $viewModel.isSheetPresented)
                }
            }
        }
        .transition(.move(edge: .trailing))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .edgesIgnoringSafeArea(.all)
       
    }
}

#Preview {
    ViewSignUp()
}
