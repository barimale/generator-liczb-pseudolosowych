import Std.Convert.*;
import Std.Math.*;

@EntryPoint()
operation ExecuteMinMaxBoundsResult() : Int {
    let max = 50;
    let min = 20;
    Message($"Generating a random number between {min} and {max}: ");

    // Generate random number in the min..max range.
    return GenerateRandomNumberInRange(max, min);
}

/// Generates a random number between 'min' and 'max'.
operation GenerateRandomNumberInRange(max : Int, min: Int) : Int {
    mutable bits = [];
    let nBits = BitSizeI(max);
    for idxBit in 1..nBits {
        set bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);
    
    return sample > max or sample <= min ? GenerateRandomNumberInRange(max, min) | sample;
}

operation GenerateRandomBit(): Result{
    use q = Qubit();
    H(q);

    let result = M(q);
    Reset(q);
    
    return result;
}