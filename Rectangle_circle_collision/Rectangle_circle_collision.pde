// Rectangle-circle collision
//Click to pause animation


int rad = 40;        // Radius of ball
float xpos, ypos;    // Center coordinates of ball
float xspeed = 2.0;  // x-speed of ball
float yspeed = 2.0;  // y-speed of ball
int xdirection = 1;  // x-direction units
int ydirection = 1;    // y-direction units
boolean pause = true; //for pausing animation with Click
int left = 400; //left side square
int right = 500; //right
int top = 250; //top of square
int bot = 350; //bottom



 
void setup() 
{
  size(900, 600);
  noStroke();
  frameRate(150);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = rad + 90;
  ypos = rad + 60;
  
  
   smooth();
   
}

void draw() 
{
 //formatting
  background(240,240,200);
  textSize(32);

  fill(100,100,100);
  
  //red and blue pieces and interface
  noStroke();
  fill(100, 100, 255); //fill ball
  ellipse(xpos, ypos, rad, rad); //draw ball
  
  fill(255, 100, 0);
  rect(400, 250, 100, 100);
  
   //update yleft and yright

      // Update ball position
  xpos = xpos - ( xspeed * xdirection );
  ypos = ypos - ( yspeed * ydirection );
  
  
  if ( (xpos - rad <= 0) || (xpos + rad >= width) ) 
  {
    xdirection *= -1;
  }
  
   if ( (ypos + rad >= height) || (ypos - rad <= 0) ) 
  {
    ydirection *= -1;
  }
    
    
    
    
   
  // COLLISIONS
 

 // left side
 else if ( (xpos < left) && (ypos > top) && (ypos < bot) )
  {
    if (xpos + rad >= left)
    {
      xdirection *= -1;
    }
  }
  
  
  // right side
  else if ( (xpos > right) && (ypos > top) && (ypos < bot) )
  {
    if (xpos - rad <= right)
    {
      xdirection *= -1;
    }
  }
  
  // top side
  else if ( (ypos < top) && (xpos > left) && (xpos < right) )
  {
    if (ypos + rad >= top)
    {
      ydirection *= -1;
    }
  }
  
  // bottom side
 else if ( (ypos > bot) && (xpos > left) && (xpos < right) )
  {
    if (ypos - rad <= bot) 
    {
      ydirection *= -1;
    }
  }
  
  //top left corner
 else if ( (xpos <= left) && (ypos <= top) ) 
  {
    if (dist(xpos, ypos, left, top) <= rad ) 
    {
      if (left - xpos > top - ypos)
      {
        xdirection *= -1;
      }
      else if (left - xpos < top - ypos)
      {
        ydirection *= -1;
      }
      else if (left - xpos == top - ypos) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //top right corner
  else if ( (xpos >= right) && (ypos <= top) ) 
  {
    if (dist(xpos, ypos, right, top) <= rad ) 
    {
      if (xpos - right > top - ypos)
      {
        xdirection *= -1;
      }
      else if (xpos - right < top - ypos)
      {
        ydirection *= -1;
      }
      else if (xpos - right == top - ypos) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //bottom left corner
 else if ( (xpos <= left) && (ypos >= bot) ) 
  {
    if (dist(xpos, ypos, left, bot) <= rad ) 
    {
      if (left - xpos > ypos - bot)
      {
        xdirection *= -1;
      }
      else if (left - xpos < ypos - bot)
      {
        ydirection *= -1;
      }
      else if (left - xpos == ypos - bot) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //bottom right corner
else if ( (xpos >= right) && (ypos >= bot) ) 
  {
    if (dist(xpos, ypos, right, bot) <= rad ) 
    {
      if (xpos - right > ypos - bot)
      {
        xdirection *= -1;
      }
      else if (xpos - right < ypos - bot)
      {
        ydirection *= -1;
      }
      else if (xpos - right == ypos - bot) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
}
        

void mousePressed() {
 if (pause == true) {
 if (mousePressed == true) // pause/play function
 {
   if (looping)
   {
     noLoop();
     noStroke();
     textSize(32);
     fill(150,150,150);
      text("Paused", width - 130, height - 20);
   }
   else loop();
 }
 }
}

    
  
  

  