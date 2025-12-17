%INSTRUCTIONS:
%1. put this file in the same folder as the images you want to process. It is
%   heavily recommended (but not technically required) that the images from
%   each material will have very similar file names.
%2. For each image, change the file name in the first code line to the
%   image you want to proccess.
%   Run the first group of code in the command window. Three images will
%   open, showing the intensities of different colors (order is RGB).
%   After selecting what color to use for the graph, change the number C is
%   equal to in the second group of code, then run the group.
%   Click on the two points in the image you want to use for the graph, and
%   the graph will be automatically created.

A=imread('RB (10).jpg');
A1=im2double(A);
figure("Name", "image 1")
imagesc(A1(:,:,1))
figure("Name", "image 2")
imagesc(A1(:,:,2))
figure("Name", "image 3")
imagesc(A1(:,:,3))

C = 1;
figure("Name", "image C")
imagesc(A1(:,:,C))
R = round(ginput(1));
X1 = R(1);
Y1 = R(2);
R = round(ginput(1));
X2 = R(1);
figure("Name", "graph")
Av=A1(Y1, X1:X2, C);
x=linspace(0,10,length(Av));
Avl=log(Av);
plot(x,Avl)
xlabel('x[cm]')
ylabel('Power [AU]')
grid minor

%not sure what these do, but they were here commented out and I am not
%going to touch them if I don't have a reason to.
%Intenstiy = transpose(Av);
%X = transpose(x);
