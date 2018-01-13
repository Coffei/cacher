defmodule CacherWeb.Utils.Html do
  def form_group_error(form, field) do
    cond do
      form.errors[field] -> "has-error"
      true -> ""
    end
  end
end
