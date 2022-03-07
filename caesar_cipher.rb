def caesar_shift! (char, low_range, high_range, shift_factor)
    # Get current ascii
    current_ascii = char.ord

    if current_ascii < low_range or current_ascii > high_range 
        return char
    end

    # Shift
    new_ascii = current_ascii + shift_factor

    # Check if new ascii num is > high_range, if yes, then subtract 26 (amount of letters in alphabet) to get new ascii (loop around)
    if new_ascii > high_range
        new_ascii -= 26
    end
    
    # Convert to character and return
    char = new_ascii.chr

end

def to_caesar(input, shift_factor)
    result = ""
    
    # Split input string into array of characters
    # Check each character to see if uppercase or lowercase
    # require 'pry-byebug'; binding.pry;
    input.each_char { |char|
        # If uppercase, follow ascii for uppercase
       if char == char.upcase
           char = caesar_shift!(char, 65, 90, shift_factor)

        # If lowercase, follow ascii for lowercase
       elsif char == char.downcase
            char = caesar_shift!(char, 97, 122, shift_factor)
        end
        
        result << char
    }

    result
end

my_string = "What a string!"
puts to_caesar(my_string, 5)