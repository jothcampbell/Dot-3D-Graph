//initilize the x y and z loop incrementing vars
int span = 500;
int x = -span;
int y = -span;
int z = - span;
boolean draw = true;
boolean input = true;
//               x2 y2 z2 xy xz yz x  y  z  c
float coEfs[] = {1, 1, 1, 0, 0, 0, 0,0 , 0, -4};
//               0  1   2  3 4 5 6 7 8 9  
String message = "001";
boolean pressedOnce = true;
int num = 876;
int index = 0;
float mod = 1.9;


//setup the window properly, redefine coordinate system as nesscesary
void setup(){
  size(900,700);
  background(0);
  stroke(200);
  //textSize(90);
}
//start the draw funciton 
void draw(){
  print(int(message.charAt(0))-48);
  
  
  //if (input){
  //  background(0);

  //  if (mousePressed){input = false;}
  //}
  //  if(keyPressed && pressedOnce){
  //  coEfs[co] = key-48;
  //  print(coEfs[co],' ',co,'\n');
  //  co ++;
  //  pressedOnce = false;
  //}
    
  if(draw){
    background(0);
    for(x = -span; x<=span;x++){
      for( y = -span; y<=span; y++){
        for( z = -span; z<=span; z+=span/50){
          
          if(f(x,y,z)){
            stroke(-z,z,150 - (z/5.));
            print(x," ",y,' ',z,"\n");
            point((-x/1)+width/2,(-y/1)+height/2);
          }
        }
      }
    }
    
    //ensures the calculation loop shuts down when needed
    draw = false;
    //print the parameters at the end
    message = coEfs[0] + "x^2 + "+ coEfs[1] + "y^2 + " +coEfs[2] + "z^2 + " +coEfs[3] + "xy + " +coEfs[4] + "xz + ";
    message = message + coEfs[5] + "yz + " + coEfs[6] + "x + " + coEfs[7] + "y + " + coEfs[8] + "z + " + coEfs[9];
    fill(255);
    text(message, 20, height - 20);
    //increment the num counter and save the picture
    saveFrame("SavedGraphs/graph"+num+".jpg");
    //for(index = 0; index<=8;index++){coEfs[index] = ((-1)^int(random(1,3)))*(binary(num,10).charAt(index)-48);print(binary(num,10));}
    coEfs[4] = mod;
    mod += .01;
    num ++;
  }
  //if(!keyPressed && !pressedOnce){pressedOnce = true;}  
  //if (mousePressed){print(x," ",y,' ',z,"\n");}
  draw = true;
  //if((num>=50)){draw = false;}
  //print(coEfs[9]);
}


//define function being drawn
boolean f(float xN, float yN, float zN){
  boolean point;
  xN = xN/50.;
  yN = yN/50.;
  zN = zN/50.;
  if(int(20*((xN*xN*coEfs[0])+(yN*yN*coEfs[1])+(zN*zN*coEfs[2])+(xN*yN*coEfs[3])+(xN*zN*coEfs[4])+(yN*zN*coEfs[5])+(xN*coEfs[6])+(yN*coEfs[7])+(zN*coEfs[8])+coEfs[9]))==0){//(int(100*((xNot*xNot)/(5.) + (yNot*yNot)/(5.))) == int(100*(-(1/5.)*zNot*zNot+1))){//(int((xNot*xNot)*100) == int((yNot)*100)){//(int(100*(zNot*zNot + xNot*xNot)) == int(100*(yNot))){//
    point = true;
    //print("its running","\n");
  }
  else{ point = false;}
  return point;
}
