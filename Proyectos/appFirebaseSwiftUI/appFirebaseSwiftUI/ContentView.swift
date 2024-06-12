//
//  ContentView.swift
//  appFirebaseSwiftUI
//
//  Created by Ivanovicx Nuñez on 10/06/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        
        if userIsLoggedIn {
            // ir a ...
            ListView( )
        } else {
            content
        }
        
    }
    
    var content: some View {
        
        ZStack {
            
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle( .linearGradient( colors: [.pink,.red] , startPoint: .topLeading, endPoint: .bottomTrailing ) )
                .frame( width: 1000, height: 400 )
                .rotationEffect( .degrees( 135 ) )
                .offset( y: -350 )
            
            VStack( spacing: 20 ) {
                Text( "Bienvenido" )
                    .foregroundColor( .white )
                    .font( .system( size: 40, weight: .bold, design: .rounded ) )
                    .offset( x: -100, y: -100 )
                
                TextField( "Email", text: $email )
                    .foregroundColor( .white )
                    .textFieldStyle( .plain )
                    .placeholder( when: email.isEmpty ) {
                        Text("Email")
                            .foregroundColor( .white )
                            .bold()
                    }
                
                Rectangle()
                    .frame( width: 350, height: 1 )
                    .foregroundColor( .white )
                
                SecureField( "Password", text: $password )
                    .foregroundColor( .white )
                    .textFieldStyle( . plain )
                    .placeholder(when: password.isEmpty) {
                        Text( "Password" )
                            .foregroundColor( .white )
                            .bold()
                    }
                
                Rectangle()
                    .frame( width: 350, height: 1 )
                    .foregroundColor( .white )
                
                Button {
                    // Registro
                    registrar()
                } label: {
                    Text( "Registrarse" )
                        .bold()
                        .frame( width: 200, height: 40 )
                        .background(
                            RoundedRectangle( cornerRadius: 10, style: .continuous )
                                .fill( .linearGradient( colors: [ .pink, .red ] , startPoint: .top, endPoint: .bottomTrailing ) )
                        )
                        .foregroundColor( .white )
                }
                .padding( .top )
                .offset( y: 100 )
                
                Button {
                    // Iniciar sesion
                    login()
                } label: {
                    Text( "Ya tienes una cuneta? Inicia sesión" )
                        .bold()
                        .foregroundColor( .white )
                }
                .padding( .top )
                .offset( y: 110 )
                
            }
            .frame( width: 350 )
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                    
                }
            }
        }
        .ignoresSafeArea()
        
    }
    
    func login() {
        
        Auth.auth().signIn( withEmail: email, password: password ) { result, error in
            if error != nil {
                print( error!.localizedDescription )
            }
        }
        
    }
    
    func registrar() {
        
        Auth.auth().createUser( withEmail: email, password: password ) { result, error in
            if error != nil {
                print( error!.localizedDescription )
            }
        }
        
    }
    
}

#Preview {
    ContentView()
}

extension View {
    
    func placeholder<Content: View> (
    
        when shouldShow: Bool,
        aligment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content ) -> some View {
            
            ZStack( alignment: aligment ) {
                placeholder().opacity( shouldShow ? 1 : 0 )
                self
            }
            
        }
    
}
