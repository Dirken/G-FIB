#version 330 core
 
layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;
 
out vec3 fN;
out vec3 fV;
out vec3 fL;
 
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;
 
void main()
{
        vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;
        fN = (normalMatrix * normal);
        fV = -P;
        fL = (lightPosition.xyz - P);
        gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
