defmodule NameBadge do
  def print(id, name, department) do
    id = if not is_nil(id), do: "[#{id}] - ", else: ""
    department = if is_nil(department), do: "owner", else: department
    id <> "#{name} - " <> "#{String.upcase(department)}"
  end
end
