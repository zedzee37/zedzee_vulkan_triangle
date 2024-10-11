CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	./VulkanTest

clean:
	rm -f VulkanTest

shader:
	glslc -fshader-stage=vertex shaders/vert.glsl -o shaders/vert.spv
	glslc -fshader-stage=fragment shaders/frag.glsl -o shaders/frag.spv
