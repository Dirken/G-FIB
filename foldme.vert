#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
mat3 MatrixRotation;
void main()
{
	float angle = -mod(time,60)*texCoord.s;
	MatrixRotation[0][0] = cos(angle);
	MatrixRotation[0][1] = 0;
	MatrixRotation[0][2] = sin(angle);
		
	MatrixRotation[1][0] = 0;
	MatrixRotation[1][1] = 1;
	MatrixRotation[1][2] = 0;
		
	MatrixRotation[2][0] = -sin(angle);
	MatrixRotation[2][1] = 0;
	MatrixRotation[2][2] = cos(angle);
    vec3 N = normalize(normalMatrix * normal);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz*MatrixRotation, 1.0);
}
