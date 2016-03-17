#version 330 core

in vec2 vtexCoord;
in vec4 frontColor;
uniform sampler2D colorMap;
out vec4 fragColor;

void main()
{
    fragColor = texture(colorMap, vtexCoord);
}


