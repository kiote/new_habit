defmodule NewHabitWeb.HabitController do
  use NewHabitWeb, :controller

  def update(conn, %{"habit-nr" => habit_nr, "customer" => customer}) do
    NewHabit.ensure_customer(customer)
    NewHabit.save_progress(habit_nr)
    text(conn, habit_nr)
  end
end
