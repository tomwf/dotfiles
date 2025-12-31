import datetime
import os
import sys
import threading
import time

import requests
from pyautogui import FailSafeException, move


def main() -> None:
    try:
        print("Press Ctrl+C to stop")
        thread = threading.Thread(target=ping, daemon=True)
        thread.start()
        start_time = time.time()
        duration = get_duration()
        while True:
            if has_time_elapsed(start_time, duration):
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


def has_time_elapsed(start_time: float, duration: float) -> bool:
    return time.time() - start_time > duration


def get_duration() -> float:
    if len(sys.argv) < 2:
        return time_until_lunch_or_end_of_shift()
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


def get_time() -> str:
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


def time_until_lunch_or_end_of_shift() -> float:
    def _is_morning_working_hours() -> bool:
        return datetime.datetime.now().hour < 13

    def _is_afternoon_working_hours() -> bool:
        return datetime.datetime.now().hour < 19 and datetime.datetime.now().minute < 30

    now = datetime.datetime.now()
    duration = 0.0
    if _is_morning_working_hours():
        lunch_break_time = datetime.datetime.combine(now, datetime.time(13))
        duration = (lunch_break_time - now).total_seconds()
    elif _is_afternoon_working_hours():
        work_end_time = datetime.datetime.combine(now, datetime.time(18, 30))
        duration = (work_end_time - now).total_seconds()
    return duration


if __name__ == "__main__":
    main()
