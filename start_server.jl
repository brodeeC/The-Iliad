using Genie

include("src/main.jl")

# Configuration
Genie.config.run_as_server = true

# Include route definitions
include("config/routes.jl")

# Start the server
try
    @info "Starting Genie server..."
    Genie.up(port = 8000, host="5.161.56.64")
catch e
    @error "Error starting Genie server: $e"
    throw(e)
end