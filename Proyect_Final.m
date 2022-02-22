clc
close all;
clear all;

for m = 1:10
    rep = ['CLASS' int2str(m) '/'];
    list{m}=dir([rep '*.jpeg']);
    nbIm=numel(list{m});
    % use mean2, std2, entropy etc
    handle = @std2; 
for n = 1:nbIm
    img = imread(sprintf('%s%s',rep,list{m}(n).name));
    tab{n,m}=img; 
    nom{n,m}=list{m}(n).name;
    sig{n,m}=feval(handle,img); % choice of the signature
end%till this point is to read the images
    SE=strel('disk',4);
for n = 1:nbIm
    BW{n,m}=im2bw(tab{n,m});%put black and white images
    output{n,m}=imopen(BW{n,m},SE);
    %figure(n), imshow(output{n});
    labelim{n,m}=bwlabel(BW{n,m});
    labelimopen{n,m}=bwlabel(output{n,m});


    c{n,m}=regionprops(~labelim{n,m},'Conveximage');
    
    A{n,m}=regionprops(c{n,m}(1).ConvexImage,'Area');
    j(n,m)=A{n,m}.Area;%area
     A2{n,m}=regionprops(c{n,m}(1).ConvexImage,'Perimeter');
    j2(n,m)=A2{n,m}.Perimeter;%perimeter
    j3(n,m)=j2(n,m)^2/4*pi*j(n,m);%circularity
    A4{n,m}=regionprops(c{n,m}(1).ConvexImage,'Centroid');
    j4(n,m)=(A4{n,m}.Centroid(1));%centroid in x
    j5(n,m)=(A4{n,m}.Centroid(2));%centroid in y
    j6(n,m)=j5(n,m)^2 + j4(n,m)^2;%centroid distance
    A7{n,m}=regionprops(c{n,m}(1).ConvexImage,'MajorAxisLength');
    j7(n,m)=(A7{n,m}.MajorAxisLength);%major axis length
    A8{n,m}=regionprops(c{n,m}(1).ConvexImage,'MinorAxisLength');
    j8(n,m)=(A8{n,m}.MinorAxisLength);%minor axis leght
     A10{n,m}=regionprops(~labelim{n,m},'Centroid');
      j9(n,m)=(A10{n,m}(1).Centroid(1));%centroid in x
      j10(n,m)=(A10{n,m}(1).Centroid(2));%centroid in y
      j11(n,m)=j9(n,m)^2 + j10(n,m)^2;%centroid distance
      c2{n,m}=regionprops(~labelim{n,m},'Perimeter');
      j12(n,m)=c2{n,m}.Perimeter;
      c3{n,m}=regionprops(~labelim{n,m},'Area');
      j13(n,m)=c3{n,m}.Area;
      c4{n,m}=regionprops(~labelim{n,m},'MajorAxisLength');
      j14(n,m)=c4{n,m}.MajorAxisLength;
      c5{n,m}=regionprops(~labelim{n,m},'MinorAxisLength');
      j15(n,m)=c5{n,m}.MinorAxisLength;
      c6{n,m}=regionprops(~labelimopen{n,m},'EulerNumber');
      j16(n,m)=c6{n,m}.EulerNumber;
      c7{n,m}=regionprops(~labelim{n,m},'Eccentricity');
      j17(n,m)=c7{n,m}.Eccentricity;
      j18(n,m)=j12(n,m)^2/4*pi*j13(n,m);
      
      c9{n,m}=regionprops(~labelim{n,m},'Extent');
      j19(n,m)=c9{n,m}.Extent;
       c20{n,m}=regionprops(~labelim{n,m},'Solidity');
       j20(n,m)=c20{n,m}.Solidity;
       c21{n,m}=bwskel(~labelim{n,m});
       c22{n,m}=regionprops(c21{n,m},'Perimeter');
      j21(n,m)=c22{n,m}.Perimeter;
      c23{n,m}=regionprops(c21{n,m},'Area');
      j22(n,m)=c23{n,m}.Area;
      c24{n,m}=regionprops(c21{n,m},'Centroid');
      j23(n,m)=c24{n,m}(1).Centroid(1);
      j24(n,m)=j21(n,m)^2/4*pi*j22(n,m);
      c25{n,m}=regionprops(c21{n,m},'Extent');
      j25(n,m)=c25{n,m}.Extent;
      j26(n,m)=c24{n,m}(1).Centroid(2);
      c29{n,m}=regionprops(c21{n,m},'Solidity');
      j27(n,m)=c29{n,m}.Solidity;
      c27{n,m}=regionprops(c21{n,m},'Extrema');
      j28(n,m)=c27{n,m}(1).Extrema(1);
      j29(n,m)=c27{n,m}(1).Extrema(2);
      j30(n,m)=c27{n,m}(1).Extrema(3);
      j31(n,m)=c27{n,m}(1).Extrema(4);
      j32(n,m)=c27{n,m}(1).Extrema(5);
      j33(n,m)=c27{n,m}(1).Extrema(6);
      j34(n,m)=c27{n,m}(1).Extrema(7);
      j35(n,m)=c27{n,m}(1).Extrema(8);
