function downsample_images(input_folder, output_folder, downsample_factor)
% input_folder: 输入文件夹
% output_folder: 输出文件夹
% downsample_factor: 降采样倍数
% Email:imagevisioner@bistu.edu.cn
% 获取输入文件夹中所有图像的文件名

tic
file_list = dir(fullfile(input_folder, '*.jpg'));

% 遍历所有图像
for i = 1:length(file_list)
    % 读取HR图像
    hr_img = imread(fullfile(input_folder, file_list(i).name));

    % 计算LR图像尺寸
    lr_size = size(hr_img) / downsample_factor;

    
    % 使用双三次插值降采样
    lr_img = imresize(hr_img, lr_size(1:2), 'bicubic');

    % 保存LR图像
    [~, name, ext] = fileparts(file_list(i).name);
    imwrite(lr_img, fullfile(output_folder, [name, '_LR', ext]));

end
toc
end