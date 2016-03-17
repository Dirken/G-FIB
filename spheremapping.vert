#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec4 posC;
out vec4 posW;
out vec4 normalC;
out vec4 normalW;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelMatrix;
uniform mat3 normalMatrix;

void main()
{
	vec3 N = normalize(normalMatrix * normal);
	vec3 N2 = normalize(modelMatrix * vec4(normal.xyz,1.0)).xyz;
    normalC = frontColor = vec4(normalize(normalMatrix*normal).z);
    normalW = vec4(N2.z,N2.z,N2.z,1.0);
    vtexCoord = texCoord;
    posW = modelMatrix*vec4(vertex.xyz, 1.0);
    posC = gl_Position = modelViewProjectionMatrix*vec4(vertex.xyz, 1.0);
}
/*
Escriviu un vertex shader i un fragment shader que simulin que l’objecte és un mirall especular usant la
tècnica de sphere mapping.
Feu que el càlcul de les coordenades de textura es faci al fragment shader, a partir de la posició i la
normal interpolades al fragment.
Els shaders rebran una variable uniform bool worldSpace que indicarà si els càlculs s'han de fer amb la
posició i la normal en world space (suposem que no hi ha transformació de modelat) o en eye space.
Aquí teniu un exemple dels resultats esperats amb l’esfera (vista frontalment i des de sota) amb la textura
spheremap.png (càlculs en eye space):

uniform mat4 modelMatrix;     Pasa punto o vector de object space a world space
uniform mat4 viewMatrix;        Pasa punto o vector de world space a eye space
uniform mat4 projectionMatrix; Pasa punto o vector de eye space a clip space
uniform mat4 modelViewMatrix; Pasa punto o vector de object space a eye space
uniform mat4 modelViewProjectionMatrix; Pasa punto o vector de object space a clip space
Las inversas obviamente hacen el paso inverso.
uniform mat3 normalMatrix; Pasa la normal de object space a eye space
*/

