//
//  ContentView.swift
//  Length Converter
//
//  Created by Abanoub Iskander on 31/05/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State private var textInputValue: String = ""
	@State private var inputUnit: Int = 0
	@State private var outputUnit: Int = 0
	let units = [UnitLength.millimeters, UnitLength.centimeters,
		UnitLength.meters,
		UnitLength.feet,
		UnitLength.yards,
		UnitLength.miles]
	var output: Double {
		let inputMeasurement = Measurement(value: Double(textInputValue) ?? 0, unit: units[inputUnit])
		let outputMeasurement = inputMeasurement.converted(to: units[outputUnit])
		return Double(outputMeasurement.value)
	}
	
	
    var body: some View {
		NavigationView {
			Form {
	//			User Input
				TextField("Input Measurement", text: $textInputValue)
					.keyboardType(.decimalPad)
				Picker("Input Unit", selection: $inputUnit) {
					ForEach( 0 ..< units.count) {
						Text("\(self.units[$0].symbol)")
					}
				}
				.pickerStyle(SegmentedPickerStyle())
				
	//			Output
				Text("\(output, specifier: "%.6g")")
				Picker("Output Unit", selection: $outputUnit) {
					ForEach( 0 ..< units.count) {
						Text("\(self.units[$0].symbol)")
					}
				}
				.pickerStyle(SegmentedPickerStyle())
			}
			.navigationTitle("Unit Converter")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
