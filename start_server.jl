using Genie

# Configuration
Genie.config.run_as_server = true

# Include route definitions
include("config/routes.jl")

# Start the server
try
    @info "Starting Genie server..."
    Genie.up(port = 8000)
catch e
    @error "Error starting Genie server: $e"
    throw(e)
end