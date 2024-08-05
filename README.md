# The *Iliad*
Repository made by: **Brodee Clontz**

*Homeri **Ilias** cum Scholia Vetera.*

Collaborators: Alyson Cramer, Furman University; Dr. Christopher Blackwell, Furman University; Dr. Mary Ebbott, The College of the Holy Cross; Dr. Brent Seales, the University of Kentucky’s Center for Visualization and Virtual Environments; Dr. Neel Smith, The College of the Holy Cross.

This site is made possible through the support of the University of Houston’s High Performance Computing Center. We are grateful for the support of Keith Crabb, Manager of the Research Computing Center and the IT - High Performance Computing Group and Alan Pfeiffer-Traum of the University Computing Center.

The Editions of the Homeric poetry and commentary are derived from originals (c) 2007, Biblioteca Nazionale Marciana, Venezie, Italia. The derivative images are (c) 2010, Center for Hellenic Studies. All original and derivative images are licensed under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 License. The CHS/Marciana Imaging Project was directed by David Jacobs of the British Library.

## This repository contains pages separating the Iliad by 25 lines. All pages are HTML files. Contains a Julia backend that utilizes the Genie package to create a local web page on your machine that will display the Iliad as well as scholia for a given line.


### Julia tutorial
- On Mac: Enter the command `curl -fsSL https://install.julialang.org | sh` in the command line
- On Windows: Enter the command `winget install julia -s msstore` in the command line
- This should install Julia and the Julia App onto your computer. You should now be able to open Julia by typing `julia` in the command line, or by clicking the Julia App icon.

### Tutorial on running Julia from command line
1. Open command line (terminal)
2. Copy this command into the terminal and hit enter: export PATH="$PATH:/Applications/Julia-1.9.app/Contents/Resources/julia/bin"
3. Copy this command into the terminal and hit enter: source ~/.zshrc
4. Now you should be able to type `julia` into the terminal and julia should start


### Tutorial on how to setup and run Genie
1. Open cmd line and ensure you can start Julia from it. If not, see tutorial above
2. Exit out of julia if you started it, but don't close the command line.
3. cd into your github folder
4. cd into the folder The-Iliad
- this folder should contain the contents of this repository
5. Next, enter the command: julia -e 'using Pkg; Pkg.activate("."); Pkg.add("Genie")'
6. If Julia isn't running in the command line, enter the command `julia`
7. Enter the command: include("start_server.jl")
    - This will only work if Julia is running inside the folder
8. Wait a moment and you should see WARNING: replacing module IliadicSearch.
    [ Info: Starting Genie server...
    ┌ Info: 
    └ Web Server starting at http://127.0.0.1:8000 - press Ctrl/Cmd+C to stop the server.
8a. Once you see this pop up the server is in business!
9. Finally, go to your web browser of choice and enter 127.0.0.1:8000 into the search bar!


### Install and run Pluto notebooks
1. In a Julia terminal, enter the command `import Pkg; Pkg.add("Pluto")`
        Note: This will only work if you're in a Julia terminal, the line should look like `julia> import Pkg; Pkg.add("Pluto")`
2. Now Pluto should be installed on your machine, still in the Julia terminal, enter the command: `using Pluto; Pluto.run()`
3. Now, Pluto should be open in your browser
4. In order to open the file "IliadScholiaPageGenerator.jl" in Pluto you'll need to enter the path to the file in the "Open Notebook" box in Pluto Notebooks
5. Now you have the ability to generate the same Iliad pages found in this repository!

