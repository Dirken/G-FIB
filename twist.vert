#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
mat3 MatrixRotation;
uniform float time;

void main()
{
	float angle = 0.4*vertex.y*(sin(time));
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
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz*MatrixRotation, 1.0);
}


/*
 * Escriu un vertex shader que apliqui a cada vèrtex una transformació de modelat consistent en una
rotació de θy radians respecte l'eix Y del model.
L'angle de rotació θy l'heu de calcular com
θy = 0.4 y sin(t),
on y és la coordenada y del vèrtex en object space, i t és el temps en segons. Recordeu que la rotació d’un
punt respecte l’eix Y es pot calcular multiplicant aquesta matriu pel punt:
El VS també haurà de fer les tasques habituals (pas a clip space i propagació del color que li arriba, sense
il·luminació).

 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * */
