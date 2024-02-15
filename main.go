package main

import (
	"fmt"
	"os"
	"time"

	"github.com/dotenv-org/godotenvvault"
	"github.com/gofiber/fiber/v2"
)

func main() {
	err := godotenvvault.Load()
	app := fiber.New()

	ConnectDB()
	defer DB.Close()

	if os.Getenv("GO_ENV") == "dev" {
		app.Get("/test", func(c *fiber.Ctx) error {
			var version string
			err = DB.QueryRow("select version()").Scan(&version)
			if err != nil {
				fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
				os.Exit(1)
			}

			return c.JSON(fiber.Map{
				"message":         "Hello from server",
				"time":            time.Now(),
				"message_from_db": version,
			})
		})
	}


	app.Listen(":" + os.Getenv("PORT"))
}
