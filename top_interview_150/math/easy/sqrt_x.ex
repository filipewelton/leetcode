defmodule SqrtX do
  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x) do
    recursive(x, 1)
  end

  def recursive(x, y) do
    if y * y > x do
      trunc(y - 1)
    else
      yy = y + 1
      recursive(x, yy)
    end
  end
end
