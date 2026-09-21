defmodule Playa do
  @moduledoc """
  Documentation for `Playa`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Playa.hello()
      :world

  """
  def hello do
    Nx.default_backend({EMLX.Backend, device: :gpu})

    {:ok, model} = Laya.load()

    Laya.predict(model, "Please refund the duplicate invoice.", %{
      "department" => %{
        type: :choice,
        instructions: "Which team should handle this request?",
        criteria: [
          {"billing", "invoices, payments, and refunds"},
          {"technical", "bugs and outages"},
          {"other", "everything else"}
        ]
      },
      "refund_requested" => %{
        type: :noul,
        instructions: "Does the customer explicitly request a refund?"
      }
    })
  end
end
