describe("smoke suite", () => {
    //search, functionalities,
    var name = "";

    it("title_render_check", () => {
        cy.visit("https://opensource-demo.orangehrmlive.com/");
        cy.title().should("eq", "OrangeHRM");
    });
    it("login_test", () => {
        cy.visit("https://opensource-demo.orangehrmlive.com/");
        cy.get('input[name="username"]').type("Admin");
        cy.get('input[name="password"]').type("admin123");
        cy.get('button[type="submit"]').click();
        cy.get('p[class="oxd-userdropdown-name"]').then(($x) => {
            name = $x.text();
            cy.contains(name).should("exist");
        });
    });
    it("logout_test", () => {
        cy.visit("https://opensource-demo.orangehrmlive.com/");
        cy.get('input[name="username"]').type("Admin");
        cy.get('input[name="password"]').type("admin123");
        cy.get('button[type="submit"]').click();
        cy.contains(name).should("exist");
        cy.contains(name).click();
        cy.contains("Logout").should("exist");
        cy.contains("Logout").click();
        cy.wait(2000);
        cy.title().should("eq", "OrangeHRM");
    });
});
