%% Load data
load('../data_examples/nonlinear_drift_correction_synthetic_dataset_for_testing.mat')

%% 1.  Show that both images have horizontal scanline directions.
figure('Name','Measured data 0deg');imagesc(image00deg); axis equal off; colormap(gray(256));
figure('Name','Measured data 90deg');imagesc(image90deg); axis equal off; colormap(gray(256));

%% 2a.  Next, initialize the correction struct:
sMerge = SPmerge01linear([0 90],image00deg,image90deg);

%% 2b. Correct refference position
sMerge.ref = [560 450] %auto is [320,320]

%% 3a.  Perform wrinkle smoothing:
sMerge = SPmerge02(sMerge, 0, 8)

%% 3b.  Perform the drift correction:
sMerge = SPmerge02(sMerge, 32, 0)

%% 4.  Generate a final reconstructed output image:
imageFinal = SPmerge03(sMerge);

%% 5.  Compare final image with ideal image
figure('Name','Ground truth'); imagesc(imageIdeal); axis equal off; colormap(gray(256))