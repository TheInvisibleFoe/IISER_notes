#import "imports.typ":*

= Procedure for analysis of fringe images

During the experiment, we had access to only phone cameras to capture the interference fringes for analysis. To minimize the errors that will invariably be produced by a general purpose instrument like the camera, certain steps were taken to best standardise the data collection procedure:

1. A clean white paper was put up on the provided screen to minimize the non-uniformity of the screen surface, as the given surface had blemishes and marks.
2. A well defined rectangular region of interest (ROI) was drawn on the paper with a pen and scale. The dimensions of the rectangle was measured with a scale of least count $0.1 c m$.
3. The camera was set to manual mode ("Pro mode") so that exposure time and ISO could be standardized for all the images taken. The camera was affixed to a fixed vantage point, selected so that the skew in the image is minimal without affecting the axis of the experiment.
4. An evenly-lighted image of the screen with the rectangular ROI was taken as reference.

#figure(
  image("image_0.jpg", width: 30%),
  caption: [Reference image depicting the rectangular ROI used for spatial calibration.]
)

5. The experiment was carried out, and the actual raw interference images were captured using this fixed setup.

#figure(
  grid(
    columns: 2,
    gutter: 2mm,
    image("raw_fringes/20260312_155131.jpg", width: 100%),
    image("raw_fringes/20260312_155549.jpg", width: 100%)
  ),
  caption: [Raw interference fringes captured on the screen for the Red (655 nm) and Green (532 nm) laser sources.]
)

A stable background image for background subtraction was originally captured over a long exposure time. It was later determined that the effects of background subtraction were mostly negligible; the phone camera was unable to capture features of the dark background without illumination despite long exposure times, primarily due to the limited aperture of the camera.

This was followed by sequential computational processing of this data to extract fringe intensity information, as described below. All analysis was carried out in Python, utilizing standard implementations of algorithms available in the `scipy` and `numpy` libraries to preserve reproducibility.

== Spatial Deskewing and Calibration
The initial step corrects the perspective distortion caused by the camera's non-orthogonal viewing angle relative to the projection screen. A planar homography matrix $M in RR^(3 times 3)$ is determined using a physical reference rectangle of known dimensions via OpenCV's `cv2.getPerspectiveTransform` algorithm. The perspective transformation, executed via `cv2.warpPerspective`, maps source pixel coordinates $(x_s, y_s)$ to destination coordinates $(x'_d, y'_d)$ via:

$
  mat(x'_d; y'_d; w) = M mat(x_s; y_s; 1)
$

The final orthogonalized Cartesian coordinates are normalized by the homogeneous term $w$:
$ x_d = x'_d / w, quad y_d = y'_d / w $
This transformation not only corrects perspective geometric distortion but also establishes a global spatial scale $S$ in pixels per mm, anchoring pixel distances to accurate physical lengths based on our calibration ROI.

== Inward Boundary Cropping
To isolate the valid region of optical interference and exclude the macroscopic ink markings of the physical reference boundary, a spatial inward crop is applied. A fixed spatial pixel buffer $b$ is symmetrically subtracted from the transformed image margins:

$
  I_"crop" = I_"warp"[b : H - b, b : W - b]
$
where $H$ and $W$ represent the height and width of the de-skewed image.

== Fringe Alignment
To ensure accurate geometric integration during 1D profiling, the parallel fringes must be strictly aligned with the Cartesian axes of the image matrix. The global orientation of the fringes is computationally detected using spatial image gradients derived via OpenCV's discrete spatial derivative implementation (`cv2.Sobel`):

$
  G_x = I_("crop") * S_x, quad G_y = I_("crop") * S_y
$

The gradient magnitude $M_g(x,y)$ and geometric angle $Theta(x, y)$ are given by:
$ M_g = sqrt(G_x^2 + G_y^2), quad Theta = arctan(G_y / G_x) $

A magnitude-weighted frequency histogram of $Theta$ (`numpy.histogram`) is constructed to globally identify the dominant gradient angle $theta_d$ from the `cv2.cartToPolar` output. Because the planar optical fringes propagate orthogonally to their own intensity gradient, the corresponding optimal fringe rotation angle is extracted as $phi = theta_d + 90^degree$. The interference image is rotated by $phi$ utilizing `PIL.Image.rotate` with bicubic interpolation (`Image.Resampling.BICUBIC`), projecting the fringes perfectly parallel to the horizontal image axis.

