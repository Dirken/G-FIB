#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
uniform sampler2D colorMap;
out vec4 fragColor;
in float d;

void main()
{
    fragColor = frontColor;
}


