import SwiftUI
import Foundation

struct ColorSelectionPage: View {
    // Model to manage color selections
    @StateObject private var colorSelections = ColorSelections()

    // Options for eye, hair, and skin colors
    let eyeColors = ["Brown", "Blue", "Green"]
    let hairColors = ["Black", "Brown", "Blonde", "Red", "Gray", "Bald"]
    let skinColors = ["Skin Color 1", "Skin Color 2", "Skin Color 3"]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ColorSelectionRow(title: "Eye Color", colors: eyeColors, selectedColor: $colorSelections.selectedEyeColor, imagePrefix: "openart")
                ColorSelectionRow(title: "Hair Color", colors: hairColors, selectedColor: $colorSelections.selectedHairColor, imagePrefix: "hair")
                ColorSelectionRow(title: "Skin Color", colors: skinColors, selectedColor: $colorSelections.selectedSkinColor, imagePrefix: "ivory")

                Spacer()

                NavigationLink(destination: SummaryPage(colorSelections: colorSelections, eyeColors: eyeColors, hairColors: hairColors, skinColors: skinColors)) {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "3C2DDA"))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                .disabled(!colorSelections.isValid()) // Disable the button if not all colors are selected
                .padding(.bottom)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true) // Hide the back navigation button
        .navigationViewStyle(StackNavigationViewStyle()) // Navigation view style
        .preferredColorScheme(.light) // Preferred color scheme
    }
}

// Model to manage color selections
class ColorSelections: ObservableObject {
    @Published var selectedEyeColor: String?
    @Published var selectedHairColor: String?
    @Published var selectedSkinColor: String?

    // Check if all colors are selected
    func isValid() -> Bool {
        return selectedEyeColor != nil && selectedHairColor != nil && selectedSkinColor != nil
    }

    // Function to save selections to a JSON file
    func saveToFile() {
        let selections: [String: Any] = [
            "selectedEyeColor": selectedEyeColor ?? "",
            "selectedHairColor": selectedHairColor ?? "",
            "selectedSkinColor": selectedSkinColor ?? "",
            "selectedStagione": 1,
            "selectedisTest": true
        ]
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("stats.json")
            
            do {
                var existingData = [String: Any]()
                
                if let data = try? Data(contentsOf: fileURL),
                   let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    existingData = jsonData
                }
                
                existingData.merge(selections) { (_, new) in new }
                
                let data = try JSONSerialization.data(withJSONObject: existingData, options: .prettyPrinted)
                try data.write(to: fileURL)
                print("Data saved to \(fileURL)")
            } catch {
                print("Failed to save data: \(error.localizedDescription)")
            }
        }
    }
}

// View for a single row of color selection
struct ColorSelectionRow: View {
    let title: String
    let colors: [String]
    @Binding var selectedColor: String?
    let imagePrefix: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(colors, id: \.self) { color in
                        Button(action: {
                            selectedColor = color
                        }) {
                            VStack {
                                Image("\(imagePrefix)\(colors.firstIndex(of: color)! + 1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100) // Image size
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(selectedColor == color ? Color(hex: "3C2DDA") : Color.clear, lineWidth: 4)
                                    )
                                Text(color)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                            }
                        }
                        .buttonStyle(ColorSelectionButtonStyle(selected: selectedColor == color))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// Button style for color selection
struct ColorSelectionButtonStyle: ButtonStyle {
    let selected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selected ? Color(hex: "847BE2") : Color(hex: "DEDBF4"))
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}

// Summary page with color selections
struct SummaryPage: View {
    @ObservedObject var colorSelections: ColorSelections
    let eyeColors: [String]
    let hairColors: [String]
    let skinColors: [String]
    @State var openVe = false
    var body: some View {
        NavigationView{
            VStack {
                Text("Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    if let eyeColor = colorSelections.selectedEyeColor {
                        HStack {
                            Image("openart\(eyeColors.firstIndex(of: eyeColor)! + 1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text("Eye Color: \(eyeColor)")
                        }
                    }
                    if let hairColor = colorSelections.selectedHairColor {
                        HStack {
                            Image("hair\(hairColors.firstIndex(of: hairColor)! + 1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text("Hair Color: \(hairColor)")
                        }
                    }
                    if let skinColor = colorSelections.selectedSkinColor {
                        HStack {
                            Image("ivory\(skinColors.firstIndex(of: skinColor)! + 1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text("Skin Color: \(skinColor)")
                        }
                    }
                }
                .font(.title2)
                .foregroundColor(.primary)
                .padding()
                
                Spacer()
                
                Button(action: {
                    colorSelections.saveToFile()
                    openVe = true
                    if let userAttributes = loadUserAttributes(from: "stats") {
                        print("Loaded User Attributes:")
                        print("Age: \(userAttributes.age)")
                        print("Gender: \(userAttributes.gender)")
                        print("Eye Color: \(userAttributes.eyeColor ?? "N/A")")
                        print("Hair Color: \(userAttributes.hairColor ?? "N/A")")
                        print("Skin Color: \(userAttributes.skinColor ?? "N/A")")
                        print("Stagione: \(userAttributes.stagione ?? 0)")
                        print("Is Test: \(userAttributes.isTest)")
                    } else {
                        print("Failed to load user attributes.")
                    }
                    
                }) {
                    Text("Save")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "3C2DDA"))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                NavigationLink(destination: ContentView(),isActive: $openVe) {
                    //ContentView()
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the back navigation button
            .padding()
            .navigationViewStyle(StackNavigationViewStyle()) // Navigation view style
            .preferredColorScheme(.light) // Preferred color scheme
        }            .fullScreenCover(isPresented:$openVe) {
            ContentView()
        }// Hide the back navigation button

    } // Hide the back navigation button

}

// Extension to add a Color initializer using a hex value
