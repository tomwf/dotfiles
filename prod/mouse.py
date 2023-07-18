from pyautogui import move, FAILSAFE

print("Press Ctrl+C to stop")
try:
    FAILSAFE = True
    while True:
        move(50, 0)
        move(0, 50)
        move(-50, 0)
        move(0, -50)
except KeyboardInterrupt:
    print("Stopped")
