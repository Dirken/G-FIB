#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec4 aux;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix; 
uniform float time;
mat3 MatrixRotation;
uniform float speed = 0.1;
void main()
{
    float angle = time*speed;
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
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
     aux = modelViewMatrix*vec4(vertex.xyz,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz*MatrixRotation, 1.0);
}


