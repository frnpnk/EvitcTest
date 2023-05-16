describe("smoke suite", () => {
    //search, functionalities,
    var EmployeeId = 0;

    beforeEach(() => {
        cy.visit("https://opensource-demo.orangehrmlive.com/");
        cy.get('input[name="username"]').type("Admin");
        cy.get('input[name="password"]').type("admin123");
        cy.get('button[type="submit"]').click();
    });

    it("add_employee_test", () => {
        cy.contains('li[class="oxd-main-menu-item-wrapper"]', "PIM").click();
        cy.contains('button[type="button"]', "Add").click();
        cy.get('input[placeholder="First Name"]').type("Ramon");
        cy.get('input[placeholder="Last Name"]').type("Castillo");
        cy.get('button[type="submit"]').click();
        cy.get('h6[class="oxd-text oxd-text--h6 --strong"]', {
            timeout: 25000,
        }).should("include.text", "Ramon Castillo");
        cy.get('input[class="oxd-input oxd-input--active"]').then(($id) => {
            EmployeeId = $id["2"]._value;
        });
    });

    it("search_employee_test", () => {
        cy.contains('li[class="oxd-main-menu-item-wrapper"]', "PIM").click();
        cy.get(".oxd-table-filter").find('input[class="oxd-input oxd-input--active"]').type(EmployeeId)
        cy.get('button[type="submit"]').click({force:true})
        cy.get('div[class="oxd-table-card"]').should("include.text", "Ramon Castillo");

        // cy.get();
    });
});
