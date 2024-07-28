function plateSizeBound = detectplate_bluestrip(picture_full, open_figure)
    blueStripFile = 'bluestrip.png';
    RESIZE_WIDTH = 800;
    RESIZE_LENGTH= 600;
    ERR_MARGIN = 10;
    BLUE2PLATE_RATIO = 14;
    threshold = 0.5;
       
    if nargin < 2
        open_figure = true;
    end

    bluestrip = imread(blueStripFile);
    picture = imresize(picture_full, [RESIZE_LENGTH, RESIZE_WIDTH]);
    ratio = size(picture_full, 1) / size(picture, 1);

    [~, corr_max, detection] = rgb_corr2(bluestrip, picture);

    fullSizeBound = [round((detection(1) - ERR_MARGIN) * ratio), ...
                round((detection(2) - ERR_MARGIN) * ratio), ...
                round((detection(3) + 2 * ERR_MARGIN) * ratio), ...
                round((detection(4) + 2 * ERR_MARGIN) * ratio)];

    plateSizeBound = fullSizeBound;
    plateSizeBound(3) = BLUE2PLATE_RATIO * detection(3) * ratio;

    if open_figure
        figure('Name', 'Blue Strip Search');
        subplot(2, 2, 1)
        imshow(picture)
        title('Picture')
        subplot(2, 2, 2)
        imshow(bluestrip)
        title('Template')
        subplot(2, 2, 3)
        imshow(picture_full)
        hold on
        rectangle('Position', fullSizeBound, 'edgecolor', 'r', 'linewidth', 2);
        rectangle('Position', plateSizeBound, 'edgecolor', 'g', 'linewidth', 1);
        if corr_max < threshold
            title('Match [Failed]')
        else
            title('Match [Success]')
        end
    end

    if corr_max < threshold
        plateSizeBound = [];
    end
end

function [corr_mix, corr_max, detection] = rgb_corr2(template, pic)
    corrRed = normxcorr2(template(:, :, 1), pic(:, :, 1));
    corrGrn = normxcorr2(template(:, :, 2), pic(:, :, 2));
    corrBlu = normxcorr2(template(:, :, 3), pic(:, :, 3));
    corr_mix = (corrRed + corrGrn + corrBlu) / 3;
    [corr_max, corrIndex] = max(abs(corr_mix(:)));
    [peakY, peakX] = ind2sub(size(corr_mix), corrIndex(1));
    corr_offset = [peakX - size(template, 2), peakY - size(template, 1)];
    detection = [corr_offset(1), corr_offset(2), size(template, 2), size(template, 1)];
end
