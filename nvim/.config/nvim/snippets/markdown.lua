---@diagnostic disable: undefined-global

return {
	s({ trig = "([^%s]+)c", regTrig = true },
		fmta([[```<>
<>
```]], {
			f(function(_, s) return s.captures[1] end),
			i(1)
		})
	),

}
