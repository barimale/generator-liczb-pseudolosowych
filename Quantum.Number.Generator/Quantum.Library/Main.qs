import Std.Convert.*;
import Std.Math.*;

open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;

@EntryPoint()
operation ExecuteMinMaxBoundsResult() : Int {
    let max = 150;
    let min = 10;
    Message($"Generating a random number between {min} and {max}: ");
    if min >= max 
    {
        Message($"Min {min} has to be less then max {max}.");
        return -1;
    }
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