%       j36(n,m)=c27{n,m}(1).Extrema(9);
%       j37(n,m)=c27{n,m}(1).Extrema(10);
%       j38(n,m)=c27{n,m}(1).Extrema(11);
%       j39(n,m)=c27{n,m}(1).Extrema(12);
%       j40(n,m)=c27{n,m}(1).Extrema(13);
%       j41(n,m)=c27{n,m}(1).Extrema(14);
%       j42(n,m)=c27{n,m}(1).Extrema(15);
%       j43(n,m)=c27{n,m}(1).Extrema(16);
%       j44(n,m)=c27{n,m}(1).Extrema(1)^2+c27{n,m}(1).Extrema(9)^2;
%       j45(n,m)=c27{n,m}(1).Extrema(2)^2+c27{n,m}(1).Extrema(10)^2;
%       j46(n,m)=c27{n,m}(1).Extrema(3)^2+c27{n,m}(1).Extrema(11)^2;
%       j47(n,m)=c27{n,m}(1).Extrema(4)^2+c27{n,m}(1).Extrema(12)^2;
%       j48(n,m)=c27{n,m}(1).Extrema(5)^2+c27{n,m}(1).Extrema(13)^2;
%       j49(n,m)=c27{n,m}(1).Extrema(6)^2+c27{n,m}(1).Extrema(14)^2;
%       j50(n,m)=c27{n,m}(1).Extrema(7)^2+c27{n,m}(1).Extrema(15)^2;
%       j51(n,m)=c27{n,m}(1).Extrema(8)^2+c27{n,m}(1).Extrema(16)^2;
      
      
      
      
%     A9{n,m}=regionprops(c{n,m}(1).ConvexImage,'Orientation');%this one is
%     not so useful
% 
%     j9{n,m}=(A9{n,m}.Orientation); %orientation doesnt work
    
end
% figure , imshow(c{1,m}(1).ConvexImage)
end
 


% k=c{5,5};
% x=k.ConvexHull(:,1);
% y=k.ConvexHull(:,2);
% plot(x,y)
%% 

        
        
%% 

nmclasses=10;
for n=1:nmclasses
 maxj1(n)=max(j(:,n));
 if n>7
 minj1(n)=min(j(1:38,n));
 else
 minj1(n)=min(j(:,n));    
 end
end
for n=1:nmclasses
 maxj2(n)=max(j2(:,n));
 if n>7
 minj2(n)=min(j2(1:38,n));
 else
 minj2(n)=min(j2(:,n));
 end
end
for n=1:nmclasses
 maxj3(n)=max(j3(:,n));
 if n>7
 minj3(n)=min(j3(1:38,n));
 else
 minj3(n)=min(j3(:,n));
 end
end
for n=1:nmclasses
 maxj4(n)=max(j4(:,n));
 if n>7
 minj4(n)=min(j4(1:38,n));
 else
 minj4(n)=min(j4(:,n));
 end
end
for n=1:nmclasses
 maxj5(n)=max(j5(:,n));
 if n>7
 minj5(n)=min(j5(1:38,n));
 else
 minj5(n)=min(j5(:,n));
 end
end
for n=1:nmclasses
 maxj6(n)=max(j6(:,n));
 if n>7
 minj6(n)=min(j6(1:38,n));
 else
 minj6(n)=min(j6(:,n));
 end
end
for n=1:nmclasses
 maxj7(n)=max(j7(:,n));
 if n>7
 minj7(n)=min(j7(1:38,n));
 else
 minj7(n)=min(j7(:,n));
 end
end
for n=1:nmclasses
 maxj8(n)=max(j8(:,n));
 if n>7
 minj8(n)=min(j8(1:38,n));
 else
 minj8(n)=min(j8(:,n));
 end
end
for n=1:nmclasses
 maxj8(n)=max(j8(:,n));
 if n>7
 minj8(n)=min(j8(1:38,n));
 else
 minj8(n)=min(j8(:,n));
 end
