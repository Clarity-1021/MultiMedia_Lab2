clc;clear;
%% 输入图片路径 检查图片格式是否符合要求；检查图片文件是否存在
% 确保图片存在，且格式正确
[I, img_path] = check_img_format();
if isempty(I)
    error('输入的图片不正确.');
end

[img_y, img_x, img_z] = size(I); % 获取图片各个分量的大小

%% 确保是灰度图
if img_z ~= 1
    error('图片不是灰度图.');
end

%% 转化灰度图为灰度拉伸图和直方图均衡化图
Jadjust = imadjust(I, [0.2 0.6], [0 1]); % 灰度拉伸
Jhisteq = histeq(I); % 直方图均衡化

%% 存灰度拉伸图
adjust_img_path = strrep(img_path, '.', '_adjust.');
imwrite(Jadjust, adjust_img_path);

%% 存直方图均衡化图
histeq_img_path = strrep(img_path, '.', '_histeq.');
imwrite(Jhisteq, histeq_img_path);

%% 所有样式的图片及其直方图在一个figure上进行比较
figure,
    subplot(3,2,1),imshow(I);
    title('original');  
    subplot(3,2,3),imshow(Jadjust);
    title('adjust'); 
    subplot(3,2,5),imshow(Jhisteq);
    title('histeq');
    subplot(3,2,2),imhist(I);
    title('original');  
    subplot(3,2,4),imhist(Jadjust);
    title('adjust'); 
    subplot(3,2,6),imhist(Jhisteq);
    title('histeq'); 