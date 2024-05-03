# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @new_values = {
      name: Faker::Lorem.words(number: rand(1..2)).join(' '),
      description: Faker::Lorem.paragraphs(number: rand(2..3)).join("\n\n"),
      status: %i[in_progress cancelled test done].sample,
      creator: Faker::Name.unique.name,
      performer: Faker::Name.unique.name,
      completed: Faker::Boolean.boolean
    }
  end

  test 'should open tasks' do
    get tasks_path

    assert_response :success
  end

  test 'should open task' do
    get task_path(@task)

    assert_response :success
  end

  test 'should open task new' do
    get new_task_path

    assert_response :success
  end

  test 'should open task edit' do
    get edit_task_path(@task)

    assert_response :success
  end

  test 'should create task' do
    post tasks_path(method: 'create'), params: { task: @new_values }
    task = Task.find_by!(name: @new_values[:name])
    assert_redirected_to task_path(task)
  end

  test 'should update task' do
    put task_path(@task, method: 'update'), params: { task: @new_values }
    assert_redirected_to task_path(@task)
    @task.reload
    assert_equal(@new_values[:name], @task.name)
  end

  test 'should destroy task' do
    delete task_path(@task, method: 'destroy')
    assert_redirected_to tasks_path
    Task.exists? @task.id
  end
end
