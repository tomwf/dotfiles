import os
import sys
import threading
import time
from datetime import datetime

import requests
from pyautogui import FailSafeException, move


def main() -> None:
    start_time = time.time()
    duration = get_duration()
    try:
        print("Press Ctrl+C to stop")
        thread = threading.Thread(target=ping, daemon=True)
        thread.start()
        while True:
            if duration and has_time_elapsed(start_time, duration):
                print(f"Stopped at {get_time()}")
                break
            move_mouse()
    except KeyboardInterrupt:
        print("Stopped")
    except FailSafeException:
        print("Fail-safe triggered. Stopping script.")


def move_mouse() -> None:
    move(50, 0)
    move(0, 50)
    move(-50, 0)
    move(0, -50)


def has_time_elapsed(start_time: float, duration: int) -> bool:
    return time.time() - start_time > duration


def get_duration() -> int:
    if len(sys.argv) < 2:
        return 0
    duration = int(sys.argv[1])
    if not isinstance(duration, int):
        raise ValueError
    print(f"Running for {duration} minutes")
    return duration * 60


def alert() -> None:
    os.system('say "No wifi"')


def ping() -> None:
    while True:
        try:
            requests.get("https://apple.com", timeout=3)
        except:
            alert()
        finally:
            time.sleep(5)


def get_time() -> datetime:
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


if __name__ == "__main__":
    main()
