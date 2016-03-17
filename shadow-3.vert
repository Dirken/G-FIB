#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;
out float yMin;
out float zMax;
out float xMax;
out float zMin;
out float xMin;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vfrontColor = vec4(color,1.0);
    xMin = boundingBoxMin.x;
    yMin = boundingBoxMin.y;
    zMin = boundingBoxMin.z;

    xMax = boundingBoxMax.x;
    zMax = boundingBoxMax.z;
    gl_Position = vec4(vertex.xyz, 1.0);
}