end
 for n=1:nmclasses
 maxj9(n)=max(j9(:,n));
 if n>7
 minj9(n)=min(j9(1:38,n));
 else
 minj9(n)=min(j9(:,n));
 end
 end
 for n=1:nmclasses
 maxj10(n)=max(j10(:,n));
 if n>7
 minj10(n)=min(j10(1:38,n));
 else
 minj10(n)=min(j10(:,n));
 end
 end
 for n=1:nmclasses
 maxj11(n)=max(j11(:,n));
 if n>7
 minj11(n)=min(j11(1:38,n));
 else
 minj11(n)=min(j11(:,n));
 end
 end
 for n=1:nmclasses
 maxj12(n)=max(j12(:,n));
 if n>7
 minj12(n)=min(j12(1:38,n));
 else
 minj12(n)=min(j12(:,n));
 end
 end
 for n=1:nmclasses
 maxj13(n)=max(j13(:,n));
 if n>7
 minj13(n)=min(j13(1:38,n));
 else
 minj13(n)=min(j13(:,n));
 end
 end
 for n=1:nmclasses
 maxj14(n)=max(j14(:,n));
 if n>7
 minj14(n)=min(j14(1:38,n));
 else
 minj14(n)=min(j14(:,n));
 end
 end
 for n=1:nmclasses
 maxj15(n)=max(j15(:,n));
 if n>7
 minj15(n)=min(j15(1:38,n));
 else
 minj15(n)=min(j15(:,n));
 end
 end
 for n=1:nmclasses
 maxj16(n)=max(j16(:,n));
 if n>7
 minj16(n)=min(j16(1:38,n));
 else
 minj16(n)=min(j16(:,n));
 end
 end
 for n=1:nmclasses
 maxj17(n)=max(j17(:,n));
 if n>7
 minj17(n)=min(j17(1:38,n));
 else
 minj17(n)=min(j17(:,n));
 end
 end
 for n=1:nmclasses
 maxj18(n)=max(j18(:,n));
 if n>7
 minj18(n)=min(j18(1:38,n));
 else
 minj18(n)=min(j18(:,n));
 end
 end
 for n=1:nmclasses
 maxj19(n)=max(j19(:,n));
 if n>7
 minj19(n)=min(j19(1:38,n));
 else
 minj19(n)=min(j19(:,n));
 end
  end
for n=1:nmclasses
  maxj20(n)=max(j20(:,n));
  if n>7
  minj20(n)=min(j20(1:38,n));
  else
  minj20(n)=min(j20(:,n));
  end
end
for n=1:nmclasses
  maxj21(n)=max(j21(:,n));
  if n>7
  minj21(n)=min(j21(1:38,n));
  else
  minj21(n)=min(j21(:,n));
  end
end
for n=1:nmclasses
  maxj22(n)=max(j22(:,n));
  if n>7
  minj22(n)=min(j22(1:38,n));
  else
  minj22(n)=min(j22(:,n));
  end
end
for n=1:nmclasses
  maxj23(n)=max(j23(:,n));
  if n>7
  minj23(n)=min(j23(1:38,n));
  else
  minj23(n)=min(j23(:,n));
  end
end
for n=1:nmclasses
  maxj24(n)=max(j24(:,n));
  if n>7
  minj24(n)=min(j24(1:38,n));
  else
  minj24(n)=min(j24(:,n));
  end
end
for n=1:nmclasses
  maxj25(n)=max(j25(:,n));
  if n>7
  minj25(n)=min(j25(1:38,n));
  else
  minj25(n)=min(j25(:,n));
  end
end
for n=1:nmclasses
  maxj26(n)=max(j26(:,n));
  if n>7
  minj26(n)=min(j26(1:38,n));
  else
  minj26(n)=min(j26(:,n));
  end
end
for n=1:nmclasses
  maxj27(n)=max(j27(:,n));
  if n>7
  minj27(n)=min(j27(1:38,n));
  else
  minj27(n)=min(j27(:,n));
  end
end
for n=1:nmclasses
  maxj28(n)=max(j28(:,n));
  if n>7
  minj28(n)=min(j28(1:38,n));
  else
  minj28(n)=min(j28(:,n));
  end
end
for n=1:nmclasses
  maxj29(n)=max(j29(:,n));
  if n>7
  minj29(n)=min(j29(1:38,n));
  else
  minj29(n)=min(j29(:,n));
  end
end
for n=1:nmclasses
  maxj30(n)=max(j30(:,n));
  if n>7
  minj30(n)=min(j30(1:38,n));
  else
  minj30(n)=min(j30(:,n));
  end
end
for n=1:nmclasses
  maxj31(n)=max(j31(:,n));
  if n>7
  minj31(n)=min(j31(1:38,n));
  else
  minj31(n)=min(j31(:,n));
  end
end
for n=1:nmclasses
  maxj32(n)=max(j32(:,n));
  if n>7
  minj32(n)=min(j32(1:38,n));
  else
  minj32(n)=min(j32(:,n));
  end
