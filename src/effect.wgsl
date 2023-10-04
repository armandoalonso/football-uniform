
%%SAMPLERFRONT_BINDING%%  var samplerFront : sampler;
%%TEXTUREFRONT_BINDING%%  var textureFront : texture_2d<f32>;

//<-- shaderParams -->

// %%C3PARAMS_STRUCT%%
%%C3_UTILITY_FUNCTIONS%%
%%FRAGMENTINPUT_STRUCT%%
%%FRAGMENTOUTPUT_STRUCT%%

@fragment
fn main(input : FragmentInput) -> FragmentOutput
{
	var front : vec4<f32> = c3_unpremultiply(textureSample(textureFront, samplerFront, input.fragUV));
	var rgb : vec3<f32> = front.rgb;

	if (length(rgb - vec3<f32>(0.0, 0.0, 1.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.helmet;
	}
	else if(length(rgb - vec3<f32>(1.0, 0.5, 0.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.helmet2;
	}
	else if(length(rgb - vec3<f32>(0.5, 0.5, 0.5)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.helmet3;
	}
	else if(length(rgb - vec3<f32>(1.0, 0.0, 0.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.jersey;
	}
	else if(length(rgb - vec3<f32>(1.0, 0.0, 1.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.jersey2;
	}
	else if(length(rgb - vec3<f32>(0.0, 1.0, 0.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.pants;
	}
	else if(length(rgb - vec3<f32>(0.0, 1.0, 1.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.shoes;
	}
	else if(length(rgb - vec3<f32>(1.0, 1.0, 0.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.facemask;
	}
	else if(length(rgb - vec3<f32>(1.0, 1.0, 1.0)) <= shaderParams.tolerance)
	{
		rgb = shaderParams.skin;
	}

	var output : FragmentOutput;
	var newColor : vec4<f32> = vec4<f32>(rgb.r, rgb.g, rgb.b, front.a);
	output.color = mix(front, newColor, shaderParams.intensity);
	return output;
}