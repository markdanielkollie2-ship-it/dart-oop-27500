# Dart OOP Assignment: Kigali Bus Card

**Name:** Mark Daniel Kollie
**Student ID:** 27500

## Part 5

My prediction:

```
1
5
```

Why:
- Bag `a`: `add()` makes `_items` 1. Then `a.items = -5` is refused because the setter only accepts values of 0 or more, so `_items` stays 1 and it prints 1.
- BigBag `b`: `add()` is overridden and calls `super.add()` twice, so each call adds 2. Two calls give 4. Then `b.items = b.items + 1` sets it to 5, which is allowed, so it prints 5.

Real output:

Was I right?
