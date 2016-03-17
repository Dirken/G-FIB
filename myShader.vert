#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
const float PI = 3.14159;

uniform float time; //temps en segons
//A*sin(2*pi*freq*t + angle) 
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float A = 1;
uniform float f = 1;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float c = abs(sin(time));
    frontColor = vec4(c,c,c,1.0) * N.z;
    vtexCoord = texCoord;
    vec3 P = vertex;
    P.y *= A*sin(2*PI*time);
    gl_Position = modelViewProjectionMatrix * vec4(P, 1.0);
}
