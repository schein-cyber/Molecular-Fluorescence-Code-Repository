# Molecular-Fluorescence-Code-Repository
(This repository contains all code used for the Molecular Fluorescence experiment, where the Beer-Lambert law has been disprove. It contains the ----)

This repository contains all the code we used to process the data from our molecular fluorescence experiment. It is designed to be usable by anyone who wishes to replicate our results.

## code_part1.ipynb
The file "code_part1.ipynb" is an iPythonNotebook (JupyterNotebook) file containing the code for processing data from the first part of the experiment, where intensity is compared across concentrations.

### Usuage Instructions
The code expects data saved in the following format:
- Four Excel files, one for each material and one for noise.
- In each file, one sheet for each concentration, with the sheet name being the concentration in some units. The noise file has a single sheet with some arbtirary name.
- In each sheet, the two leftmost columns contain the wavelengths and intensities, created by copying data from Thorlabs and pasting it.
- Additionally, each sheet should have a cell with the exposure time in arbitrary units. That cell's positions should be constant across all sheets.
- The rest of each sheet can have arbitrary data, it will be ignored.

In order to use the code, edit the following information in the file:
- Paths to the four data files, make sure the each path is for the correct material.
- The position of the cell with the exposure time.
- The lists of concentrations to be excluded from the fit (seperate list for each material).

Then, simply run the code. After approximately 10 seconds, the code will output:
- The background intensity.
- The fit parameters and chi squared reduced values for each material. The fit is $I=A\left(e^{-Bc}-e^{-Cc}\right)$.
- A graph of the data points, error bars and fits.
- A graph of the residuals of each fit.

### Code Explanation
The code loops over the materials and the concentrations for each material. For some pair of material and concentration:
- The code reads the measurment data from the correct sheet in the material's file.
- The code integrates the intensity over the wavelength starting from 470nm to avoid effects from the 450nm source, and normalizes by the exposure time.
- The code calculates a moving average of the intensity.
- The code integrates the absolute value of the difference between the intensity and the smoothed intensity, to calculate the fluctuation error. (The integral is also normalized by the exposure time and another constant).
- The code saves the integrated intensities and errors.

The code also calculates the background intensity by the same method.

Then, for each material:
- The code subtracts the background intensity from the intensities calculated.
- The code plots the points on graph 1, as error bars.
- The code fits the points to the function $I=A\left(e^{-Bc}-e^{-Cc}\right)$, and plots the fit on graph 1.
- The code calculates chi squared reduced, and prints it and the fit parameters.
- The code calculates residuals and plots them on graph 2.

Finally, the code displays both graphs.

## code_part2.m
The file "code_part2.m" is a MATLAB file containing the code for processing data from the second part of the experiment, where intensity is compared across the length of the flask.

### Usuage Instructions
Put the file in the same folder as the images to be processed.
  It is heavily recommended (but not technically required) that the images from each material will have very similar file names such as "FL (1)", "FL (2)" etc.

For each image:
- Change the file name in the first code line to the name of the image file.
- Run the first code group (everything before "C = _;") in the command window. Three images will open, showing the intensities of different colors (order is RGB).
- Look over the images and choose what color to use.
- Change the "C = _;" line to assign C the color you chose.
- Run the second code group (everything from "C = _;"). The image you chose will open.
- Click on the two points in the image you want to use for the graph. The graph will be automatically created.
- Save the graph.
- Repeat for the next image.

### Code Explanation
The first code group simply reads the chosen file, and displays the red, green and blue intensities for each pixel on three seperate images.

Then in second code group:
- The code opens the image from the color selected by the user, and waits for them to click twice.
- The code reads the intensity along the horizontal line $\left(x_{1},y_{1}\right)\to\left(x_{2},y_{1}\right)$ (the second $y_{1}$ is not a mistake, the code needs a horizontal line).
- The code plots the logarithm of the intensity vs. the position, assuming the length marked by the user is $10cm$.
