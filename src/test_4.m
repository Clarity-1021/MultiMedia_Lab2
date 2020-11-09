clc;clear;
%% 输入图片路径 检查图片格式是否符合要求；检查图片文件是否存在
% 确保图片存在，且格式正确
[I, img_path] = check_img_format();
if isempty(I)
    error('输入的图片不正确.');
end

[img_y, img_x, img_z] = size(I); % 获取图片各个分量的大小

%% 确保是rgb图
if img_z ~= 3
    error('图片不是rgb图.');
end

%% 加椒盐
J = imnoise(I, 'salt & pepper', 0.04); % 叠加密度为 0.04 的椒盐噪声。

%% medfilt过滤噪声
filter1 = medfilt3(J, [3 3 3]); % 中值,窗口大小为 3×3×3

%% imfilter过滤噪声
h = fspecial('average', [3 3]); % 均值,窗口大小为 3×3
filter2 = imfilter(J ,h);

%% 存中值过滤后的图
medfilt3_img_path = strrep(img_path, '.', '_medfilt3.');
imwrite(filter1, medfilt3_img_path);

%% 存均值过滤后的图
average_img_path = strrep(img_path, '.', '_average.');
imwrite(filter2, average_img_path);

%% 所有样式的图片在一个figure上进行比较
figure,
    subplot(2,2,1),imshow(I);
    title('orginal');
    subplot(2,2,2),imshow(J);
    title('salt & pepper');
    subplot(2,2,3),imshow(filter1);
    title('medfilt3');
    subplot(2,2,4),imshow(filter2);
    title('average');
