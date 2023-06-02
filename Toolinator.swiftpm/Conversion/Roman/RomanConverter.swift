//
//  File.swift
//  
//
//  Created by Stvya Sharma on 28/12/22.
//

struct RomanNumeralsConverter {
    static func convert(int: Int) -> String? {
        guard int > 0 else {
            return nil
        }

        var number = int

        let values = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C",100), ("XC", 90), ("L",50), ("XL",40), ("X",10), ("IX", 9), ("V",5),("IV",4), ("I",1)]

        var result = ""

        for (romanChar, arabicValue) in values {
            let count = number / arabicValue

            if count == 0 { continue }

            for _ in 1...count
            {
                result += romanChar
                number -= arabicValue
            }
        }

        return result
    }

    static func convert(string: String) -> Int? {
        let values = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C",100), ("XC", 90), ("L",50), ("XL",40), ("X",10), ("IX", 9), ("V",5),("IV",4), ("I",1)]

        var romanNumerals = string
        var result = 0

        for (romanChars, arabicValue) in values {
            let range = romanChars.startIndex ..< romanChars.endIndex

            while romanNumerals.hasPrefix(romanChars) {
                result = result + arabicValue

                romanNumerals.removeSubrange(range)
            }
        }

        guard (romanNumerals.isEmpty) else {
            return nil
        }

        return result
    }
}

