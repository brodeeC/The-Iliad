using Genie
using Genie.Router
using Genie.Renderer.Html
using Genie, Genie.Requests
using HTTP

# Route for serving static files like index.html
route("/The-Iliad/home", method = GET) do
    try
        html_content = read(joinpath(@__DIR__,"public", "index.html"), String)
        return HTTP.Response(200, [("Content-Type", "text/html")], html_content)
    catch e
        return HTTP.Response(500, "Error rendering HTML view: $e")
    end
end

# Route for redirecting to the first page of Book1
route("/The-Iliad/startReading") do
    try
        path = read(joinpath(@__DIR__,"public/Book1/page1.html"), String)
        return HTTP.Response(200, [("Content-Type", "text/html")], path)
    catch e
        return HTTP.Response(500, "Error rendering HTML view: $e")
    end
end

route("/The-Iliad/search", method = POST) do 
    try
        search_query = jsonpayload()["query"]
        
        if isempty(search_query)
            return HTTP.Response(400, "Search query cannot be empty")
        end
        
        # Get both numbers into a vector
        query = split(search_query, ".")

        # Get the book number from the first element of the vector
        bookNum = parse(Int64, query[1])

        # Get the page number as a String, parse it into an integer
        # Mod it by 25 to get the page number
        lineNum = parse(Int64, query[2])
        pageNum = lineNum % 25

        if lineNum % 25 == 0
            pageNum -= 1
        end
        
        current_book_dir = joinpath(@__DIR__, "public", "Book$(bookNum)")
        page_path = joinpath(current_book_dir, "page$(pageNum).html")
        
        HTML_content = read(page_path, String)
        return HTTP.Response(200, [("Content-Type", "text/html")], HTML_content)
    catch err
        @error "Error processing request: $err"
        return HTTP.Response(500, "Error processing request: $err")
    end
end

# Route for serving Iliad book pages
route("/The-Iliad/serve/:book/:page", method = GET) do

    # Correct path to the book's directory
    current_book_dir = joinpath(@__DIR__, "public", "Book$(payload(:book))")
    page_path = joinpath(current_book_dir, "page$(payload(:page)).html")
    
    HTML_content = read(page_path, String)
    return HTTP.Response(200, [("Content-Type", "text/html")], HTML_content)
   
end
