def fromRoman(romanNumber)
    romanHash = {"M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1
    }

    romanResult = 0

    romanNumber.each_char {|ch|
        unless romanHash.keys.include? ch
            raise TypeError
        end
    }

    for z in 0..romanNumber.length - 1
        if z >= 1 and romanHash[romanNumber[z]] > romanHash[romanNumber[z - 1]]
            romanResult += romanHash[romanNumber[z]] - 2 * romanHash[romanNumber[z - 1]]
        else
            romanResult += romanHash[romanNumber[z]]
        end
    end
    romanResult
end

def toRoman(arabicNumber)
    romanHash = {1000 => "M",
                   900 => "CM",
                   500 => "D",
                   400 => "CD",
                   100 => "C",
                   90 => "XC",
                   50 => "L",
                   40 => "XL",
                   10 => "X",
                   9 => "IX",
                   5 => "V",
                   4 => "IV",
                   1 => "I"
    }

    if arabicNumber <= 0 or arabicNumber >= 4000
        raise RangeError
    end

    romanVal = ""
    z = 0
    while arabicNumber >= 1
        division = arabicNumber.div romanHash.keys[z]
        division.times do |_|
            arabicNumber -= romanHash.keys[z]
            romanVal += romanHash.values[z]
        end
        z += 1
    end
    romanVal
end