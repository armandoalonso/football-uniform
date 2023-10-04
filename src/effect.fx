
// Sample WebGL 1 shader. This just outputs a red color
// to indicate WebGL 1 is in use.

#ifdef GL_FRAGMENT_PRECISION_HIGH
#define highmedp highp
#else
#define highmedp mediump
#endif

// precision lowp float;

varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;

//<-- UNIFORMS -->

void main(void)
{
	lowp vec4 front = texture2D(samplerFront, vTex);
	lowp vec4 newColor;

	if (length(front.rgb - vec3(0,0,1)) <= tolerance)
	{
		newColor.rgb = helmet;
	} 
	else if (length(front.rgb - vec3(0,0,0)) <= tolerance)
	{
		newColor.rgb = helmet2;
	}
	else if (length(front.rgb - vec3(0.5,0.5,0.5)) <= tolerance)
	{
		newColor.rgb = helmet3;
	}
	else if (length(front.rgb - vec3(1,0,0)) <= tolerance)
	{
		newColor.rgb = jersey;
	}
	else if (length(front.rgb - vec3(1,0,1)) <= tolerance)
	{
		newColor.rgb = jersey2;
	}
	else if (length(front.rgb - vec3(0,1,0) <= tolerance)
	{
		newColor.rgb = pants;
	}
	else if (length(front.rgb - vec3(0,1,1)) <= tolerance)
	{
		newColor.rgb = shoes;
	}
	else if (length(front.rgb - vec3(1,1,0)) <= tolerance)
	{
		newColor.rgb = facemask;
	}
	else if (length(front.rgb - vec3(1,1,1)) <= tolerance)
	{
		newColor.rgb = skin;
	}
	newColor.a = front.a;

	gl_FragColor = mix(front, newColor, intensity);
}
