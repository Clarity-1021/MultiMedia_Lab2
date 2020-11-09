clc;clear;
%% ����ͼƬ·�� ���ͼƬ��ʽ�Ƿ����Ҫ�󣻼��ͼƬ�ļ��Ƿ����
% ȷ��ͼƬ���ڣ��Ҹ�ʽ��ȷ
[I, img_path] = check_img_format();
if isempty(I)
    error('�����ͼƬ����ȷ.');
end

[img_y, img_x, img_z] = size(I); % ��ȡͼƬ���������Ĵ�С

%% ȷ���ǻҶ�ͼ
if img_z ~= 1
    error('ͼƬ���ǻҶ�ͼ.');
end

%% ת���Ҷ�ͼΪ�Ҷ�����ͼ��ֱ��ͼ���⻯ͼ
Jadjust = imadjust(I, [0.2 0.6], [0 1]); % �Ҷ�����
Jhisteq = histeq(I); % ֱ��ͼ���⻯

%% ��Ҷ�����ͼ
adjust_img_path = strrep(img_path, '.', '_adjust.');
imwrite(Jadjust, adjust_img_path);

%% ��ֱ��ͼ���⻯ͼ
histeq_img_path = strrep(img_path, '.', '_histeq.');
imwrite(Jhisteq, histeq_img_path);

%% ������ʽ��ͼƬ����ֱ��ͼ��һ��figure�Ͻ��бȽ�
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