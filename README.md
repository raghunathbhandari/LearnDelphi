
# LearnDelphi Threading
Delphi Threading Example demonstrating how to create a timer thread that runs concurrently with the main thread without causing interruptions, and how to communicate between threads.

# Features
Multithreading: Two independent timers run in separate threads, keeping the UI responsive.
Message Passing: PostMessage is used to safely communicate between the main thread and worker threads.
Non-blocking Execution: Timers run in the background, allowing the main thread to handle UI updates without delays.

# Prerequisites
Delphi IDE: Delphi XE7 or later.
Basic understanding of Delphi Threads and Windows messaging.

# How It Works
This project uses the TThread class to run background tasks while the main thread remains responsive. Two threads simulate timers, and PostMessage is used to update the UI with thread data.

# Key Concepts
Thread Creation: Custom TTimerThread class executes a timed loop.
PostMessage: Safely passes data from threads to the main thread to update UI components.


![Screenshot_1](https://github.com/raghunathbhandari/LearnDelphi/blob/main/Threading1.png)

