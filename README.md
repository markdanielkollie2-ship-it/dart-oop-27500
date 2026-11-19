# Dart OOP Assignment: Kigali Bus Card

**Name:** Mark Daniel Kollie
**Student ID:** 27500

## My numbers

- D = 50 (my ID ends in 00, so I used 50), L = 0
- Starting balance = 1000 + (50 x 10) = 1500 RWF
- Bus fare = 200 + 50 = 250 RWF
- Student discount = 10 + 0 = 10%

## Output of main.dart

```
Error: name too short
Owner: Mark | Balance: 1500 RWF
Owner: Mark Daniel Kollie | Balance: 1500 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 250 RWF
Paid 250 RWF
Owner: Mark Daniel Kollie | Balance: 3000 RWF
Student discount: 25 RWF
Paid 225 RWF
Owner: Mark Daniel Kollie | Balance: 1275 RWF
Student card: 10% off
```

## Part 1: Why no setter for balance?

A setter would let anyone write `card.balance = 999999` and get free money. With no setter, the balance only changes through `topUp` and `pay`, and both check the rules first.

## Part 2: What does ~/ do?

`/` gives a decimal answer. `~/` divides and drops the decimal, so you get a whole number.

- `print(237 * 17 / 100);` prints `40.29`
- `print(237 * 17 ~/ 100);` prints `40`

I need it because RWF amounts are whole numbers. For example, `250 * 10 ~/ 100` gives `25`.

## Part 4: Bug table

| Bug | The line | Why it is wrong (my words) | My fix |
|---|---|---|---|
| 1 | `String _brand;` and `int _battery;` | The fields had no starting value, and Dart needs one before the constructor runs. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child class must call the parent constructor with `super(...)` first. | Add `: super(brand, battery)` before `{` |
| 3 | `@override` above `void restart()` | `@override` needs a matching method in the parent, and `Phone` has no `restart()`. | Remove `@override` |
| 4 | `p.battery = 100;` | `battery` only had a getter, so I could not assign to it. It needed a setter. | Add `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, so you write `p.battery` without `()`. | `print(p.battery);` |

| Not a bug | Why is this line fine? |
|---|---|
| `Phone p = new Phone('Tecno', 50);` | `new` is optional in Dart. It looks old-fashioned but works fine. |

The fixed program prints `100`.

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

```
1
5
```

Was I right?

Yes. `a` ends at 1 because the setter refused -5. `b` ends at 5 because the overridden `add()` adds 2 each time (so 4), then I added 1.