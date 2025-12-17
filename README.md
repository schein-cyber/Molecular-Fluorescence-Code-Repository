# Molecular-Fluorescence-Code-Repository
(This repository contains all code used for the Molecular Fluorescence experiment, where the Beer-Lambert law has been disprove. It contains the ----)

This repository contains all the code we used to process the data from our molecular fluorescence experiment. It is designed to be usable by anyone who wishes to replicate our results.

## code_part1.ipynb
The file "code_part1.ipynb" is an iPythonNotebook (JupyterNotebook) file containing the code for processing data from the first part of the experiment, where intensity is compared across concentrations.

### Usuage Instructions
The code expects data saved in the following format:
  Four Excel files, one for each material and one for noise.
  In each file, one sheet for each concentration, with the sheet name being the concentration in some units. The noise file has a single sheet with some arbtirary name.
  In each sheet, the two leftmost columns contain the wavelengths and intensities, created by copying data from Thorlabs and pasting it.
  Additionally, each sheet should have a cell with the exposure time in arbitrary units. That cell's positions should be constant across all sheets.
  The rest of each sheet can have arbitrary data, it will be ignored.
In order to use the code, edit the following information in the file:
  Paths to the four data files, make sure the each path is for the correct material.
  The position of the cell with the exposure time.
  The lists of concentrations to be excluded from the fit (seperate list for each material).
Then, simply run the code. After approximately 10 seconds, the code will output:
  The background intensity.
  The fit parameters and chi squared reduced values for each material.
  A graph of the data points, error bars and fits.
  A graph of the residuals of each fit.

### Code Explanation
Here I will explain how the code processes data.

## code_part2.m
The file "code_part2.m" is a MATLAB file containing the code for processing data from the second part of the experiment, where intensity is compared across the length of the flask.

### Usuage Instructions
Put the file in the same folder as the images to be processed.

### Code Explanation
Here I will explain how the code processes data.
