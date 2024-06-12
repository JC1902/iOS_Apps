//
//  ContentView.swift
//  appMapasSwiftUI
//
//  Created by Guest User on 10/06/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let tecLaguna = CLLocationCoordinate2D(latitude: 25.53472, longitude: -103.43575)
    static let bosqueVC = CLLocationCoordinate2D(latitude: 25.54109, longitude: -103.43270)
    static let casa = CLLocationCoordinate2D(latitude: 25.51389, longitude: -103.38837)
}

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position) {
            Marker("Esta es mi casa", systemImage: "homekit", coordinate: .casa).tint(.indigo)
            Annotation( "Tec Laguna", coordinate: .tecLaguna, anchor: .bottom ) {
                ZStack {
                    Circle()
                        .foregroundStyle( .indigo.opacity( 0.5 ) )
                        .frame( width: 80, height: 80 )
                    
                    Image( systemName: "graduationcap.fill" )
                        .symbolEffect( .variableColor )
                        .padding()
                        .foregroundColor( .white )
                        .background( Color.indigo )
                        .clipShape( Circle() )
                }
            }
            
            Annotation( "Bosque Venustiano Carranza", coordinate: .bosqueVC, anchor: .bottom ) {
                ZStack {
                    Circle()
                        .foregroundStyle( .indigo.opacity( 0.5 ) )
                        .frame( width: 80, height: 80 )
                    
                    Image( systemName: "tree.fill" )
                        .symbolEffect( .variableColor )
                        .padding()
                        .foregroundColor( .white )
                        .background( Color.indigo )
                        .clipShape( Circle() )
                }
            }
        }
            .onAppear {
                position = .item( MKMapItem( placemark: .init( coordinate: .tecLaguna ) ) )
            }
            .safeAreaInset( edge: .bottom ) {
                HStack {
                    Button( action: {
                        withAnimation {
                            position = .item( MKMapItem( placemark: .init(coordinate: .tecLaguna) ) )
                        }
                    } ) {
                        Text("Tec Laguna")
                    }
                    .tint(.black)
                    .buttonStyle(.borderedProminent)
                    
                    Button( action: {
                        withAnimation {
                            position = .item( MKMapItem( placemark: .init(coordinate: .bosqueVC ) ) )
                        }
                    } ) {
                        Text("Bosque VC")
                    }
                    .tint( .black )
                    .buttonStyle( .borderedProminent )
                    
                    Button( action: {
                        withAnimation {
                            position = .item( MKMapItem (placemark: .init(coordinate: .casa ) ) )
                        }
                    } ) {
                        Text( "Casa" )
                    }
                    .tint( .indigo )
                    .buttonStyle( .borderedProminent )
                    
                }
            } // Map
    }
}

#Preview {
    ContentView()
}
