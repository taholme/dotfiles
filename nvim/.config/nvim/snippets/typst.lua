---@diagnostic disable: undefined-global

return {
	s({ trig = "cent" },
		fmta("#align(center)[<>]", { i(1) })
	),
	-- math modes
	s({ trig = "mt", snippetType = "autosnippet" },
		fmta("$<>$ ", { i(1) })
	),
	s({ trig = "(%d+)", regTrig = true },
		fmta([[
	#for i in range(<>) {
		<>
	}]], {
			f(function(_, s) return s.captures[1] end),
			i(1)
		})
	),
	s({ trig = "([^%s]+)t", regTrig = true },
		fmta("(<>)^(<>) ", {
			f(function(_, s) return s.captures[1] end),
			i(1)
		})
	),
	s({ trig = "mmt", snippetType = "autosnippet" },
		fmta("$ <> $ ", { i(1) })
	),
	s({ trig = "mla" },
		fmta([[
	#set page(header: context align(right)[Holme #counter(page).get().first()])

	Theodor Holme

	#datetime.today().display("[day] [month repr:long] [year]")

	<>
	]], { i(1) })
	),
	}
