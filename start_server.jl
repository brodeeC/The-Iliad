using Genie

include("src/main.jl")

# Configuration
Genie.config.run_as_server = true

# Include route definitions
include("config/routes.jl")

# Start the server
try
    @info "Starting Genie server..."
    # Explicitly set both host and port
    Genie.config.server_host = "0.0.0.0"
    Genie.config.server_port = 8000

    Genie.up()  # This should use the updated config
catch e
    @error "Error starting Genie server: $e"
    throw(e)
end
