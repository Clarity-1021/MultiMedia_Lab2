function[gray_variance, gray_img_path] = rgb2gray()
    gray_variance = -1;
    gray_img_path = '';
    
    %% 确保图片存在，且格式正确

    [I, img_path] = check_img_format();
    if isempty(I)
        return;
    end
    
    [img_y, img_x, img_z] = size(I); % 获取图片各个分量的大小

    %% 确保是rgb图
    if img_z ~= 3
        disp('图片不是rgb图.');
        return;
    end

    %% 计算每一个点的灰度值、总灰度值、平均灰度值
    I = im2double(I); % rgb转成[0, 1]之间
    Gray = zeros(img_y, img_x); % 各点灰度
    for i=1:img_y
        for j=1:img_x
            Gray(i, j) = 0.299 * I(i, j, 1) + 0.587 * I(i, j, 2) + 0.114 * I(i, j, 3);
        end
    end
    gray_total = sum(sum(Gray)); % 总灰度
    point_count = img_x * img_y; % 总像素数
    gray_average = gray_total / point_count; % 平均灰度

    %% 求灰度方差
    gray_variance = sum(sum((Gray - gray_average).^2)) / point_count; % 灰度方差

    %% 存灰度图片
    gray_img_path = strrep(img_path, '.', '_gray.');
    imwrite(Gray, gray_img_path);
end