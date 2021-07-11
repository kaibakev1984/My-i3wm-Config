#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import socket
import argparse
import operator
import time
import select
from contextlib import contextmanager
from subprocess import call, DEVNULL


SOCKDIR = os.environ.get("XDG_RUNTIME_DIR", "/var/tmp")
SOCKFILE = os.path.join(SOCKDIR, "polypomo.sock")
TOMATO = u"\U0001F345"
BREAK = u"\U0001F3D6"


class Exit(Exception):
    pass


class Timer:
    def __init__(self, remtime):
        self.time = remtime
        self.notified = False
        self.tick()

    def __str__(self):
        return self.format_time()

    def tick(self):
        self.previous = time.time()

    def format_time(self):
        day_factor = 86400
        hour_factor = 3600
        minute_factor = 60

        if self.time > 0:
            rem = self.time
            neg = ""
        else:
            rem = -self.time
            neg = "-"
        days = int(rem // day_factor)
        rem -= days * day_factor
        hours = int(rem // hour_factor)
        rem -= hours * hour_factor
        minutes = int(rem // minute_factor)
        rem -= minutes * minute_factor
        seconds = int(rem // 1)

        strtime = []
        if days > 0:
            strtime.append(str(days))
        if days > 0 or hours > 0:
            strtime.append("{:02d}".format(hours))

        # Always append minutes and seconds
        strtime.append("{:02d}".format(minutes))
        strtime.append("{:02d}".format(seconds))

        return neg + ":".join(strtime)

    def update(self):
        now = time.time()
        delta = now - self.previous
        self.time -= delta

        # Send a notification when timer reaches 0
        if not self.notified and self.time < 0:
            self.notified = True
            try:
                call(["notify-send", "-t", "0", "-u", "critical", "Pomodoro",
                      "Timer reached zero"], stdout=DEVNULL, stderr=DEVNULL)
            except FileNotFoundError:
                # Skip if notify-send isn't installed
                pass

    def change(self, op, seconds):
        self.time = op(self.time, seconds)


class Status:
    def __init__(self, worktime, breaktime):
        self.worktime = worktime
        self.breaktime = breaktime
        self.status = "work"  # or "break"
        self.timer = Timer(self.worktime)
        self.active = False
        self.locked = True

    def show(self):
        status = TOMATO if self.status == "work" else BREAK
        sys.stdout.write("{} {}\n".format(status, self.timer))
        sys.stdout.flush()

    def toggle(self):
        self.active = not self.active

    def toggle_lock(self):
        self.locked = not self.locked

    def update(self):
        if self.active:
            self.timer.update()
        # This ensures the timer counts time since the last iteration
        # and not since it was initialized
        self.timer.tick()

    def change(self, op, seconds):
        if self.locked:
            return

        seconds = int(seconds)
        op = operator.add if op == "add" else operator.sub
        self.timer.change(op, seconds)

    def next_timer(self):
        self.active = False

        if self.status == "work":
            self.status = "break"
            self.timer = Timer(self.breaktime)
        elif self.status == "break":
            self.status = "work"
            self.timer = Timer(self.worktime)


@contextmanager
def setup_listener():
    # If there's an existing socket, tell the other to exit and replace it
    action_exit(None)

    # If there is a socket on disk after sending an exit request, delete it
    try:
        os.remove(SOCKFILE)
    except FileNotFoundError:
        pass

    s = socket.socket(socket.AF_UNIX,
                      socket.SOCK_DGRAM)
    s.bind(SOCKFILE)

    try:
        yield s
    finally:
        s.close()
        # Don't try to delete the socket since at this point it could
        # be owned by a different process
        # try:
        #     os.remove(SOCKFILE)
        # except FileNotFoundError:
        #     pass


@contextmanager
def setup_client():
    # creates socket object
    s = socket.socket(socket.AF_UNIX,
                      socket.SOCK_DGRAM)

    s.connect(SOCKFILE)

    try:
        yield s
    finally:
        s.close()

    # tm = s.recv(1024)  # msg can only be 1024 bytes long


def wait_for_socket_cleanup(tries=20, wait=0.5):
    for i in range(tries):
        if not os.path.isfile(SOCKFILE):
            return True
        else:
            time.sleep(wait)

    return False


def check_actions(sock, status):
    timeout = time.time() + 0.9

    data = ""

    while True:
        ready = select.select([sock], [], [], .2)
        if time.time() > timeout:
            break
        if ready[0]:
            try:
                data = sock.recv(1024)
                if data:
                    break
            except socket.error as e:
                # TODO replace this by logging
                print('Lost connection to client. Printing buffer...', e)
                break

    if not data:
        return

    action = data.decode("utf8")
    if action == "toggle":
        status.toggle()
    elif action == "end":
        status.next_timer()
    elif action == "lock":
        status.toggle_lock()
    elif action.startswith("time"):
        _, op, seconds = action.split(" ")
        status.change(op, seconds)
    elif action == "exit":
        raise Exit()


def action_display(args):
    # TODO logging = print("Running display", args)

    status = Status(args.worktime, args.breaktime)

    # Listen on socket
    with setup_listener() as sock:
        while True:
            status.show()
            status.update()
            try:
                check_actions(sock, status)
            except Exit:
                print("Received exit request...")
                break


def action_toggle(args):
    # TODO logging = print("Running toggle", args)
    with setup_client() as s:
        msg = "toggle"
        s.send(msg.encode("utf8"))


def action_end(args):
    # TODO logging = print("Running end", args)
    with setup_client() as s:
        msg = "end"
        s.send(msg.encode("utf8"))


def action_lock(args):
    # TODO logging = print("Running lock", args)
    with setup_client() as s:
        msg = "lock"
        s.send(msg.encode("utf8"))


def action_time(args):
    # TODO logging = print("Running time", args)
    with setup_client() as s:
        msg = "time " + " ".join(args.delta)
        s.send(msg.encode("utf8"))


def action_exit(args):
    # TODO logging = print("Running exit", args)
    try:
        with setup_client() as s:
            msg = "exit"
            s.send(msg.encode("utf8"))
    except (FileNotFoundError, ConnectionRefusedError) as e:
        print("No instance is listening, error:", e)
    else:
        if not wait_for_socket_cleanup():
            print("Socket was not removed, assuming it's stale")


class ValidateTime(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        if values[0] not in '-+':
            parser.error("Time format should be +num or -num to add or remove time, respectively")
        if not values[1:].isdigit():
            parser.error("Expected number after +/- but saw '{}'".format(values[1:]))

        # action = operator.add if values[0] == '+' else operator.sub
        # value = int(values[1:])
        action = "add" if values[0] == '+' else "sub"
        value = values[1:]

        setattr(namespace, self.dest, (action, value))


def parse_args():
    parser = argparse.ArgumentParser(
        description="Pomodoro timer to be used with polybar")
    # Display - main loop showing status
    parser.add_argument("--worktime",
                        type=int,
                        default=25 * 60,
                        help="Default work timer time in seconds")
    parser.add_argument("--breaktime",
                        type=int,
                        default=3 * 60,
                        help="Default break timer time in seconds")
    parser.set_defaults(func=action_display)

    sub = parser.add_subparsers()

    # start/stop timer
    toggle = sub.add_parser("toggle",
                            help="start/stop timer")
    toggle.set_defaults(func=action_toggle)

    # end timer
    end = sub.add_parser("end",
                         help="end current timer")
    end.set_defaults(func=action_end)

    # lock timer changes
    lock = sub.add_parser("lock",
                          help="lock time actions - prevent changing time")
    lock.set_defaults(func=action_lock)

    # lock timer changes
    exit = sub.add_parser("exit",
                          help="exit any listening polypomo instances gracefully")
    exit.set_defaults(func=action_exit)

    # change timer
    time = sub.add_parser("time",
                          help="add/remove time to current timer")
    time.add_argument("delta",
                      action=ValidateTime,
                      help="Time to add/remove to current timer (in seconds)")
    time.set_defaults(func=action_time)

    return parser.parse_args()


def main():
    args = parse_args()
    args.func(args)


if __name__ == "__main__":
    main()

# vim: ai sts=4 et sw=4
