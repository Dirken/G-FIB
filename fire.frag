#version 330 core
 
in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
 
 
uniform float slice=0.1;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;
uniform float time;
 
void main()
{
//x - y * floor(x/y)
  float atime = mod(time,0.4);
  if(0 <= atime && atime < slice)  fragColor = frontColor * texture(sampler0, vtexCoord);
  if (slice <= atime && atime < 2*slice) fragColor = frontColor * texture(sampler1, vtexCoord);
  if (2*slice <= atime && atime < 3*slice) fragColor = frontColor * texture(sampler2, vtexCoord);
  if (3*slice <= atime && atime < 4*slice) fragColor = frontColor * texture(sampler3, vtexCoord);
}
