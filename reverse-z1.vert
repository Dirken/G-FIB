#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec4 posicio;


uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    posicio = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
    posicio.z = -posicio.z;
    gl_Position = posicio; 
}

/*
La funció d’OpenGL glDepthFunc permet triar el tipus de depth test a aplicar per OpenGL. Per defecte, el
test és GL_LESS, és a dir, un fragment passa el test si la seva Z (en window space) és més petita que la Z
emmagatzemada al depth buffer.
Escriu un vertex shader que modifiqui la Z dels vèrtexs per tal d’aconseguir el mateix efecte que tindria
cridar glDepthFunc amb GL_GREATER des de l’aplicació. El resultat és que s’invertirà la visibilitat de
les cares, sent visibles les cares més llunyanes a l’observador.

*/
