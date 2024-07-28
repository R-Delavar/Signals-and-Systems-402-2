noise = randn(1 , 3000);

disp(["Mean of the Gaussian Noise is : " , mean(noise) ]);
disp(["Variance of the Gaussian Noise is : " , var(noise) ]);

disp(["Rounded mean of the Gaussian Noise is : " , round(mean(noise)) ]);
disp(["Rounded variance of the Gaussian Noise is : " , round(var(noise)) ]);

histogram(noise)