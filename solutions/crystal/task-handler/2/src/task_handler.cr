class TaskHandler
  def initialize(@tasks : Array(String))
    @task_condition_logic = ->(x : Int32) : Bool { x >= 0 }
  end

  def update_task_condition_logic(&@task_condition_logic : Int32 -> Bool); end

  def execute(priority : Int32)
    @task_condition_logic.call(priority) ? "Completed #{@tasks.shift}" : "Could not complete #{@tasks[0]}"
  end
end