== Grayscaling and Normalization
To isolate purely photometric information, the aligned RGB color image is converted to an 8-bit scalar grayscale representation defined by standard relative luminance (`cv2.cvtColor` utilizing `cv2.COLOR_BGR2GRAY`):
$ I_"gray" = 0.299 R + 0.587 G + 0.114 B $

To maximize the visual dynamic range of the interference pattern for precise Region of Interest (ROI) selection, a Min-Max affine normalisation (`cv2.normalize` utilizing `cv2.NORM_MINMAX`) is applied to stretch the pixel intensities uniformly across the dynamic range $[0, 255]$:
$ I_"norm" = 255 dot (I_"gray" - min(I_"gray")) / (max(I_"gray") - min(I_"gray")) $

== Region of Interest (ROI) Cropping
A bounding rectangular Region of Interest is visually extracted interactively from $I_"norm"$ utilizing OpenCV's `cv2.selectROI` interface. This isolates the most uniform interference fringes and rejects peripheral optical aberrations, thermal noise, and large background non-uniformities prior to 1D geographic projection.

#figure(
  grid(
    columns: 2,
    gutter: 2mm,
    image("cropped_intensity_fringes/20260312_155131_processed.jpg", width: 100%),
    image("cropped_intensity_fringes/20260312_155549_processed.jpg", width: 100%)
  ),
  caption: [Tightly cropped intensity Regions of Interest isolating the uniform parallel fringes for the Red (left) and Green (right) laser projections respectively.]
)


== 1D Binning and Transverse Profiling
To aggregate the parallel fringe data and suppress uncorrelated zero-mean sensor noise, the 2D interference pattern is dimensionally reduced into a transverse 1D profile sequence. The cropped ROI is computationally averaged along the spatial axis running parallel to the fringes utilizing the `numpy.mean` function, yielding a discrete mean transverse intensity profile $mu(d)$ as a function of the transverse spatial coordinate:

$
  mu(x) = 1/N sum_(n=0)^(N-1) I_"ROI"(x, n)
$
where $N$ is the bounding pixel length of the fringes along the averaging axis.
Simultaneously, the sample standard deviation $sigma(x)$ is computed via `numpy.std` to quantify the phase consistency and structural longitudinal uniformity of the grouped fringes:
$ sigma(x) = sqrt(1/N sum_(n=0)^(N-1) (I_"ROI"(x, n) - mu(x))^2) $
The transverse pixel coordinate $x$ is mapped to the physical domain distance $d$ via the scalar spatial calibration factor: $d = x \/ S$.

== Signal Smoothing (Low-Pass Filtering)
The raw 1D interference envelope $mu(x)$ frequently exhibits high-frequency secondary fringes or optical speckle noise superimposed randomly over the macroscopic intensity envelope. To isolate the primary low-frequency interference maxima without deteriorating the phase width, a stationary 1D Gaussian low-pass convolution filter is applied directly in the spatial domain leveraging SciPy's `scipy.ndimage.gaussian_filter1d`:

$
  mu_"smooth"(x) = mu(x) * ( 1/(sigma_f sqrt(2 pi)) e^(-x^2 / (2 sigma_f^2)) )
$

where $sigma_f$ defines the Gaussian kernel's effective standard deviation in pixels. This acts as a spatial low-pass filter, attenuating the localized, high-frequency oscillatory modes and generating a smooth sequence of principal fringe crests that are robust against narrow secondary mirror reflections.

#figure(
  grid(
    columns: 2,
    gutter: 2mm,
    image("analyzed_parallel_fringes/20260312_155131_processed_profile.png", width: 100%),
    image("analyzed_parallel_fringes/20260312_155549_processed_profile.png", width: 100%)
  ),
  caption: [Extracted transverse 1D photometric intensity profiles showcasing the raw spatial scatter (faint gray dots) resolved cleanly against the Gaussian-smoothed dominant interference envelope (thick line).]
)

