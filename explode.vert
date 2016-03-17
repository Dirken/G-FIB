#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

out vec3 vVertex;
out vec3 vNormal;

void main()
{
    vVertex = vertex;
    vNormal = normal;
    //vec3 N = normalize(normalMatrix * normal);
    //vfrontColor = vec4(color,1.0) * N.z;
    vfrontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
/*#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;
out vec3 vnormal;
out vec3 pos;
uniform mat3 modelViewMatrix;

void main()
{
		vnormal = normal;
    pos = vertex;
    vfrontColor = vec4(color,1.0);
    gl_Position = vec4(vertex.xyz, 1.0);
}*/
