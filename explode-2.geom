#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 vnormal[];

uniform mat4 modelViewProjectionMatrix;
uniform float time;

const float speed = 0.5;
const float angSpeed = 0.8;

void main( void )
{
	vec3 n = (vnormal[0] + vnormal[1] + vnormal[2])/3.0;
	vec3 alpha1 = speed*time*n;
	float alpha2 = angSpeed*time;
	mat3 Rz = mat3(vec3(cos(alpha2), sin(alpha2), 0), vec3(-sin(alpha2), cos(alpha2), 0), vec3(0, 0, 1));
	for( int i = 0 ; i < 3 ; i++ )
  {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * vec4((vec3(Rz*(gl_in[i].gl_Position.xyz/3 + alpha1))), 1.0);
		EmitVertex();
	}
    EndPrimitive();
}
