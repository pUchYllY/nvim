local ls=require("luasnip")

local s=ls.snippets
local t=ls.text_node
local i=ls.insert_node

 return {
	-- Flowchart base 
	s("mflow",{
		t({
			"flowchart TD",
			" "
		}),
		i(1, "A-->B"),
	}),

	-- Sequence diagram 
	s("mseq",{
		t({
			"sequenceDiagram",
			" "
		}),
		i(1, "Alice->>Bob: Hello Bob"),
	}),

	-- Class diagram 
	s("mclass",{
		t({
			"classDiagram",
			" "
		}),
		i(1, "Class01 <|-- Class02"),
	}),

	-- State diagram 
	s("mstate",{
		t({
			"stateDiagram-v2",
			" "
		}),
		i(1, "state1 --> state2"),
	}),
	-- Gantt chart 
	s("mgantt", {
		t({
			"gantt",
			" dateFormat YYYY-MM-DD",
			" title "
		}),
		i(1, "Project Timeline"),
		t({""," section Section"," "}),
		i(2, "Task :done, des1, 2024-01-01, 2024-01-05"), 
	}),
}
