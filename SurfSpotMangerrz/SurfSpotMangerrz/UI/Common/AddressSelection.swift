//
//  AddressSelection.swift
//  SurfSpotMangerrz
//
//  Created by Gerald Mahlknecht on 01.08.23.
//

import SwiftUI

struct AddressSelection: View {
    
    @StateObject var addressViewModel: AddressViewModel = AddressViewModel()
    
    @Binding var selectedAddressAnnotation: AnnotationItem?
    @State var isActive = false

    
    var body: some View {
        Button {
            isActive.toggle()
        } label: {
            HStack {
                if let selectedAddress = selectedAddressAnnotation {
                    LocationSummary(name: selectedAddress.title, address: selectedAddress.subtitle)
                } else {
                    HStack {
                        Text("Select address")
                        Spacer()
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.primary)
        }
        .sheet(isPresented: $isActive) {
            AddressSearch(selectedAddressAnnotation: $selectedAddressAnnotation) {
                isActive = false
            }
        }
        .environmentObject(addressViewModel)
        
    }
    
    struct AddressSearch: View {
        
        @EnvironmentObject var addressViewModel: AddressViewModel

        @Binding var selectedAddressAnnotation: AnnotationItem?
        var dismiss: () -> Void
        
        var body: some View {
            NavigationView {
                Group {
                    if addressViewModel.results.isEmpty {
                        Text("Enter a search query to see results")
                    } else {
                        List(addressViewModel.results) { result in
                            Button {
                                addressViewModel.getPlace(from: result) {
                                    selectedAddressAnnotation = $0
                                    dismiss()
                                }
                            } label: {
                                VStack {
                                    HStack {
                                        Text(result.title)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(result.subtitle)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
                .searchable(text: $addressViewModel.searchableText, placement: .sidebar)
                .onReceive(addressViewModel.$searchableText.debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)) {
                    addressViewModel.searchAddress($0)
                }
                .listStyle(.plain)
                .navigationTitle(selectedAddressAnnotation?.title ?? "Select Address")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AddressSelection_Previews: PreviewProvider {
    
    
    private struct Container: View {
        @State var selectedAddressAnnotation: AnnotationItem? = nil

        var body: some View {
            AddressSelection(selectedAddressAnnotation: $selectedAddressAnnotation)

        }
    }

    
    static var previews: some View {
        NavigationView {
            Container()
        }
    }
}
