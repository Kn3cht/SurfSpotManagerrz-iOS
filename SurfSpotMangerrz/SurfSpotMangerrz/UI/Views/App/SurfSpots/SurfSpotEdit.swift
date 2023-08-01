//
//  SurfSpotEdit.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI
import SurfSpotManagerrzApi

struct SurfSpotEdit: View {
    
    @EnvironmentObject var surfSpotViewModel: SurfSpotViewModel
    
    var _id: String?
    @State var name: String = ""
    @State var description: String = ""
    @State var selectedAddressAnnotation: AnnotationItem? = nil
    @State var rating: Int? = nil
    
    @State var showingAlert: Bool = false
    
    var onSave: (_ surfSpot: SurfSpotFragment) -> Void
    
    var navigationTitle: String {
        if name.isEmpty {
            return "Unnamed surf spot"
        }
        return name
    }
    
    var body: some View {
        
        let valid = !name.isEmpty && !description.isEmpty && selectedAddressAnnotation != nil
    
        Form {
            Section(header: Text("Info")) {
                TextField("Name", text: $name)
                AddressSelection(selectedAddressAnnotation: $selectedAddressAnnotation)
            }
            Section(header: Text("Description")) {
                TextEditor(text: $description)
            }
            Section(header: Text("Rating")) {
                Rating(rating: $rating)
            }
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    surfSpotViewModel.createOrUpdateSurfSpot(_id: _id, name: name, description: description, annotationItem: selectedAddressAnnotation!) { surfSpot in
                        if let surfSpot = surfSpot {
                            onSave(surfSpot)
                        } else {
                            showingAlert = true
                        }
                    }
                } label: {
                    Text("Save")
                }
                .alert("Error while saving the spot", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                .disabled(!valid)
            }
        }
    }
}

struct SurfSpotEdit_Previews: PreviewProvider {
    static var previews: some View {
        SurfSpotEdit(_id: "this is an id") { _ in
            print("on save")
        }
    }
}
