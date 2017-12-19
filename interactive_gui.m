figure
imshow('im5.png');

[x, y] = getpts;
size(x)
size(y)
hold;
for i=1:size(x)-1
%plot (x(i),y(i), 'b.', 'MarkerSize', 20);
disy=(y(i+1)-y(i))/2;
disx=(x(i+1)-x(i));
j1=x(i)-disy;
k1=y(i)-disy;
j2=x(i)+disy;
k2=y(i)+disy;
L=[j1 j2 j2 j1 j1];
M=[k1 k1 k2 k2 k1];
plot(L,M,'-','color','g');
end
% plot (x(i+1),y(i+1), 'b.', 'MarkerSize', 20);
%disy=(y(i+1)-y(i))/2;
%disx=(x(i+1)-x(i));
j1=x(i+1)-disy;
k1=y(i+1)-disy;
j2=x(i+1)+disy;
k2=y(i+1)+disy;
L=[j1 j2 j2 j1 j1];
M=[k1 k1 k2 k2 k1];
plot(L,M,'-','color','g');
