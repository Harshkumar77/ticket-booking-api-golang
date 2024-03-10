package main

import (
	"os"
	"time"

	"github.com/charmbracelet/log"
	"github.com/dotenv-org/godotenvvault"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cache"
	"github.com/gofiber/fiber/v2/utils"
	"golang.org/x/crypto/bcrypt"
)

func main() {
	err := godotenvvault.Load()
	if err != nil {
		log.Fatal(err)
	}
	app := fiber.New()
	api := app.Group("/api")

	ConnectDB()
	defer DB.Close()

	// Cached requests
	Cache := cache.New(cache.Config{
		Expiration: time.Hour,
		KeyGenerator: func(c *fiber.Ctx) string {
			return utils.CopyString(c.Path())
		},
		Methods: []string{fiber.MethodGet},
	})
	api.Use([]string{
		"/test",
	}, Cache)

	api.Get("/test", TestHandler)

	app.Listen(":" + os.Getenv("PORT"))

}

// Hash password

func hashPassword(password string) (string, error) {

	// Convert password string to byte slice

	var passwordBytes = []byte(password)

	// Hash password with Bcrypt's min cost

	hashedPasswordBytes, err := bcrypt.
		GenerateFromPassword(passwordBytes, bcrypt.MinCost)

	return string(hashedPasswordBytes), err

}

// Check if two passwords match using Bcrypt's CompareHashAndPassword

// which return nil on success and an error on failure.

func doPasswordsMatch(hashedPassword, currPassword string) bool {

	err := bcrypt.CompareHashAndPassword(
		[]byte(hashedPassword), []byte(currPassword))

	return err == nil

}
