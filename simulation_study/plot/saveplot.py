with Plot.from_paths(["PATH_1", "PATH_2"]) as plot:
	inc_plot = plot.new("inclusion")
	inc_plot.set_grid()
	inc_plot.set_xlim(0, 30)
	inc_plot.set_ylim(0, 101)
	inc_plot.set_legend()
	inc_plot.save("SOME_FILE.png")