end
for n=1:nmclasses
  maxj33(n)=max(j33(:,n));
  if n>7
  minj33(n)=min(j33(1:38,n));
  else
  minj33(n)=min(j33(:,n));
  end
end
for n=1:nmclasses
  maxj34(n)=max(j34(:,n));
  if n>7
  minj34(n)=min(j34(1:38,n));
  else
  minj34(n)=min(j34(:,n));
  end
end
for n=1:nmclasses
  maxj35(n)=max(j35(:,n));
  if n>7
  minj35(n)=min(j35(1:38,n));
  else
  minj35(n)=min(j35(:,n));
  end
end


 %% 
  matmin=[minj1;minj2;minj3;minj4;minj5;minj6;minj7;minj8;minj9;minj10;minj11;minj12;minj13;minj14;minj15;minj16;minj17;minj18;minj19;minj20;minj21;minj22;minj23;minj24;minj25;minj26;minj27;minj28;minj29;minj30;minj31;minj32;minj33;minj34;minj35];
  matmax=[maxj1;maxj2;maxj3;maxj4;maxj5;maxj6;maxj7;maxj8;maxj9;maxj10;maxj11;maxj12;maxj13;maxj14;maxj15;maxj16;maxj17;maxj18;maxj19;maxj20;maxj21;maxj22;maxj23;maxj24;maxj25;maxj26;maxj27;maxj28;maxj29;maxj30;maxj31;maxj32;maxj33;maxj34;maxj35];
  %allmat=[minj1;maxj1;minj2;maxj2;minj3;maxj3;minj4;maxj4;minj5;maxj5;minj6;maxj6;minj7;maxj7;minj8;maxj8;minj9;maxj9;minj10;maxj10;minj11;maxj11
     % ;minj12;maxj12;minj13;maxj13;minj14;maxj14;minj15;maxj15;minj16;maxj16;minj17;maxj17;minj18;maxj18];
%% 
img(nbIm,10,35)=0;
for m = 1:10
    for n = 1:nbIm
        imgg(n,m,1)=j(n,m);
        imgg(n,m,2)=j2(n,m);
        imgg(n,m,3)=j3(n,m);
        imgg(n,m,4)=j4(n,m);
        imgg(n,m,5)=j5(n,m);
        imgg(n,m,6)=j6(n,m);
        imgg(n,m,7)=j7(n,m);
        imgg(n,m,8)=j8(n,m);
        imgg(n,m,9)=j9(n,m);
        imgg(n,m,10)=j10(n,m);
        imgg(n,m,11)=j11(n,m);
        imgg(n,m,12)=j12(n,m);
        imgg(n,m,13)=j13(n,m);
        imgg(n,m,14)=j14(n,m);
        imgg(n,m,15)=j15(n,m);
        imgg(n,m,16)=j16(n,m);
        imgg(n,m,17)=j17(n,m);
        imgg(n,m,18)=j18(n,m);
        imgg(n,m,19)=j19(n,m);
        imgg(n,m,20)=j20(n,m);
        imgg(n,m,21)=j21(n,m);
        imgg(n,m,22)=j22(n,m);
        imgg(n,m,23)=j23(n,m);
        imgg(n,m,24)=j24(n,m);
        imgg(n,m,25)=j25(n,m);
        imgg(n,m,26)=j26(n,m);
        imgg(n,m,27)=j27(n,m);
        imgg(n,m,28)=j28(n,m);
        imgg(n,m,29)=j29(n,m);
        imgg(n,m,30)=j30(n,m);
        imgg(n,m,31)=j31(n,m);
        imgg(n,m,32)=j32(n,m);
        imgg(n,m,33)=j33(n,m);
        imgg(n,m,34)=j34(n,m);
        imgg(n,m,35)=j35(n,m);
        
        
        
    end    
end        
%% 
 classs=zeros(nbIm,10,10);
 confussionmat=zeros(10);
 nmsignatures=35;
for i= 1:10
    for j= 1:nbIm
        for m=1:nmsignatures
            for n=1:nmclasses
                if (imgg(j,i,m)>matmax(m,n) | matmin(m,n)>imgg(j,i,m)) 
                    classs(j,i,n)=classs(j,i,n)+1;
                end
            end        
        end
     [y h]=min(classs(j,i,:));
     %jjl=find((classs(j,i,:)==0));
     %oo=size(jjl)
     %if (oo(1)==1)
     confussionmat(i,h)=confussionmat(i,h)+1;    
     end 
end

%%
all=sum(sum(confussionmat));
part=sum(diag(confussionmat));
res=part/all
% oo=size(x)
% if (oo(1)>1) 
%    oo(1)
%    
% end    
%[y h]=min(classs(j,i,:));
