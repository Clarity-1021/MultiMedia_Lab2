clc;clear;
%% ����ͼƬ·�� ���ͼƬ��ʽ�Ƿ����Ҫ�󣻼��ͼƬ�ļ��Ƿ����
% ȷ��ͼƬ����
[I, img_path] = check_img_format();
if isempty(I)
    error('�����ͼƬ����ȷ.');
end

[img_y, img_x, img_z] = size(I); % ��ȡͼƬ���������Ĵ�С

%% ����ͼƬ����x ����Ƿ�Ϊ���������߽�
x = input('x:', 's');
x = str2double(x);
% ��������x�Ƿ�Ϸ�������Ϊ��ͼƬ��x��Χ�ڵ�����
while x ~= fix(x) || x > img_x || x < 1 
    disp('������Ϸ�������x.');
    x = input('x:', 's');
    x = str2double(x);
end

%% ����ͼƬ����y ����Ƿ�Ϊ���������߽�
y = input('y:', 's');
% y = '99';
y = str2double(y);
% ��������x�Ƿ�Ϸ�������Ϊ��ͼƬ��x��Χ�ڵ�����
while y ~= fix(y) || y > img_y || y < 1 
    disp('������Ϸ�������y.');
    y = input('y:', 's');
    y = str2double(y);
end

%% ���(x, y)����Χ8�����(R,G,B) ���߽�
if y == 1
    yStrat = y;
else
    yStart = y - 1;
end

if y == img_y
    yEnd = y;
else
    yEnd = y + 1;
end

if x == 1
    xStrat = x;
else
    xStart = x - 1;
end

if x == img_x
    xEnd = x;
else
    xEnd = x + 1;
end

for i=yStart:yEnd
    for j=xStart:xEnd
        fprintf('(%d,%d):(%d,%d,%d)\n', i, j, I(i, j, 1), I(i, j, 2), I(i, j, 3));
    end
end

