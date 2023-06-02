import Foundation

class ConversionCategoryManager {
    
    static func getIcon(category: ConversionCategory) -> String {
        switch category {
        case .lenght:
            return "ruler"
        case .mass:
            return "case"
        case .area:
            return "map"
        case .volume:
            return "cube"
        case .temperature:
            return "thermometer"
        case .pressure:
            return "hammer"
        case .angle:
            return "pyramid"
        case .speed:
            return "speedometer"
        case .acceleration:
            return "figure.fall"
        case .duration:
            return "clock.arrow.2.circlepath"
        case .frequency:
            return "tuningfork"
        case .energy:
            return "bolt"
        case .power:
            return "figure.strengthtraining.traditional"
        case .charge:
            return "bolt.batteryblock"
        case .current:
            return "directcurrent"
        case .potential:
            return "switch.programmable"
        case .resistance:
            return "bolt.horizontal"
        case .concentration:
            return "scalemass"
        case .fuel:
            return "fuelpump"
        case .information:
            return "memorychip"
        }
    }
    
    static func getInfo(categoty: ConversionCategory) -> String {
        switch categoty {
        case .angle:
            return "Angle is a quantity of rotation. The SI unit for angle is the radian (rad), which is dimensionless and defined to be the the angle subtended by an arc that is equal in length to the radius of a circle. Angle is also commonly expressed in terms of degrees (°) and revolutions (rev)."
        case .lenght:
            return "Length is the dimensional extent of matter. The SI unit for length is the meter (m), which is defined in terms of the distance traveled by light in a vacuum."
        case .mass:
            return "Mass is a fundamental property of matter that causes it to resist being accelerated by a force. The SI unit for mass is the kilogram (kg), which defined in terms of the mass of the international prototype kilogram."
        case .area:
            return "Area is a quantity of extent in two dimensions. Area can be expressed by SI derived units in terms of square meters (m2). Area is also commonly measured in square feet (ft2) and acres (ac)."
        case .volume:
            return "Volume is a quantity of the extend of matter in three dimensions. The SI accepted unit of volume is the liter (L), which is derived as one cubic decimeter (1 dm3). Volume is also commonly expressed in terms of cubic meters (m3), gallons (gal), and cups (cup)."
        case .temperature:
            return "Temperature is a comparative measure of thermal energy. The SI unit for temperature is the kelvin (K), which is defined in terms of the triple point of water. Temperature is also commonly measured by degrees of various scales, including Celsius (°C) and Fahrenheit (°F)."
        case .pressure:
            return "Pressure is the normal force over a surface. The SI unit for pressure is the pascal (Pa), which is derived as one newton of force over one square meter (1Pa = 1N / 1m2)."
        case .speed:
            return "Speed is the magnitude of velocity, or the rate of change of position. Speed can be expressed by SI derived units in terms of meters per second (m/s), and is also commonly expressed in terms of kilometers per hour (km/h) and miles per hour (mph)."
        case .acceleration:
            return "Acceleration is the rate of change of velocity. Acceleration can be expressed by SI derived units in terms of meters per second squared (m/s2)."
        case .duration:
            return "Duration is a quantity of time. The SI unit for time is the second (sec), which is defined in terms of the radioactivity of a cesium-133 atom. Duration is also commonly expressed in terms of minutes (min) and hours (hr)."
        case .frequency:
            return "Frequency is a quantity of occurrences for a repeating event over time. The SI unit for frequency is the hertz (Hz), which is a derived as one occurrence per second (1 Hz = 1 / 1s)."
        case .energy:
            return "Energy is a fundamental property of matter than can be transferred and converted into different forms, such as kinetic, electric, and thermal. The SI unit for energy is the joule (J), which is derived as the work of one meter of displacement in the direction of a force of one newton (1J = 1N ∙ 1m). It can also be derived as the work required to displace an electric charge of one coulomb through an electrical potential difference of one volt (1J = 1C ∙ 1V), or the work required to produce one watt of power for one second (1J = 1W ∙ 1s). Energy is also commonly expressed in terms of the calorie (cal), or the energy needed to raise the temperature of one gram of water by one degree Celsius at a pressure of one atmosphere (1cal ≡ 4.184J)."
        case .power:
            return "Power is the amount of energy used over time. The SI unit for power is the watt (W), which is derived as one joule per second (1W = 1J / 1s)."
        case .charge:
            return "Electric charge is a fundamental physical property of matter that causes it to experience a force within an electromagnetic field. The SI unit for electric charge is the coulomb (C), which is defined as the amount of charge carried by a current of one ampere in one second (1C = 1A · 1s). Charge is also commonly expressed in terms of ampere hours (Ah)."
        case .current:
            return "Electric current is the flow of electric charge. The SI unit for electric current is the ampere (A), which is defined in terms the production of electromagnetic force between two parallel linear conductors. It can also be expressed as the flow of one coulomb per second (1A = 1C / s)."
        case .potential:
            return "Electric potential difference is the amount of electric potential energy of a point charge at a point in space. The SI unit for electric potential difference is the volt (V), which is derived as the difference in electric potential energy between two points of a linear conductor when an electric current of one ampere dissipates one watt of power between those points (1V = 1W/1A)."
        case .resistance:
            return "Electric resistance is the difficulty of passing an electric current through a conductor. The SI unit for electric resistance is the ohm (Ω), which is derived as the electric resistance that produces one ampere of current between two points in conductor with one volt of electric potential difference (1Ω = 1V/1A)."
        case .concentration:
            return "Concentration is the abundance of a constituent within a volume. Concentration can be expressed by SI derived units in terms of kilograms per cubic meter (kg/m3)."
        case .fuel:
            return "Fuel efficiency corresponds to the thermal efficiency of a process that converts the chemical potential energy of a fuel into kinetic energy. Fuel efficiency can be expressed by SI derived units in terms of cubic meters per meter (m3/m), but is more commonly expressed in terms of liters per kilometer (L/km) and miles per gallon (mpg)."
        case .information:
            return ""
        }
    }
}


