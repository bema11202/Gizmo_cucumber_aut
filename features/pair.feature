
Feature: Gizmo pairing
  As a support engineer, I should be able to pair the gizmo with a primary caregiver and verify that all required fields
  are filled out.

  Background: Application must be installed and launched

    Given I have installed and launch the GizmoHub app
    When I click on "GETSTARTED" button
    Then I should see "CONTINUE" button
    When I click "CONTINUE" button
    Then I should see the "PERMISSION" buttons
    When I click "PERMISSION" buttons three times
    Then I should see the "NEXT" button on Prepare your Gizmo page
    When I click "NEXT" button on Prepare your Gizmo page



  Scenario: Add a gizmo to a primary caregiver device (iOS/Android)

    Then I should see a "GIZMO NUMBER" input|text field
    When I Enter a valid "GIZMO NUMBER" and press "NEXT"
    Then I should be redirected to the "Personalize Your Gizmo" page
    When I enter child’s name and select what the child calls you from the dropdown menu and press "NEXT" button
    Then I should see "SKIP" button
    Then I should see "SKIP CREATING PIN POPUP" popup
    Then I should see "SECURITY CODE"field
    When I enter the "44173" digits security code and click "NEXT
    Then I should see text containing "Linking to Your Gizmo"
    Then I should see allow contacts popup
    Then I may see the app upgrade if there is a new version
    Then I should be on the dashboard

  Scenario: Attempt to pair a gizmo with an expired or a bad security code
    Then I should see a "GIZMO NUMBER" input|text field
    When I Enter a valid "GIZMO NUMBER" and press "NEXT"
    Then I should be redirected to the "Personalize Your Gizmo" page
    When I enter child’s name and select what the child calls you from the dropdown menu and press "NEXT" button
    Then I should see "SKIP" button
    Then I should see "SKIP CREATING PIN POPUP" popup
    Then I should see "SECURITY CODE"field
    When I enter expired security code "44173" and click "NEXT
    Then I should see text "Linking to Your Gizmo"
    Then Then I should see text containing "Unable to Link to Your Gizmo" if the linking fail

  Scenario: Attempt to create a primary caregiver with an invalid gizmo number

    Then I should see the "GIZMO NUMBER" input|text field
    When I Enter an invalid "GIZMO NUMBER" and press "NEXT"
    Then I should see the following error message "The gizmo's mobile number must be 10 digits long"


  Scenario: Attempt to add a child without a child's name

    Then I should see my gizmo "GIZMO NUMBER" input|text field
    When I Enter my gizmo number "GIZMO NUMBER" and press "NEXT"
    And I select what the child calls you and press next button to continue
    And I leave the childs name empty
    And I select the color and click next to continue
    Then I should see missing name error "The name must have at least one character" message


  Scenario: Attempt to add a gizmo without selecting relationship (what the child calls you)
    Then I should see my gizmo "GIZMO NUMBER" input|text field
    When I Enter my gizmo number "GIZMO NUMBER" and press "NEXT"
    Then I should be on the relationship page
    Then I should see this message "Select what the child calls you" if I don't select the relationship


  Scenario: Attempt to add a gizmo without selecting the gizmo color