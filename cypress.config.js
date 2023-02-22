const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: "bnoec6",
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
