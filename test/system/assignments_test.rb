require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @assignment = assignments(:one)
  end

  test "visiting the index" do
    visit assignments_url
    assert_selector "h1", text: "Assignments"
  end

  test "should create assignment" do
    visit assignments_url
    click_on "New assignment"

    fill_in "Assignment 1", with: @assignment.assignment_1
    fill_in "Assignment 2", with: @assignment.assignment_2
    fill_in "Assignment 3", with: @assignment.assignment_3
    fill_in "Course", with: @assignment.course_id
    fill_in "Created at", with: @assignment.created_at
    fill_in "Description", with: @assignment.description
    fill_in "Due date", with: @assignment.due_date
    fill_in "Exam", with: @assignment.exam
    fill_in "Test", with: @assignment.test
    fill_in "Title", with: @assignment.title
    click_on "Create Assignment"

    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "should update Assignment" do
    visit assignment_url(@assignment)
    click_on "Edit this assignment", match: :first

    fill_in "Assignment 1", with: @assignment.assignment_1
    fill_in "Assignment 2", with: @assignment.assignment_2
    fill_in "Assignment 3", with: @assignment.assignment_3
    fill_in "Course", with: @assignment.course_id
    fill_in "Created at", with: @assignment.created_at
    fill_in "Description", with: @assignment.description
    fill_in "Due date", with: @assignment.due_date.to_s
    fill_in "Exam", with: @assignment.exam
    fill_in "Test", with: @assignment.test
    fill_in "Title", with: @assignment.title
    click_on "Update Assignment"

    assert_text "Assignment was successfully updated"
    click_on "Back"
  end

  test "should destroy Assignment" do
    visit assignment_url(@assignment)
    click_on "Destroy this assignment", match: :first

    assert_text "Assignment was successfully destroyed"
  end
end
