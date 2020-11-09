function[I, img_path] = check_img_format()
    % 支持的10种文件格式，包括常见的位图格式和矢量图格式
    expression = '.(bmp|gif|jpeg|jpg|tiff|tif|png|psd|pcx|svg)$'; 
    disp('eg. img_1.jpg')
    img_path = input('image:', 's');
    startIndex = regexpi(img_path, expression); % 匹配图片格式
    % disp(startIndex);
    % 检查输入的图片不在不支持的格式之中，需要重新输入图片路径
    while isempty(startIndex)
        disp('不支持此图片格式，请重新输入图片路径.')
        img_path = input('image:', 's');
        startIndex = regexpi(img_path, expression);
    end
    I = [];
    % 确保图片存在
    try
        I = imread(img_path);
    catch ErrorInfo
        disp(ErrorInfo.message);
        return;
    end
end