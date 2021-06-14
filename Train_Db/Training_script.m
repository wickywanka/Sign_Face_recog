n=input('Enter no.of imamges to put into training: ');
L=input('Enter no.of Dominant Eigen Values to keep: ');
M=100;N=90; %required image dimensions
X=zeros(n,(M*N)); %initialize dataset matrix X
T=zeros(n,L); %initialize transformed data set matrix T in PCA space
for count=1:n
    I=imread(sprintf('%d.jpg',count)); %reading images from Train_Db
    I=rgb2gray(I);
    I=imresize(I,[M,N]);
    X(count,:)=reshape(I,[1,M*N]); %reshaping image as 1D vector
end

Xb=X; %copying DB for further use
m=mean(X); %finding mean of all images
for i=1:n
    X(i,:)=X(i,:)-m; %subtracting the mean image from DB images
end

Q=(X'*X)/(n-1);  %finding the covariance matrix
[Evecm,Evalm]=eig(Q);  %finding eigen values and vectors in putting them in their respective list
Eval=diag(Evalm); %all the eigen values i.e lampdas are extracted
[Evalsorted,Index]=sort(Eval,'descend');  %sorting eigen values so that we can extract the top 50 
Evecsorted=Evecm(:,Index);
Ppca=Evecsorted(:,1:L);  %reduced transformation matrix 

for i=1:n
    T(i,:)=(Xb(i,:)-m)*Ppca;  %projecting each image to PCA space
end
MI=reshape(m,[100,90]);
imshow(uint8(imresize(MI,[200,180])),[]);



    

 
 