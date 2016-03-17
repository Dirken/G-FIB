#version 330 core

in vec4 frontColor;
in float normalZ;
out vec4 fragColor;

void main()
{
    fragColor = frontColor*normalZ;
}
