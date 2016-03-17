#version 330 core

in vec4 frontColor;
out vec4 fragColor;

void main()
{
    vec3 dx = dFdx(aux.xyz);
    vec3 dy = dFdy(aux.xyz);
    vec3 norm = normalize(cross(dx,dy));
    fragColor = frontColor*norm.z;
}
