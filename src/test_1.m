clc;clear;
%% 输入图片路径 检查图片格式是否符合要求；检查图片文件是否存在
% 确保图片存在
[I, img_path] = check_img_format();
if isempty(I)
    error('输入的图片不正确.');
end

[img_y, img_x, img_z] = size(I); % 获取图片各个分量的大小

%% 输入图片坐标x 检查是否为整数；检查边界
x = input('x:', 's');
x = str2double(x);
% 检查输入的x是否合法，必须为在图片的x范围内的整数
while x ~= fix(x) || x > img_x || x < 1 
    disp('请输入合法的整数x.');
    x = input('x:', 's');
    x = str2double(x);
end

%% 输入图片坐标y 检查是否为整数；检查边界
y = input('y:', 's');
% y = '99';
y = str2double(y);
% 检查输入的x是否合法，必须为在图片的x范围内的整数
while y ~= fix(y) || y > img_y || y < 1 
    disp('请输入合法的整数y.');
    y = input('y:', 's');
    y = str2double(y);
end

%% 输出(x, y)及周围8个点的(R,G,B) 检查边界
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

