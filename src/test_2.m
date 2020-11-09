clc;clear;
%% 运行rgb2gray函数
[gray_variance, gray_img_path] = rgb2gray(); % 这个函数在rgb2gray.m文件中
if gray_variance == -1
    error('输入的图片不正确.');
end

disp(['灰度方差=', num2str(gray_variance)]);