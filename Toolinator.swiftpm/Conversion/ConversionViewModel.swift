import Foundation

final class ConversionDetailViewModel: ObservableObject {
    
    @Published var firstUnit = 0
    @Published var firstUnitValue = ""
    @Published var secondUnit = 1
    @Published var secondUnitValue = ""
    @Published var showingInfo = false
    
    var units: [Dimension] {
        return selectedtUnits(category: category)
    }
    
    var category: ConversionCategory
    
    init(category: ConversionCategory) {
        self.category = category
    }
    
    func convert<T: Dimension>(value: String, unit1: T, unit2: T) -> Double {
        return Measurement(value: (Double(value) ?? 0.0), unit: unit1).converted(to: unit2).value
    }
    
    func selectedtUnits(category: ConversionCategory) -> [Dimension] {
        switch category {
        case .area:
            return [UnitArea.squareMegameters, UnitArea.squareKilometers, UnitArea.squareMeters, UnitArea.squareCentimeters, UnitArea.squareMillimeters, UnitArea.squareNanometers, UnitArea.squareInches, UnitArea.squareFeet, UnitArea.squareYards, UnitArea.squareMiles, UnitArea.acres, UnitArea.ares, UnitArea.hectares] as [Dimension]
            
        case .lenght:
            return [UnitLength.megameters, UnitLength.kilometers, UnitLength.hectometers, UnitLength.decameters, UnitLength.meters, UnitLength.decimeters, UnitLength.centimeters, UnitLength.centimeters, UnitLength.millimeters, UnitLength.micrometers, UnitLength.nanometers, UnitLength.picometers, UnitLength.inches, UnitLength.feet, UnitLength.yards, UnitLength.miles, UnitLength.scandinavianMiles, UnitLength.lightyears, UnitLength.nauticalMiles, UnitLength.fathoms, UnitLength.astronomicalUnits, UnitLength.parsecs] as [Dimension]
            
        case .pressure:
            return [UnitPressure.newtonsPerMetersSquared, UnitPressure.gigapascals, UnitPressure.megapascals, UnitPressure.kilopascals, UnitPressure.hectopascals, UnitPressure.inchesOfMercury, UnitPressure.bars, UnitPressure.millibars, UnitPressure.millimetersOfMercury, UnitPressure.poundsForcePerSquareInch] as [Dimension]
            
        case .temperature:
            return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin] as [Dimension]
            
        case .volume:
            return [UnitVolume.megaliters, UnitVolume.kiloliters, UnitVolume.liters, UnitVolume.deciliters, UnitVolume.centiliters, UnitVolume.milliliters, UnitVolume.cubicKilometers, UnitVolume.cubicKilometers, UnitVolume.cubicMeters, UnitVolume.cubicDecimeters, UnitVolume.cubicCentimeters, UnitVolume.cubicMillimeters, UnitVolume.cubicInches, UnitVolume.cubicFeet, UnitVolume.cubicYards, UnitVolume.cubicMiles, UnitVolume.acreFeet, UnitVolume.bushels, UnitVolume.teaspoons, UnitVolume.tablespoons, UnitVolume.fluidOunces, UnitVolume.cups, UnitVolume.pints, UnitVolume.quarts, UnitVolume.gallons, UnitVolume.imperialTeaspoons, UnitVolume.imperialTablespoons, UnitVolume.imperialFluidOunces, UnitVolume.imperialPints, UnitVolume.imperialQuarts, UnitVolume.imperialGallons, UnitVolume.metricCups] as [Dimension]
            
        case .mass:
            return [UnitMass.kilograms, UnitMass.grams, UnitMass.decigrams, UnitMass.centigrams, UnitMass.milligrams, UnitMass.micrograms, UnitMass.nanograms, UnitMass.picograms, UnitMass.ounces, UnitMass.pounds, UnitMass.stones, UnitMass.metricTons, UnitMass.shortTons, UnitMass.carats, UnitMass.ouncesTroy, UnitMass.slugs] as [Dimension]
            
        case .angle:
            return [UnitAngle.degrees, UnitAngle.arcMinutes, UnitAngle.arcSeconds, UnitAngle.radians, UnitAngle.gradians, UnitAngle.revolutions] as [Dimension]
        case .speed:
            return [UnitSpeed.metersPerSecond, UnitSpeed.kilometersPerHour, UnitSpeed.milesPerHour, UnitSpeed.knots, UnitSpeed.milesPerHour] as [Dimension]
        case .acceleration:
            return [UnitAcceleration.metersPerSecondSquared,UnitAcceleration.gravity] as [Dimension]
        case .duration:
            return [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds, UnitDuration.milliseconds, UnitDuration.microseconds, UnitDuration.nanoseconds, UnitDuration.nanoseconds, UnitDuration.picoseconds] as [Dimension]
        case .frequency:
            return [UnitFrequency.terahertz, UnitFrequency.gigahertz, UnitFrequency.megahertz, UnitFrequency.kilohertz, UnitFrequency.hertz, UnitFrequency.millihertz, UnitFrequency.microhertz, UnitFrequency.nanohertz] as [Dimension]
        case .energy:
            return [UnitEnergy.kilojoules, UnitEnergy.joules, UnitEnergy.kilocalories, UnitEnergy.calories, UnitEnergy.kilowattHours] as [Dimension]
        case .power:
            return [UnitPower.terawatts, UnitPower.gigawatts, UnitPower.megawatts, UnitPower.kilowatts, UnitPower.watts, UnitPower.milliwatts, UnitPower.microwatts, UnitPower.nanowatts,UnitPower.picowatts, UnitPower.femtowatts, UnitPower.horsepower] as [Dimension]
        case .charge:
            return [UnitElectricCharge.coulombs, UnitElectricCharge.megaampereHours, UnitElectricCharge.kiloampereHours, UnitElectricCharge.ampereHours, UnitElectricCharge.milliampereHours, UnitElectricCharge.microampereHours] as [Dimension]
        case .current:
            return [UnitElectricCurrent.megaamperes, UnitElectricCurrent.kiloamperes, UnitElectricCurrent.amperes, UnitElectricCurrent.milliamperes, UnitElectricCurrent.microamperes] as [Dimension]
        case .potential:
            return [UnitElectricPotentialDifference.megavolts, UnitElectricPotentialDifference.kilovolts, UnitElectricPotentialDifference.volts, UnitElectricPotentialDifference.millivolts, UnitElectricPotentialDifference.microvolts] as [Dimension]
        case .resistance:
            return [UnitElectricResistance.megaohms, UnitElectricResistance.kiloohms, UnitElectricResistance.ohms, UnitElectricResistance.milliohms, UnitElectricResistance.microohms] as [Dimension]
        case .concentration:
            return [UnitConcentrationMass.gramsPerLiter, UnitConcentrationMass.milligramsPerDeciliter] as [Dimension]
        case .fuel:
            return [UnitFuelEfficiency.milesPerGallon, UnitFuelEfficiency.litersPer100Kilometers, UnitFuelEfficiency.milesPerImperialGallon] as [Dimension]
        case .information:
            return [UnitInformationStorage.kilobits, UnitInformationStorage.kibibits, UnitInformationStorage.megabits,UnitInformationStorage.mebibits, UnitInformationStorage.gigabits, UnitInformationStorage.gibibits, UnitInformationStorage.terabits, UnitInformationStorage.tebibits, UnitInformationStorage.petabits, UnitInformationStorage.pebibits, UnitInformationStorage.exabits, UnitInformationStorage.exbibits, UnitInformationStorage.zettabits, UnitInformationStorage.zebibits, UnitInformationStorage.yobibits, UnitInformationStorage.yottabits,
                    UnitInformationStorage.kilobytes, UnitInformationStorage.kibibytes, UnitInformationStorage.megabytes, UnitInformationStorage.mebibytes, UnitInformationStorage.gigabytes, UnitInformationStorage.gibibytes, UnitInformationStorage.terabytes, UnitInformationStorage.tebibytes, UnitInformationStorage.petabytes, UnitInformationStorage.pebibytes, UnitInformationStorage.exabytes, UnitInformationStorage.exbibytes, UnitInformationStorage.zettabytes, UnitInformationStorage.zebibytes, UnitInformationStorage.yobibytes, UnitInformationStorage.yottabytes, ] as [Dimension]
        }
    }
}


