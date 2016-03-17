 #version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
const float PI = 3.14159;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time; //temps en segons
out float d;
uniform float freq = 1;
uniform float amplitude = 0.1;


void main()
{
	vec3 P = vertex.xyz;
	vec3 N = normalize(normalMatrix * normal);
	d = amplitude*sin(2*freq*PI*abs(time));
	P = P +normal*d;
    frontColor = vec4(normalize(normalMatrix*normal).z);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(P.xyz, 1.0);
}

