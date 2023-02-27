describe('Show home page', function() {
  beforeEach(() => {
    cy.app('clean') // have a look at cypress/app_commands/clean.rb
  })

  it('using single factory bot', function() {
    cy.appFactories([
      ['create', 'user', {email: 'test@email.com'} ]
    ])
    cy.visit('/')
    cy.contains('Home#index')
  })

  it('using multiple factory bot', function() {
    cy.appFactories([
      ['create_list', 'user', 1],
      ['create', 'user', {email: 'email@example.com'} ]
    ])
    cy.visit('/')
    cy.contains('Home#index')
  })
})
