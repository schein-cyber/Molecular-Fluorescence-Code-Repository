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
