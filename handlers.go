package main

import (
	"fmt"
	"os"
	"time"

	"github.com/charmbracelet/log"
	"github.com/gofiber/fiber/v2"
)

func TestHandler(c *fiber.Ctx) error {
	var version string
	err := DB.QueryRow("select version()").Scan(&version)
	if err != nil {
		log.Fatal(fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err))
	}
	return c.JSON(fiber.Map{
		"message":         "Hello from server",
		"time":            time.Now(),
		"message_from_db": version,
	})
}