== Mathematical Parameter Extraction (Non-Linear Regression)
With our clean, low-pass filtered intensity profiles successfully extracted, the final step is to physically model the system to precisely derive our operational parameters (such as the mirror Finesse, $F$). 

Initially, one might attempt to map the standard Airy transmission function formulated for diverging beams:
$ T = tau_0 / (1 + (4F^2 / pi^2) sin^2((2pi d)/lambda (1 - x^2/(2D^2)))) $

However, as is evident from looking closely at our cropped images, our specific optical setup produces uniformly spaced, parallel fringes, as opposed to the concentrically tightening circular interference rings created by placing a perfectly plane-parallel Fabry-Perot cavity directly in front of a heavily diverging lens. 

Because we are projecting a collimated beam that diverges only after completely passing through the cavity, purely parallel fringes can only geometrically manifest if the etalon mirrors are not perfectly, microscopically parallel. This structural variation produces what are formally known as Fizeau fringes (fringes of equal thickness), characterized entirely by a microscopic structural wedge angle $beta$ existing between the two interior plates.

To accurately model our empirical data globally without the optimizer failing to converge, we must decouple the spatial phase relationship from the standard concentric quadratic curve. For a wedged cavity projecting parallel fringes, the effective optical thickness $L_1(x)$ varies physically linearly across the transverse beam cross-section:
$ L_1(x) = d_"eff" + beta (x - x_0) $
where $d_"eff"$ is the nominal absolute spacing of the plates (physically measured exactly at $1.57$ mm in our apparatus) and $x_0$ represents the spatial center mass of the laser's transverse active Gaussian beam profile.

The exact observed analytical intensity $I(x)$ plotted on our screen is the product of the incident Gaussian beam envelope (with transverse waist $w$ and peak intensity $I_0$) passing through the augmented linear-phase Airy transmittance function outlined in the manual:
$ I(x) = I_0 exp((-2(x - x_0)^2)/w^2) dot 1 / (1 + (2F / pi)^2 sin^2( (2pi)/lambda (d_"eff" + beta (x - x_0)) )) + C $
where $C$ accounts for the systemic ambient dark-current floor present natively in the CMOS sensor.

To protect the non-linear global regression (`scipy.optimize.curve_fit`) from violently diverging along infinite cyclical phase bounds, we bounded the effective distance $d_"eff"$ tightly around the physically measured $1.57$ mm spacing, allowing it to vary radially by strictly no more than a single transmission wavelength $lambda$.

Finally, to reliably benchmark the localized optical resolution without the geometric slopes of the enveloping Gaussian bell curve mutating the width profiles, individual bright transmission fringes were physically isolated via defined spatial frequency windows and computationally fitted using a localized Cauchy-Lorentzian probability density estimation algorithm natively:
$ I_"local"(x) = y_0 + (2 A)/pi  gamma / (4(x - x_c)^2 + gamma^2) $
This guarantees exact $gamma$ (Full Width at Half Maximum, FWHM) optical measurements extracted entirely independently for every unique spatial resonance ridge.

#figure(
  grid(
    columns: 1,
    gutter: 5mm,
    image("fitted_fringes/20260312_155131_processed_fit.png", width: 85%),
    image("fitted_fringes/20260312_155549_processed_fit.png", width: 85%)
  ),
  caption: [Final Non-Linear Airy-Gaussian Regression mapping the derived structural limits against the empirical intensity traces for the localized Red (top) and Green (bottom) lasers.]
)

== Finesse Results
The global curve-fitting module converged upon structural physical equivalents for both the red and green Fabry-Perot projections, validating the linear Fizeau mathematical derivation natively.
- **Red Laser (655.0 nm)**: The generic global model extracted a stable operating Finesse of roughly $F = 0.8$, resolving an average local spatial FWHM ($gamma$) of roughly 8.64 mm.
- **Green Laser (532.0 nm)**: The global model extracted an operating Finesse near $F = 0.7$, displaying broader resonance crests computationally resolving an average local FWHM ($gamma$) roughly around 8.55 mm.
The presence of the structural linear wedge slope causing these parallel fringes was structurally calculated through regression to map around roughly $beta approx 2.05 times 10^(-5)$ to $2.75 times 10^(-5)$ radians, directly driving the physical parallel spatial interference nodes properly.