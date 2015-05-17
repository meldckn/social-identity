
int numVertices = (int) random (8, 12);
float[] vertices = new float [numVertices*2];
float radius = 30;

float[] faceVertices = new float [8*2];

void setup() {

  jProcessingJS(this, {fullscreen:true, mouseoverlay:true});

  smooth();

  // Populate vertices for body
  for (int i=0; i<vertices.length; i+=2) {
    float theta = (float)(i/2) * 360/numVertices ;//+ random (10, 20);
    float radiusScalar = radius * random (.9, 1.1);
    vertices[i] = cos (radians(theta)) * radiusScalar; // x
    vertices[i+1] = sin (radians(theta)) * radiusScalar; // y
  }
}

void draw() {
  background (195,207,82);

  drawBody (width/2, height/2);
  drawFace (width/2, height/2 - (int) radius +2);
}

float[] populateFace (int x, int y) {

  float w = 12;
  float squareness = .7; // bet .1 and .9 (larger => more square)
  float h1 = 5;
  float h2 = 3;
  int numVertices = 8;
  float[] arr = new float[numVertices*2];

  // x values
  arr[0]  = arr[8]  = x; 
  arr[2]  = arr[6]  = x - w*squareness; // 2,6 and 14,10 might be different
  arr[14] = arr[10] = x + w*squareness;
  arr[4]  = x - w;
  arr[12] = x + w;

  // y values
  arr[1] = arr[3] = arr[15] = y - h1;
  arr[7] = arr[9] = arr[11] = y + h2;
  arr[5] = arr[13] = y;

  return arr;
}

void drawFace (int x, int y) {

  float[] vertices = populateFace (0, 0);

  pushMatrix();
  translate (x, y); 

  fill (255);
  //stroke (255, 0, 0);
  //strokeWeight (.75);

  beginShape();
  curveVertex (vertices[0], vertices[1]); // control point

  for (int i=0; i<vertices.length-1; i+=2) {
    curveVertex (vertices[i], vertices[i+1]);
  }

  // for a closed circular shape, repeat first three vertices
  // (the third one is a control point)
  for (int i=0; i<3*2; i+=2) {
    curveVertex (vertices[i], vertices[i+1]);
  }
  endShape(CLOSE);
  
  // Draw eyes at (2,y) and (14,y)
  fill(0);
  ellipse (vertices[2], 0,2,2);
  ellipse (vertices[14],0,2,2);
  
  for (int i=0; i<vertices.length-1; i+=2) {
    fill (255, 0, 0);
    if (i == vertices.length-4) fill (0, 0, 255);
    noStroke ();
    //ellipse (vertices[i], vertices[i+1], 2, 2);
  }

  popMatrix();
}

// Params: x,y: center point of body
void drawBody (int x, int y) {

  // curveTightness may be used for an expression variable,
  // but only between -.5 and .5, and better with fewer (~6) vertices
  float t = map (mouseX, 0, width, -.5, .5);
  //curveTightness(t); 

  pushMatrix();
  translate (x, y); 

  fill (0);
  //stroke (255, 0, 0);
  //strokeWeight (.75);

  beginShape();
    // First is control point
    curveVertex (vertices[0], vertices[1]);
    for (int i=0; i<vertices.length-1; i+=2) {
      curveVertex (vertices[i], vertices[i+1]);
    }
    // Repeat first 3 points for smooth closing curve
    for (int i=0; i<vertices.length-1*2; i+=2) {
      curveVertex (vertices[i], vertices[i+1]);
    }

  endShape(CLOSE);

  for (int i=0; i<vertices.length-1; i+=2) {
    fill (255);
    if (i == vertices.length-6) fill (0, 0, 255);
    noStroke ();
    if (keyPressed) ellipse (vertices[i], vertices[i+1], 2, 2);
  }

  popMatrix();
}
