#version 120

uniform mat4 MVP;
attribute vec4 Position;
attribute vec3 Normal;

varying vec3 normal; 
varying float angle;    
varying vec3 vector, cameraPosition;
varying vec3 firstColor, fresnel, secondColor;
varying float cosinusRes;

void main()
{	
  
   gl_Position = MVP * Position;
   normal = mat3(gl_ModelViewMatrix)*Normal;
   firstColor= vec3( 0.1, 0.0, 0.0 );
   secondColor= vec3( 0.0, 0.0, 0.1 ); 

   vector = vec3( 0.0, 0.0, -1.0 );
   cameraPosition = mat3(gl_ModelViewMatrix) * Normal ;

   angle = dot( normalize(cameraPosition), vector);
   cosinusRes = cos(angle);
   fresnel = vec3(mix(firstColor, secondColor, cosinusRes));
}

