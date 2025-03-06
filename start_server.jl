using Genie

include("src/main.jl")

# Configuration
Genie.config.run_as_server = true

# Include route definitions
include("config/routes.jl")

# Start the server
try
    @info "Starting Genie server..."
    Genie.up(host="127.0.0.1", port=8000)  # This should use the updated config
catch e
    @error "Error starting Genie server: $e"
    throw(e)
end
