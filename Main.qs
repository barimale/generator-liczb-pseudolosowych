import Std.Convert.*;
import Std.Math.*;

operation Main() : Int {
    let max = 100;
    let min = 20;
    Message($"Generating a random number between {min} and {max}: ");

    // Generate random number in the 0..max range.
    return GenerateRandomNumberInRange(max, min);
}

/// Generates a random number between 0 and `max`.
operation GenerateRandomNumberInRange(max : Int, min: Int) : Int {
    // Determine the number of bits needed to represent `max` and store it
    // in the `nBits` variable. Then generate `nBits` random bits which will
    // represent the generated random number.
    mutable bits = [];
    let nBits = BitSizeI(max);
    for idxBit in 1..nBits {
        set bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);
    
    // Return random number if it's within the requested range.
    // Generate it again if it's outside the range.
    return sample > max or sample <= min ? GenerateRandomNumberInRange(max, min) | sample;
}

operation GenerateRandomBit(): Result{
    use q = Qubit();
    H(q);

    let result = M(q);
    Reset(q);
    
    return result;
}