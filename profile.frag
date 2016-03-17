#version 330 core

in vec4 frontColor;
in vec4 eye;
in vec3 norm;
out vec4 fragColor;

uniform float epsilon = 0.1;
uniform float light = 0.5;
void main()
{
    vec4 amarillo = vec4(0.7,0.6,0.0,1.0);
    float escalar = dot(eye,vec4(norm,1.0));
    if(epsilon < escalar && -epsilon < escalar) fragColor = amarillo;
    else fragColor = frontColor*light*norm.z;
}
