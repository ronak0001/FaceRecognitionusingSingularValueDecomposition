# FaceRecognitionusingSingularValueDecomposition

As we know about Linear Algebra and its importance in various applications and areas. eigen values and eigen vectors were used here to recognize a given image. Having numerous images as database, firstly we create a normalized image matrix having images stored as column vectors. Now, having computed the image matrix, we calculate its svd components. So, initially we have mxn sized image matrix, after finding svd of it we get U(mxm), sigma(mxn), V(nxn). Here, U forms basis of our database images.
Then we take any random image from the database as a test image, normalize it and project it on the space of U matrix. After projecting it to that space, we calculate euclidean distance of the test image projected on basis space and original column vectors as images. You'll have n values calculated as euclidean distance, one having minimum amount of distance will be your recognized image.

Note: I've added a zip folder named "Dataset" which contains images of my squad of Indian Cricket Team for ICC World Cup 2019. ;P :) You can add images of your choice to in a folder with the same name in the working directory before running this code.

P.S.: You can also do a bit change in algorithm and put a threshold, and say all the values of euclidean distance having lesser value than threshold are recognized images.
