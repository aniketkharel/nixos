local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- js clg
local clg = function()
	return { "console.log()" }
end

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "clg",
			namr = "debug console",
			dscr = "javascript debug log",
		}, { func(clg, {}) }),
		snip("easync", {
			text("export const "),
			insert(1, "Name"),
			text("= async ("),
			insert(2),
			text(") : Promise<any> => "),
			insert(3),
			text({ " {", "" }),
			text("\t"),
			insert(0),
			text({ "", "}" }),
		}),
	},
})
