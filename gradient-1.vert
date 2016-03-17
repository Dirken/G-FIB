#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float maxY;
uniform float minY;

void main()
{
	
	if (minY == vertex.y) frontColor = (1,0,0,1);
	y = max(Y)	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}



/*
Escriu un vertex shader que apliqui un gradient de color al model segons la seva coordenada Y en object
space. Feu servir els uniforms amb la capsa englobant de l’escena per obtenir els valors extrems de la
coordenada Y del model, minY, maxY.
El gradient de color estarà format per la interpolació d’aquests cinc colors: red, yellow, green, cian, blue.
L’assignació s’haurà de fer de forma que els vèrtexs amb y=minY es pintin de vermell, i els vèrtexs amb
y=maxY es pintin de blau.
Per la interpolació lineal entre colors consecutius del gradient, feu servir la funció mix. 
Una altra funció
que us pot ser útil és fract, la qual retorna la part fraccionaria de l’argument.


*/
