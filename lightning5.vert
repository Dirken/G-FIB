#version 330 core
 
layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;
 
out vec3 fN;
out vec3 fV;
out vec3 fL;
 
uniform bool world;
uniform mat4 modelViewProjectionMatrix, modelViewMatrix, modelViewMatrixInverse, modelMatrix, viewMatrixInverse;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;
 
void main()
{
		if (!world){ //eye space
		    vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;
		    fN = (normalMatrix * normal);
		    fV = -P;
		    fL = (lightPosition.xyz - P);
		}
		else { //object space
			vec3 P = vec4(vertex.xyz, 1.0).xyz;
		    fN =  normal;
		    fV = (modelViewMatrixInverse*vec4(0.0,0.0,0.0,1.0)).xyz - P;
		    fL = (modelViewMatrixInverse*lightPosition).xyz - P;   
		}
		gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0); //siempre en eye space
}
