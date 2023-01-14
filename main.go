package main

import (
	_ "embed"
	"github.com/diamondburned/gotk4/pkg/gio/v2"
	"github.com/diamondburned/gotk4/pkg/gtk/v4"
	"os"
	"os/exec"
)

//go:embed script/discord.sh
var discordScript string

//go:embed script/ptb.sh
var ptbScript string

//go:embed script/canary.sh
var canaryScript string

func main() {

	app := gtk.NewApplication("com.github.corentings.discord-updater", gio.ApplicationFlagsNone)
	app.Connect("activate", activate)

	if code := app.Run(os.Args); code > 0 {
		os.Exit(code)
	}
}

func activate(app *gtk.Application) {
	win := gtk.NewApplicationWindow(app)
	win.SetTitle("Discord Updater")
	win.SetDefaultSize(800, 600)

	// Create a new label
	label := gtk.NewLabel("Hello, World!")

	// Add the label to the window
	win.SetChild(label)

	// Divide the window into three sections (top, middle, bottom)
	grid := gtk.NewGrid()
	grid.SetOrientation(gtk.OrientationVertical)
	grid.SetRowHomogeneous(true)
	grid.SetColumnHomogeneous(true)

	// Add a button to the top section
	button := gtk.NewButtonWithLabel("Install discord")
	grid.Attach(button, 0, 0, 1, 1)

	button.Connect("clicked", func() {
		buttonClicked(app, discord)
	})

	// Add a button to the middle section
	button2 := gtk.NewButtonWithLabel("Install PTB discord")
	grid.Attach(button2, 0, 1, 1, 1)

	button2.Connect("clicked", func() {
		buttonClicked(app, ptb)
	})

	// Add a button to the bottom section
	button3 := gtk.NewButtonWithLabel("Install Canary discord")
	grid.Attach(button3, 0, 2, 1, 1)

	// When the button3 is clicked, run the canary function in a new thread
	button3.Connect("clicked", func() {
		buttonClicked(app, canary)
	})

	// Add the grid to the window
	win.SetChild(grid)

	// Show the window and all of its components
	win.Show()
}

func buttonClicked(app *gtk.Application, fn func() error) {
	// Create a popup window to display the output of the canary function
	win2 := gtk.NewApplicationWindow(app)
	win2.SetTitle("Discord Updater")
	win2.SetDefaultSize(800, 600)

	// Create a new label
	label2 := gtk.NewLabel("Installing discord... Please wait")

	// Add the label to the window
	win2.SetChild(label2)

	// Show the window and all of its components
	win2.Show()

	go func() {
		defer win2.Close()
		err := fn()
		if err != nil {
			panic(err)
		}
	}()
}

func canary() error {
	// Run the canary script and display the output in a new window
	cmd := exec.Command("bash", "-c", canaryScript)

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		return err
	}

	return nil
}

func ptb() error {
	// Run the ptb script and display the output in a new window
	cmd := exec.Command("bash", "-c", ptbScript)

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		return err
	}

	return nil
}

func discord() error {
	cmd := exec.Command("bash", "-c", discordScript)

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		return err
	}

	return nil
}
