#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 norm[];
out vec4 gfrontColor;
uniform float time;
uniform mat4 modelViewProjectionMatrix;
void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		if ( gl_PrimitiveIDIn <= floor(100*time)) { //gfrontColor = vfrontColor[i]*norm[i].z; Así queda tope guay xD
			gfrontColor = vfrontColor[i]; //por la descripción dada tendría que ser esto, no? :S
			gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
			EmitVertex();
		}
	}
    EndPrimitive();
}
