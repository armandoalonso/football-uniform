
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

	var helmetColor : vec3<f32> = vec3<f32>(0.0, 0.0, 1.0);
	var helmetDiff : f32 = length(rgb - helmetColor);
	if (helmetDiff <= shaderParams.tolerance)
	{
		rgb = shaderParams.helmet;
	}

	// else if(length(rgb - vec3<f32>(0.0, 0.0, 0.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.helmet2;
	// }
	// else if(length(rgb - vec3<f32>(0.5, 0.5, 0.5)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.helmet3;
	// }
	// else if(length(rgb - vec3<f32>(1.0, 0.0, 0.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.jersey;
	// }
	// else if(length(rgb - vec3<f32>(1.0, 0.0, 1.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.jersey2;
	// }
	// else if(length(rgb - vec3<f32>(0.0, 1.0, 0.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.pants;
	// }
	// else if(length(rgb - vec3<f32>(0.0, 1.0, 1.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.shoes;
	// }
	// else if(length(rgb - vec3<f32>(1.0, 1.0, 0.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.facemask;
	// }
	// else if(length(rgb - vec3<f32>(1.0, 1.0, 1.0)) <= shaderParams.tolerance)
	// {
	// 	rgb = shaderParams.skin;
	// }

	var output : FragmentOutput;
	output.color = mix(front, rgb * front.a, shaderParams.intensity);
	return output;
}