macro(ImGUI_AddSources SourcesVarRef)
	list(
		APPEND
		${SourcesVarRef}
		"libs/imgui/imconfig.h"
		"libs/imgui/imgui.h"
		"libs/imgui/imgui.cpp"
		"libs/imgui/imgui_demo.cpp"
		"libs/imgui/imgui_draw.cpp"
		"libs/imgui/imgui_internal.h"
		"libs/imgui/imgui_tables.cpp"
		"libs/imgui/imgui_widgets.cpp"
		"libs/imgui/imstb_rectpack.h"
		"libs/imgui/imstb_textedit.h"
		"libs/imgui/imstb_truetype.h"
		"libs/imgui/backends/imgui_impl_opengl3.h"
		"libs/imgui/backends/imgui_impl_opengl3.cpp"
		"libs/imgui/backends/imgui_impl_opengl3_loader.h"
		"libs/imgui/backends/imgui_impl_glfw.h"
		"libs/imgui/backends/imgui_impl_glfw.cpp"
	)
endmacro()

macro(ImGUI_SetupTarget ProjectName)
	target_compile_definitions(
		${ProjectName}
		PUBLIC IMGUI_API_EXPORTS  # Some versions use this
	)

	target_compile_definitions(
		${ProjectName}
		PUBLIC IMGUI_API=__declspec\(dllexport\)
	)

	target_include_directories(
		${ProjectName}
		PUBLIC libs/imgui
		PUBLIC libs/imgui/backends
	)
endmacro()