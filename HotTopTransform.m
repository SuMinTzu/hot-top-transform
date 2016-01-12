%%Hw4-1
img = imread('test.PNG');
figure(1);imshow(uint8(img));
[frameHeight, frameWidth, D] = size(img);
b=[0 1 0;1 1 1;0 1 0];
img1=imdilate(img,b);
%figure(2);imshow(uint8(img1));%¤º«Ø¿±µÈ
%%
%try-dilation
b=[0 1 0;1 1 1;0 1 0];
for m=2:frameWidth-1
    for l=2:frameHeight-1
        S=[];
        i=1;
        for y=1:3
            for x=1:3
                S(i)=img(l-2+x,m-2+y);
                i=i+1;
            end
        end
        img2(l,m)=max(S);
    end
end
figure(3);imshow(uint8(img2));%dailation
%%
%try-erosion
b=[0 1 0;1 1 1;0 1 0];
for m=2:frameWidth-1
    for l=2:frameHeight-1
        S=[];
        i=1;
        for y=1:3
            for x=1:3
                S(i)=img(l-2+x,m-2+y);
                i=i+1;
            end
        end
        img3(l,m)=min(S);
    end
end
figure(4);imshow(uint8(img3));%erosion
%%
[Height, Width, D] = size(img2);
for m=1:Width
    for l=1:Height
        img4(l,m)=img2(l,m)-img3(l,m);
    end
end
figure(5);imshow(uint8(img4));%dailation-erosion
%hw4-2
%%
%try-Top-hat
for m=2:Width-1
    for l=2:Height-1
        S=[];
        i=1;
        for y=1:3
            for x=1:3
                S(i)=img3(l-2+x,m-2+y);
                i=i+1;
            end
        end
        img2_1(l,m)=max(S);
    end
end
figure(6);imshow(uint8(img2_1)/2);%dailation(erosion)
%%
[Height1, Width1, D] = size(img2_1);
for m=1:Width1
    for l=1:Height1
        img2_2(l,m)=img(l,m)-img2_1(l,m);
    end
end
figure(7);imshow(uint8(img2_2));%ori-dailation(erosion)
