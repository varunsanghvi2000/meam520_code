% Place your code for computing the workspace of the Lynx robot here.


for i=-1.4:0.1:1.4
    lynxServo(i,i,0,0,0,10);
    pause(1);
end