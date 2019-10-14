%%initializing database
clc
clear all
close all

D='Dataset';
S=dir(fullfile(D,'*.jpg'));
figure;
for k=1:size(S,1)
    F=fullfile(D,S(k).name);
    I=imread(F);
    I=imresize(I,[100 100]);
    I=rgb2gray(I);
    I=im2double(I);
    subplot(ceil(sqrt(size(S,1))),ceil(sqrt(size(S,1))),k);
    imshow(I);
    mat(:,k)=I(:);
end

%% normalizing the image matrix.
figure;
for ii=1:size(mat,2)
    tempM=mean(mat(:,ii));
    tempS=std(mat(:,ii));
    A(:,ii)=(mat(:,ii)-tempM)/tempS;
    subplot(ceil(sqrt(size(S,1))),ceil(sqrt(size(S,1))),ii);
    temp=vec2mat(A(:,ii),100);
    temp=temp';
    imshow(temp);
end

%% computing SVD
[U, sig, V]=svd(A);

%% taking anyone image from the database as an input and trying to recognise it
%F=fullfile(D,S(randi(size(mat,2),1)).name);
I=imread('testImg.jpg');
I=imresize(I,[100 100]);
I=rgb2gray(I);
I=im2double(I);
I=imrotate(I,-90);
I=I(:);
Inew=(I-mean(I))/std(I);
Ihat=U'*Inew;
Ip=U*Ihat;

for ii=1:15
    ed(ii)=norm(A(:,ii)-Ip);
end

[~,T]=min(ed);
M=vec2mat(mat(:,T),100);
M=M';

I=vec2mat(I,100);
I=I';

figure;
subplot(211);
imshow(I);
title('Test Image');

subplot(212);
imshow(M);
title('Recogized Image');
