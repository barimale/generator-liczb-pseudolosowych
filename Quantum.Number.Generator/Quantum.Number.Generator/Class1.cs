using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Number.Generator
{
    public class Class1
    {
        public void Execute()
        {
            using (var simulator = new QuantumSimulator(randomNumberGeneratorSeed : 42))
            {
                // Call the Q# operation
                var result = ExecuteMinMaxBoundsResult.Run(simulator).Wait();

                Console.WriteLine($"The result of the quantum coin flip is: {result}");
            }
        }
    }
}
