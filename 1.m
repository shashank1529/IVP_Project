a = imread('1.jpg');
subplot(4,3,1);imshow(a);
b=rgb2gray(a);
subplot(4,3,2);imshow(b);
impixelinfo;
c=b>20;
subplot(4,3,3);imshow(c);
d=imfill(c,'holes');
subplot(4,3,4);imshow(d);
e=bwareaopen(d,1000);
subplot(4,3,5);imshow(e);
PreprocessedImage=uint8(double(a).*repmat(e,[1 1 3]));
subplot(4,3,6);imshow(PreprocessedImage);
PreprocessedImage=imadjust(PreprocessedImage,[0.3 0.7],[])+50;
subplot(4,3,7);imshow(PreprocessedImage);
uo=rgb2gray(PreprocessedImage);
subplot(4,3,8);imshow(uo);
mo=medfilt2(uo,[5 5]);
subplot(4,3,9);imshow(mo);
po=mo>250;
subplot(4,3,10);imshow(po);
[r ,c ,m]=size(po);
x1=r/2;
y1=c/3;
row=[x1 x1+200 x1+200 x1];
col=[y1 y1 y1+40 y1+40];
BW=roipoly(po,row,col);
subplot(4,3,11);imshow(BW);
k=po.*double(BW);
subplot(4,3,12);imshow(k);
M=bwareaopen(k,4);
[ya ,number]=bwlabel(M);
if(number>=1)
    disp('Stone is Detected');
else
    disp('No Stone is detected');
end