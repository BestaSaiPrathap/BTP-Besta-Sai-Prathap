using Pkg
Pkg.add("ForwardDiff")
Pkg.add("ReverseDiff")


using ForwardDiff

# Define the function
function f(x)
    return 3x^2 + 2x
end

# Choose a point to evaluate the derivative
x = 2.0

# Compute the derivative using ForwardDiff
derivative = ForwardDiff.derivative(f, x)

println("The derivative of f(x) at x = $x is $derivative")


using ReverseDiff

# Define the function
function f(x)
    return 3x^2 + 2x
end

# Choose a point to evaluate the derivative
x = [2.0]

# Create a tape to record the function
tape = ReverseDiff.GradientTape(f, x)

# Compile the tape for faster evaluation
compiled_tape = ReverseDiff.compile(tape)

# Compute the gradient using ReverseDiff
gradient = ReverseDiff.gradient!(x, compiled_tape)

println("The derivative of f(x) at x = $(x[1]) is $(gradient[1])")


using Pkg
Pkg.add("ForwardDiff")


using ForwardDiff

# Define the potential energy function for a 1D bar element
function potential_energy(u, k)
    return 0.5 * k * u^2
end

# Define the stiffness matrix function (second derivative of potential energy)
function stiffness_matrix(u, k)
    return ForwardDiff.derivative(u -> ForwardDiff.derivative(u -> potential_energy(u, k), u), u)
end

# Example displacement and stiffness value
u = 1.0
k = 10.0

# Compute the stiffness matrix
K = stiffness_matrix(u, k)

println("Stiffness matrix at u = $u: $K")



