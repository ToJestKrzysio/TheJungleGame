import math
import os

import matplotlib.pyplot as plt
import pandas as pd


def get_history(source: str) -> pd.DataFrame:
    history_dfs = [
        pd.read_json(os.path.join(source, filename)) for filename in sorted(os.listdir(source))
    ]
    history = pd.concat(history_dfs, ignore_index=True).reset_index()
    return history


def generate_plot(
        history: pd.DataFrame,
        output_path: str,
        **kwargs
) -> None:
    plt.figure(figsize=(10, 5))
    for column in history.columns:
        plt.plot(history[column])

    for attr, value in kwargs.items():
        getattr(plt, attr)(value)

    plt.xlim(0, math.ceil(len(history.index) / 10) * 10)
    plt.legend(labels=history.columns, loc="upper right")
    plt.grid()
    plt.savefig(output_path)


def generate_all_plots(source: str, destination: str) -> None:
    history = get_history(source)
    history.rename(columns={
        "val_loss": "validation loss",
        "Value_Head_loss": "value head loss",
        "val_Value_Head_loss": "validation value head loss",
        "Policy_Head_loss": "policy head loss",
        "val_Policy_Head_loss": "validation policy head loss",
    }, inplace=True)
    os.makedirs(destination, exist_ok=True)

    generate_plot(
        history[["loss", "validation loss"]],
        os.path.join(destination, "loss.png"),
        xlabel="Training iteration [-]",
        ylabel="Loss [-]"
    )

    generate_plot(
        history[["value head loss", "validation value head loss"]],
        os.path.join(destination, "value_loss.png"),
        xlabel="Training iteration [-]",
        ylabel="Loss [-]"
    )

    generate_plot(
        history[["policy head loss", "validation policy head loss"]],
        os.path.join(destination, "policy_loss.png"),
        xlabel="Training iteration [-]",
        ylabel="Loss [-]"
    )


if __name__ == "__main__":
    model_name = str(input()).lower()
    source = f"../data/history/{model_name}"
    destination = f"../data/plots/{model_name}"
    generate_all_plots(source, destination)
