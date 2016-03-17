#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrixInverse;
uniform vec4 lightPosition;
uniform mat3 normalMatrix;
uniform float n = 4;


void main()
{
	vec4 F = modelViewMatrixInverse*vec4(lightPosition.xyz,1.0);
	float d = distance(vertex.xyz, F.xyz);
	float w = clamp(1/pow(d,n), 0, 1);
	vec3 V2 = (1.0-w)*vertex.xyz + w*F.xyz;
	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z,N.z,N.z,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(V2.xyz, 1.0);
}

